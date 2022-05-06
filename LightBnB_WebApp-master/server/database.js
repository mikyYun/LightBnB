const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg')
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});
/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return pool
    .query(`SELECT * FROM users
    WHERE users.email = $1`, [email])
    .then((res) => {
        // console.log('res is :', res.rows[0].email);
        return Promise.resolve(res.rows[0]);
    })
    .catch((err) => {
      console.log('ERROR :', err);
    })
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool
    .query(`SELECT * FROM users
    WHERE users.id = $1`, [id])
    .then((res) => {
        return res.rows[0]
    })
    .catch((err) => {
      console.log('ERROR :', err);
    }) 
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  return pool.query(`
    INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3)`, [user.name, user.email, user.password])
    .then((res) => {
      res.rows[0];
    });
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return pool
    .query(`SELECT reservations.*, properties.* FROM reservations
    JOIN properties ON properties.id = property_id
    WHERE reservations.guest_id = $1
    LIMIT $2`, [guest_id, limit])
    .then((res) => {
      // res.rows -> all reservation lists for the specific users
      return res.rows
    })
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
// the following assumes that you named your connection variable `pool`
const getAllProperties = (options, limit = 10) => {

  // 1
  const queryParams = [];
  
  // 2
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id`;

// owner check
  if (options.owner_id) {
    queryParams.push(`${options.owner_id}`)
    queryString += ` AND owner_id = $${queryParams.length}`
  }

  // 3
  console.log('OPTION', options)
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += ` AND city LIKE $${queryParams.length} `;
  }
  if (options.minimum_price_per_night) {
    queryParams.push(`${options.minimum_price_per_night * 100}`)
    queryString += `AND cost_per_night >= $${queryParams.length} `
  }
  if (options.maximum_price_per_night) {
    queryParams.push(`${options.maximum_price_per_night * 100}`)
    queryString += `AND cost_per_night <= $${queryParams.length} `
  }
  queryString += `
  GROUP BY properties.id`

 if (options.minimum_rating) {
    queryParams.push(options.minimum_rating)
    queryString += ` HAVING AVG(rating) >= $${queryParams.length}`
  }

  // 4
  queryParams.push(limit);
  queryString += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};`
 
  // 5
  console.log(queryString, queryParams);

  // 6
  return pool.query(queryString, queryParams).then((res) => res.rows);
}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;




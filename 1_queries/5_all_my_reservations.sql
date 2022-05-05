-- SELECT reservations.id, properties.title, start_date, properties.cost_per_night, AVG(property_reviews.rating) FROM properties
--    JOIN reservations ON properties.id = reservations.property_id
--    JOIN property_reviews ON reservations.guest_id = property_reviews.guest_id
--    GROUP BY title
--    ORDER BY start_date ASC;

SELECT reservations.id, title, cost_per_night, reservations.start_date, AVG(rating) average_rating
   FROM reservations
   JOIN properties ON reservations.property_id = properties.id
   JOIN property_reviews ON properties.id = property_reviews.property_id
   WHERE reservations.guest_id = 1
   GROUP BY properties.id, reservations.id
   ORDER BY start_date
   LIMIT 10;
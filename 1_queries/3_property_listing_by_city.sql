-- SELECT id, title, cost_per_night FROM properties
-- GROUP BY id
-- HAVING city = 'Vancouver'

-- SELECT property_id, AVG(rating) FROM property_reviews
-- WHERE rating >= 4
-- GROUP BY property_id AS average_rating

SELECT id, title, cost_per_night, average_rating FROM properties
   JOIN (SELECT property_id, AVG(rating) average_rating FROM property_reviews
WHERE rating >= 4
GROUP BY property_id) AS averaging ON property_id = properties.id
WHERE city = 'Vancouver'
ORDER BY cost_per_night
LIMIT 10;



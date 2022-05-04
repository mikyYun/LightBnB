DROP TABLE IF EXISTS property_reviews CASCADE;

CREATE TABLE property_reviews (
   id SERIAL PRIMARY KEY NOT NULL,
   guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
   property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
   reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
   rating SMALLINT NOT NULL DEFAULT 0,
   message TEXT
);
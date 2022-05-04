DROP TABLE IF EXISTS reservations CASCADE;

CREATE TABLE reservations(
   id SERIAL PRIMARY KEY NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
   guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);
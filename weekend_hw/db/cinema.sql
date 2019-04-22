DROP TABLE tickets;
DROP TABLE showtimes;
DROP TABLE films;
DROP TABLE customers;


CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4,
  number_of_tickets INT4
);

CREATE TABLE showtimes(
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  showtime VARCHAR(255),
  max_capacity INT4
);

-- CREATE TABLE tickets(
--   id SERIAL4 PRIMARY KEY,
--   customer_id INT4  REFERENCES customers(id) ON DELETE CASCADE,
--   film_id INT4 REFERENCES films(id) ON DELETE CASCADE
-- );

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4  REFERENCES customers(id) ON DELETE CASCADE,
  showtime_id INT4 REFERENCES showtimes(id) ON DELETE CASCADE
);

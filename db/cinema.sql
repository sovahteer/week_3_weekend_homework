DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS tickets;

CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR (255),
  funds INT4
);

CREATE TABLE films(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR (255),
  price INT4
);

CREATE TABLE tickets(
  id serial8 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id),
  film_id INT4 REFERENCES films(id)
);

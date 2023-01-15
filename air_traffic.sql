-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  country_id INTEGER REFERENCES countries(id)
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_id INTEGER REFERENCES cities(id),
  to_id INTEGER REFERENCES cities(id)
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers(id),
  seat TEXT NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  flight_id INTEGER REFERENCES flights(id)
);

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('United Kingdom'),
  ('Japan'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities
  (name, country_id)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 3),
  ('London', 2),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Mexico City', 4),
  ('Paris', 5),
  ('Casablanca', 6),
  ('Dubai', 7),
  ('Beijing', 8),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 9),
  ('Santiago', 10);

INSERT INTO flights
  (departure, arrival, from_id, to_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 8, 9),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 10, 11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 12, 13),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 14, 15),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 13, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 18);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO tickets
  (passenger_id, seat, airline_id, flight_id)
VALUES
  (1, '33B', 1, 1),
  (2, '8A', 2, 2),
  (3, '12F', 3, 3),
  (1, '20A', 3, 4),
  (4, '23D', 4, 5),
  (2, '18C', 5, 6),
  (5, '9E', 1, 7),
  (6, '1A', 6, 8),
  (5, '32B', 6, 9),
  (7, '10D', 7, 10);
DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_restaurant_staff
( 
    employee_no VARCHAR,
    full_name VARCHAR,
    job_code VARCHAR,
    job_title VARCHAR,
    employment VARCHAR
);



INSERT INTO nc_restaurant_staff
    (employee_no, full_name, job_code, job_title, employment)
VALUES
('NC0001', 'Gordon Ramsay', 'J001', 'Head Chef', 'Full-time'),
('NC0002', 'Jamie Oliver', 'J004', 'Waiter', 'Part-time'),
('NC0003', 'Rachael Ray', 'J002', 'Chef', 'Full-time'),
('NC0004', 'Wolfgang Puck', 'J003', 'Bartender', 'Full-time'),
('NC0005', 'Giada De Laurentiis', 'J004', 'Waiter', 'Full-time'),
('NC0006', 'Alan Ducasse', 'J004', 'Waiter', 'Part-time'),
('NC0007', 'Anne Burrell', 'J002', 'Chef', 'Full-time'),
('NC0008', 'David Chang', 'J002', 'Chef', 'Part-time'),
('NC0009', 'Guy Fieri', 'J003', 'Bartender', 'Part-time');


SELECT * FROM nc_restaurant_staff;

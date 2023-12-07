DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE job_codes
(
    job_code VARCHAR PRIMARY KEY,
    job_title VARCHAR
);

INSERT INTO job_codes
    (job_code, job_title)
VALUES
    ('J001', 'Head Chef'),
    ('J002', 'Chef'),
    ('J003', 'Bartender'),
    ('J004', 'Waiter');


CREATE TABLE employments
(
    employment_id SERIAL PRIMARY KEY,
    employment_type VARCHAR UNIQUE
);

INSERT INTO employments (employment_type)
VALUES
    ('Full-time'),
    ('Part-time');


CREATE TABLE nc_restaurant_employees
( 
    employee_no VARCHAR PRIMARY KEY,
    full_name VARCHAR,
    job_code VARCHAR REFERENCES job_codes(job_code),
    employment_id INT REFERENCES employments(employment_id)
);


INSERT INTO nc_restaurant_employees
    (employee_no, full_name, job_code, employment_id)
VALUES
    ('NC0001', 'Gordon Ramsay', 'J001', 1),
    ('NC0002', 'Jamie Oliver', 'J004', 2),
    ('NC0003', 'Rachael Ray', 'J002', 1),
    ('NC0004', 'Wolfgang Puck', 'J003', 1),
    ('NC0005', 'Giada De Laurentiis', 'J004', 1),
    ('NC0006', 'Alan Ducasse', 'J004', 2),
    ('NC0007', 'Anne Burrell', 'J002', 1),
    ('NC0008', 'David Chang', 'J002', 2),
    ('NC0009', 'Guy Fieri', 'J003', 2);

SELECT * FROM job_codes;
SELECT * FROM employments;
SELECT * FROM nc_restaurant_employees;

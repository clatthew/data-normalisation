-- DO NOT CHANGE THIS CODE

DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_restaurant_employees_2NF
( 
    employee_no VARCHAR PRIMARY KEY,
    full_name VARCHAR,
    employment VARCHAR,
    shift VARCHAR
);


INSERT INTO nc_restaurant_employees_2NF
    (employee_no, full_name, employment, shift)
VALUES
('NC0001', 'Gordon Ramsay', 'Full-time', 'All Day'),
('NC0002', 'Jamie Oliver', 'Part-time', 'Evening'),
('NC0003', 'Rachael Ray', 'Full-time', 'All Day'),
('NC0004', 'Wolfgang Puck', 'Full-time', 'All Day'),
('NC0005', 'Giada De Laurentiis', 'Full-time', 'All Day'),
('NC0006', 'Alan Ducasse', 'Part-time', 'Evening'),
('NC0007', 'Anne Burrell', 'Full-time', 'All Day'),
('NC0008', 'David Chang', 'Part-time', 'Evening'),
('NC0009', 'Guy Fieri', 'Part-time', 'Evening');

CREATE TABLE employee_jobs_2NF
(
    employee_no VARCHAR,
    job_title VARCHAR,
    PRIMARY KEY (employee_no, job_title),
    FOREIGN KEY (employee_no) REFERENCES nc_restaurant_employees_2NF(employee_no)
);

INSERT INTO employee_jobs_2NF
    (employee_no, job_title)
VALUES
('NC0001', 'Head Chef'),
('NC0001', 'Owner'),
('NC0002', 'Waiter'),
('NC0003', 'Chef'),
('NC0004', 'Bartender'),
('NC0004', 'Dishwasher'),
('NC0005', 'Waiter'),
('NC0005', 'Dishwasher'),
('NC0006', 'Waiter'),
('NC0006', 'Bartender'),
('NC0007', 'Chef'),
('NC0008', 'Chef'),
('NC0009','Bartender');

SELECT * FROM nc_restaurant_employees_2NF;
SELECT * FROM employee_jobs_2NF;

-- CREATE NEW TABLES HERE:

CREATE TABLE employment_types AS
SELECT DISTINCT
    employment
    , shift
FROM nc_restaurant_employees_2NF;

ALTER TABLE employment_types
ADD type_id SERIAL PRIMARY KEY;

SELECT * FROM employment_types;

SELECT * FROM employee_jobs_2NF;

-- CREATE TABLE employee_employment AS
-- SELECT
--     employee_no
--     , type_id AS employment_type_id
-- FROM nc_restaurant_employees_2NF JOIN employment_types
--     USING (employment, shift);

-- ALTER TABLE employee_employment
-- ADD PRIMARY KEY (employee_no);

-- SELECT * FROM employee_employment;

CREATE TABLE employees AS
SELECT
    employee_no
    , full_name
    , type_id AS employment_type_id
FROM nc_restaurant_employees_2NF JOIN employment_types
    USING (employment, shift);

ALTER TABLE employees
ADD PRIMARY KEY (employee_no);

SELECT * FROM employees;
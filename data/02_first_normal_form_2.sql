-- DO NOT CHANGE THIS CODE

DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_mentors
( 
    employee_id INT PRIMARY KEY,
    mentor_name VARCHAR,
    department VARCHAR,
    location VARCHAR
);

INSERT INTO nc_mentors
    (employee_id, mentor_name, department, location)
VALUES
    (1, 'Rose', 'Software', 'Manchester'),
    (2, 'Eli', 'Software, Data', 'Manchester'),
    (3, 'Haz', 'Cloud, Data', 'Manchester'),
    (4, 'Jim', 'Software', 'Leeds'),
    (5, 'John', 'CLoud', 'Manchester'),
    (6, 'Edd', 'Data, Software, Cloud', 'Leeds');

SELECT * FROM nc_mentors;

-- CREATE NEW TABLES HERE:

CREATE TABLE nc_mentors_1nf AS
SELECT
    employee_id
    , mentor_name
    , UNNEST(STRING_TO_ARRAY(department, ', ')) AS department
    , "location"
FROM nc_mentors;

ALTER TABLE nc_mentors_1nf
ADD PRIMARY KEY (employee_id, department);

SELECT * FROM nc_mentors_1nf;

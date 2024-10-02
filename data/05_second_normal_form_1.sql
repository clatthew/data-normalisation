-- DO NOT CHANGE THIS CODE

DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_classroom_1NF
( 
    student_no INT,
    mentor VARCHAR,
    classroom VARCHAR,
    subject VARCHAR,
    PRIMARY KEY (student_no, subject)
);

INSERT INTO nc_classroom_1NF
    (student_no, mentor, classroom, subject)
VALUES
('10456', 'Rose', 'Zoom_12', 'Maths'),
('10456', 'Rose', 'Zoom_12', 'Science'),
('10456', 'Rose', 'Zoom_12', 'English'),
('10839', 'Haz', 'Zoom_08', 'English'),
('10839', 'Haz', 'Zoom_08', 'Art'),
('10839', 'Haz', 'Zoom_08', 'P.E.'),
('10931', 'Rose', 'Zoom_12', 'Music'),
('10931', 'Rose', 'Zoom_12', 'French'),
('10931', 'Rose', 'Zoom_12', 'Business'),
('11525', 'Liam', 'Zoom_15', 'I.T.'),
('11525', 'Liam', 'Zoom_15', 'Art'),
('12633', 'Haz', 'Zoom_08', 'Science'),
('12633', 'Haz', 'Zoom_08', 'P.E.'),
('12633', 'Haz', 'Zoom_08', 'I.T.');


SELECT * FROM nc_classroom_1NF;

-- CREATE NEW TABLES HERE:

CREATE TABLE mentors AS
SELECT DISTINCT
    mentor as mentor_name
    , classroom
FROM nc_classroom_1NF;

ALTER TABLE mentors
ADD PRIMARY KEY (mentor_name);

SELECT * FROM mentors;

CREATE TABLE students AS
SELECT
    student_no
    , mentor
    , subject
FROM nc_classroom_1NF;

ALTER TABLE students
ADD PRIMARY KEY (student_no, subject);

SELECT * FROM students;
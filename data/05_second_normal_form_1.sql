DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_classroom
( 
    student_no INT,
    mentor VARCHAR,
    classroom VARCHAR,
    subject VARCHAR
);

INSERT INTO nc_classroom
    (student_no, mentor, classroom, subject)
VALUES
('10456', 'Rose', 'Zoom_12', 'Maths'),
('10456', 'Rose', 'Zoom_12', 'Science'),
('10456', 'Rose', 'Zoom_12', 'English'),
('10839', 'Haz', 'Zoom_08', 'English'),
('10839', 'Haz', 'Zoom_08', 'Art'),
('10839', 'Haz', 'Zoom_08', 'P.E.'),
('10931', 'Jim', 'Zoom_03', 'Music'),
('10931', 'Jim', 'Zoom_03', 'French'),
('10931', 'Jim', 'Zoom_03', 'Business'),
('11525', 'Liam', 'Zoom_15', 'I.T.'),
('11525', 'Liam', 'Zoom_15', 'Art'),
('12633', 'Paul', 'Zoom_05', 'Science'),
('12633', 'Paul', 'Zoom_05', 'P.E.'),
('12633', 'Paul', 'Zoom_05', 'I.T.');


SELECT * FROM nc_classroom;

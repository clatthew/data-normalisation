DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_students
(
    student_id INT PRIMARY KEY,
    student_name VARCHAR
);

CREATE TABLE subjects
(
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR
);

CREATE TABLE exam_results
(
    score_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    score INT,
    teacher VARCHAR,
    FOREIGN KEY (student_id) REFERENCES nc_students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

INSERT INTO nc_students (student_id, student_name)
VALUES
(30058, 'Alex'),
(40254, 'Simon'),
(50183, 'Kyle'),
(60825, 'Danika');

INSERT INTO subjects (subject_name)
VALUES
('History'),
('Maths'),
('Science'),
('Geography'),
('Business');

INSERT INTO exam_results
    (score_id, student_id, subject_id, score, teacher)
VALUES
(1, 30058, 1, 75, 'Prof Mulvey'),
(2, 30058, 2, 82, 'Prof Copley'),
(3, 40254, 3, 76, 'Prof Baines'),
(4, 40254, 4, 99, 'Prof Aldred'),
(5, 40254, 2, 88, 'Prof Copley'),
(6, 50183, 1, 83, 'Prof Mulvey'),
(7, 50183, 5, 86, 'Prof Crawley'),
(8, 60825, 3, 93, 'Prof Baines');


SELECT * FROM nc_students;
SELECT * FROM subjects;
SELECT * FROM exam_results;
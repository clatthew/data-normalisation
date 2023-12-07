DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_vegetables
( 
    product_id INT,
    vegetable VARCHAR,
    colour VARCHAR,
    size VARCHAR,
    price FLOAT
);

INSERT INTO nc_vegetables
    (product_id, vegetable, colour, size, price)
VALUES
(1, 'Peppers', 'Red', 'Medium', 0.80),
(2, 'Peppers', 'Green', 'Medium', 0.80),
(3, 'Peppers', 'Yellow', 'Medium', 0.80),
(4, 'Onions', 'Red', 'Small', 0.50),
(5, 'Onions', 'Brown', 'Medium', 0.80),
(6, 'Onions', 'Brown', 'Large', 1.20),
(7, 'Tomatoes', 'Red', 'Medium', 0.80),
(8, 'Tomatoes', 'Green', 'Medium', 0.60),
(9, 'Tomatoes', 'Yellow', 'Small', 0.30);


SELECT * FROM nc_vegetables;

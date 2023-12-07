DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE products
( 
    product_id SERIAL PRIMARY KEY,
    vegetable VARCHAR
);

INSERT INTO products
    (vegetable)
VALUES
    ('Peppers'),
    ('Onions'),
    ('Tomatoes');


CREATE TABLE nc_vegetables_data
( 
    entry_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    colour VARCHAR,
    size VARCHAR,
    price FLOAT
);


INSERT INTO nc_vegetables_data
    (product_id, colour, size, price)
VALUES
    (1, 'Red', 'Medium', 0.80),
    (1, 'Green', 'Medium', 0.80),
    (1, 'Yellow', 'Medium', 0.80),
    (2, 'Red', 'Small', 0.50),
    (2, 'Brown', 'Medium', 0.80),
    (2, 'Brown', 'Large', 1.20),
    (3, 'Red', 'Medium', 0.80),
    (3, 'Green', 'Medium', 0.60),
    (3, 'Yellow', 'Small', 0.30);


SELECT * FROM products;
SELECT * FROM nc_vegetables_data;

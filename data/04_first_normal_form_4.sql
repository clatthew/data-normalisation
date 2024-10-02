-- DO NOT CHANGE THIS CODE

DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_rentals
( 
    full_name VARCHAR PRIMARY KEY,
    title VARCHAR,
    preferred_name VARCHAR,
    address VARCHAR,
    movies_rented VARCHAR
);

INSERT INTO nc_rentals
    (full_name, title, preferred_name, address, movies_rented)
VALUES
('Natasha Romanoff', 'Ms', 'Black Widow', 'Soul Stone',	'Her, Lucy, Ghost in the Shell'),
('Tony Stark', 'Mr', 'Ironman' , 'Stark Tower',	'Sherlock Holmes'),
('Steve Rogers','Mr','Captain America',	'Iceburg', 'The Gray Man, Knives Out'),
('Wanda Maximoff', 'Ms', 'Scarlet Witch', 'Asylum',	'Wind River, Wandavision'),
('Thor Odinson','Mr' ,'Thor','New Asgard', 'Men In Black, Extraction'),
('Bruce Banner'	, 'Mr',	'Hulk',	'Champion''s Quarters',	'Shutter Island, Begin Again, Dark Waters');


SELECT * FROM nc_rentals;

-- CREATE NEW TABLES HERE:

CREATE TABLE nc_rentals_1nf AS
SELECT
    full_name
    , title
    , preferred_name
    , "address"
    , UNNEST(STRING_TO_ARRAY(movies_rented, ', ')) AS movie
FROM nc_rentals;

ALTER TABLE nc_rentals_1nf
ADD PRIMARY KEY (full_name, movie);

SELECT * FROM nc_rentals_1nf;
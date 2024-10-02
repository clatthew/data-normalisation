\c topmodelsql;

CREATE TABLE locations_3nf AS
SELECT DISTINCT
    area
FROM
    models_2nf;

ALTER TABLE locations_3nf
ADD location_id SERIAL PRIMARY KEY;

CREATE TABLE traits_3nf AS
SELECT DISTINCT
    trait
FROM    
    models_2nf;

ALTER TABLE traits_3nf
ADD trait_id SERIAL PRIMARY KEY;

CREATE TABLE categories_3nf AS
SELECT DISTINCT
    category
FROM    
    models_2nf;

ALTER TABLE categories_3nf
ADD category_id SERIAL PRIMARY KEY;

CREATE TABLE events_3nf AS
SELECT
    next_event_date AS date
    , revenue
    , model_id
FROM    
    models_2nf;

ALTER TABLE events_3nf
ADD event_id SERIAL PRIMARY KEY;

CREATE TABLE models_3nf AS
SELECT
    model_id
    , model_name
    , location_id
    , price_per_event
    , category_id
    , trait_id
FROM models_2nf
JOIN locations_3nf
    USING (area)
JOIN categories_3nf
    USING (category)
JOIN traits_3nf
    USING (trait);

ALTER TABLE models_3nf
ADD PRIMARY KEY (model_id);

SELECT * FROM locations_3nf;
SELECT * FROM traits_3nf;
SELECT * FROM categories_3nf;
SELECT * FROM events_3nf;
SELECT * FROM models_3nf;
\c topmodelsql;

CREATE TABLE areas_3nf AS
SELECT DISTINCT
    area
FROM
    models_2nf;

ALTER TABLE areas_3nf
ADD area_id SERIAL PRIMARY KEY;

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
    , area_id
    , price_per_event
    , category_id
    , trait_id
FROM models_2nf
JOIN areas_3nf
    USING (area)
JOIN categories_3nf
    USING (category)
JOIN traits_3nf
    USING (trait);

ALTER TABLE models_3nf
ADD PRIMARY KEY (model_id);

-- SELECT * FROM model_jobs_2nf;

CREATE TABLE brands_3nf AS
SELECT DISTINCT
    brand as brand_name
FROM model_jobs_2nf;

ALTER TABLE brands_3nf
ADD brand_id SERIAL PRIMARY KEY;

CREATE TABLE brand_relationships_3nf AS
SELECT DISTINCT
    model_id
    , brand_id
FROM model_jobs_2nf
JOIN brands_3nf
    ON model_jobs_2nf.brand = brands_3nf.brand_name;

ALTER TABLE brand_relationships_3nf
ADD PRIMARY KEY (model_id, brand_id);

SELECT * FROM areas_3nf;
SELECT * FROM traits_3nf;
SELECT * FROM categories_3nf;
SELECT * FROM events_3nf;
SELECT * FROM models_3nf;
SELECT * FROM brands_3nf;
SELECT * FROM brand_relationships_3nf;

\d
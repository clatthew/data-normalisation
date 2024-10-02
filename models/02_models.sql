\c topmodelsql;

CREATE TABLE models_2nf AS
SELECT DISTINCT
    model_id
    , model_name
    , area
    , price_per_event
    , category
    , trait
    , next_event_date
    , revenue
FROM models_1nf;

ALTER TABLE models_2nf
ADD PRIMARY KEY (model_id);

CREATE TABLE model_jobs_2nf AS
SELECT
    model_id
    , brand
FROM models_1nf;

ALTER TABLE model_jobs_2nf
ADD PRIMARY KEY (model_id, brand);

SELECT * FROM models_2nf;
SELECT * FROM model_jobs_2nf;
\c topmodelsql;

\echo '\nA new brand, ''Atlantis Doromania'', has hit the scene and wants to work with all models from London.'

INSERT INTO brands_3nf (brand_name)
VALUES ('Atlantis Doromania');

SELECT * FROM brands_3nf WHERE brand_name = 'Atlantis Doromania';

INSERT INTO brand_relationships_3nf(brand_id, model_id)
SELECT 36, model_id
FROM models_3nf JOIN agents_3nf
    USING (agent_id)
JOIN areas_3nf
    USING (area_id)
WHERE
    area_name = 'London';

SELECT brand_name, model_name, area_name
FROM brand_relationships_3nf
JOIN brands_3nf
    USING (brand_id)
JOIN models_3nf
    USING (model_id)
JOIN agents_3nf
    USING (agent_id)
JOIN areas_3nf
    USING (area_id)
WHERE brand_id = 36;

\echo '\nVerity has too much work and needs an assistant in their area.\nUpdate the agents table to reflect the new team member.\nVerity''s assistant will take over the models that work for Dior.'

INSERT INTO agents_3nf (agent_name, area_id)
SELECT
    'Verity''s assistant'
    , area_id
FROM agents_3nf
WHERE agent_name = 'Verity';

\echo '\nAgents and their locations:'
SELECT agent_name, area_name
FROM agents_3nf JOIN areas_3nf
    USING (area_id);

UPDATE models_3nf
SET agent_id = (SELECT agent_id FROM agents_3nf
                    WHERE agent_name = 'Verity''s assistant')
WHERE model_id IN (SELECT model_id
                    FROM brand_relationships_3nf
                    JOIN models_3nf
                        USING (model_id)
                    JOIN brands_3nf
                        USING (brand_id)
                    JOIN agents_3nf
                        USING (agent_id)
                    WHERE brand_name = 'Dior'
                    AND agent_name = 'Verity');

\echo '\nModels doing work with Dior:'
SELECT model_name, agent_name, area_name
FROM models_3nf
JOIN brand_relationships_3nf
    USING (model_id)
JOIN brands_3nf
    USING (brand_id)
JOIN agents_3nf
    USING (agent_id)
JOIN areas_3nf
    USING (area_id)
WHERE brand_name = 'Dior';

\echo 'Sam Pagne has been dropped by Harrods due to questionable social media posts about Bounties in Celebrations.\nUpdate the data accordingly.'

\echo '\nSam Pagne''s existing brand relationships:'
SELECT model_name, brand_name
FROM brand_relationships_3nf
JOIN models_3nf
    USING (model_id)
JOIN brands_3nf
    USING (brand_id)
WHERE model_name = 'Sam Pagne';

DELETE FROM brand_relationships_3nf
WHERE
    brand_id = (SELECT brand_id FROM brands_3nf WHERE brand_name = 'Harrods')
AND
    model_id = (SELECT model_id FROM models_3nf WHERE model_name = 'Sam Pagne');

\echo 'Sam Pagne''s updated brand relationships:'
SELECT model_name, brand_name
FROM brand_relationships_3nf
JOIN models_3nf
    USING (model_id)
JOIN brands_3nf
    USING (brand_id)
WHERE model_name = 'Sam Pagne';

\echo 'A new model has hit the scene and will be working with Rose and Aldi.\nThey''re a fan of the central aisle of delights and charge just £20 per event.\nTheir rating is 4 and their trait is Browser.\nUpdate the data accordingly.'

\echo '\nBefore insert: searching for models with trait ''browser'':'
SELECT model_name, agent_name, price_per_event, rating, trait
FROM models_3nf
JOIN agents_3nf
    USING (agent_id)
JOIN traits_3nf
    USING (trait_id)
WHERE trait = 'browser';

INSERT INTO traits_3nf
    (trait)
VALUES
    ('browser');

INSERT INTO models_3nf(model_name, agent_id, price_per_event, rating)
SELECT 'Cuthbert', agent_id, 20, 4
FROM agents_3nf
WHERE agent_name = 'Rose';

UPDATE models_3nf
SET trait_id = (SELECT trait_id FROM traits_3nf WHERE trait = 'browser')
WHERE model_name = 'Cuthbert';

\echo '\nAfter insert:'
SELECT model_name, agent_name, price_per_event, rating, trait
FROM models_3nf
JOIN agents_3nf
    USING (agent_id)
JOIN traits_3nf
    USING (trait_id)
WHERE trait = 'browser';

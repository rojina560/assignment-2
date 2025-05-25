-- Active: 1747836265435@@127.0.0.1@5433@conservation_db
--1--
INSERT into rangers(name, region)VALUES
( 'Derek Fox',  'Coastal Plains');
--2--
 SELECT count (DISTINCT species_id ) AS unique_species_count
FROM sightings;
--3--
SELECT *
FROM sightings
WHERE location LIKE '%Pass%';
--4--
 SELECT name, COUNT(*) AS total_sightings
FROM rangers
JOIN sightings on rangers.ranger_id = sightings.ranger_id
GROUP BY name;
--5--
SELECT common_name
FROM species
WHERE species_id NOT IN (
  SELECT DISTINCT species_id FROM sightings
);
--6--
SELECT species.common_name, sightings.sighting_time, rangers.name
FROM sightings
JOIN species ON sightings.species_id = species.species_id
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC
LIMIT 2;
--7--
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';
--8--
SELECT sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;

--9--
DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);













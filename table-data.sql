-- Active: 1747836265435@@127.0.0.1@5433@conservation_db

CREATE table rangers(
    ranger_id serial PRIMARY KEY,
    name VARCHAR (50) not null,
    region VARCHAR(100)

    
);
 INSERT into rangers(name,region)values
 ('Alice Green','Northern Hills'),
 ('Bob White','River Delta'),
 ('Carol King','Mountain Range');

create table  species (
    species_id SERIAL PRIMARY key,
    common_name VARCHAR (50),
    scientific_name   VARCHAR(100),
    discovery_date DATE,
     conservation_status VARCHAR(50) 

);
insert into species (common_name,scientific_name,discovery_date, conservation_status) values
( 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
( 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
( 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
( 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * from species;
drop table species

CREATE TABLE sightings (
    sighting_id INT PRIMARY KEY,
    ranger_id INT,
    species_id INT,
    sighting_time TIMESTAMP,
    location VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes)
VALUES 
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


SELECT * from  sightings ;
drop table  sightings  ;
/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals 
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals 
WHERE neutered=TRUE AND escape_attempts<3;

SELECT date_of_birth FROM animals 
WHERE name='Agumon' OR  name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;

SELECT * FROM animals WHERE neutered=TRUE;

SELECT * from animals
WHERE NOT name='Gabumon';

SELECT * from animals 
WHERE weight_kg>=10.4 AND weight_kg<=17.3;


SELECT COUNT(*) from ANIMALS;
SELECT COUNT(*) from ANIMALS WHERE escape_attempts=0;
SELECT AVG(weight_kg) from ANIMALS;
SELECT MAX(escape_attempts) FROM ANIMALS;
SELECT neutered, MAX(escape_attempts) FROM ANIMALS group by neutered;
SELECT neutered, MAX(weight_kg), MIN(weight_kg) FROM ANIMALS group by neutered;

SELECT neutered, AVG(escape_attempts) FROM ANIMALS
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY neutered;


SELECT name FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';


SELECT animals.name AS Pokemon species ANIMALS
FROM animals 
JOIN species 
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners LEFT JOIN animals
ON owners.id = animals.owner_id;


SELECT species.name ,count(*) 
FROM animals join species
ON animals.species_id = species.id
GROUP BY species.name;



SELECT animals.name AS Digimon_owned_by_Jennifer_Orwell
FROM animals JOIN species
ON animals.species_id = species.id
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';



SELECT animals.name 
AS animals_owned_by_Dean_Winchester_never_tried_to_escape
FROM animals 
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;





SELECT count(animals.owner_id), owners.full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.id;


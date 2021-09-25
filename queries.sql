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





SELECT
    animals.name AS animal_name,
    date_of_visit AS last_visit_tatcher
FROM 
    animals
JOIN
     visits
ON 
    animals.id = visits.animal_id
JOIN
     vets
ON 
    vets.id = visits.vet_id
WHERE 
    vets.name='William Tatcher'
ORDER BY
     last_visit_tatcher 
DESC LIMIT 1;



-- How many different animals did Stephanie Mendez see?
SELECT
    count(*)
FROM 
    animals
JOIN
    visits
ON 
    animals.id = visits.animal_id
JOIN
    vets
ON 
    vets.id = visits.vet_id
WHERE 
    vets.name='Stephanie Mendez';


-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets 
     LEFT JOIN specializations ON specializations.vet_id = vets.id
     LEFT JOIN species ON species.id = specializations.species_id;


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.date_of_visit 
    FROM visits
     JOIN vets ON vets.id = visits.vet_id
     JOIN animals ON animals.id = visits.animal_id
    WHERE vets.name = 'Stephanie Mendez'
    AND visits.date_of_visit BETWEEN DATE'2020-04-01' AND DATE'2020-08-30';


-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.animal_id) AS NO_OF_VISITS 
    FROM visits
     JOIN vets
      ON vets.id = visits.vet_id
     JOIN animals
      ON animals.id = visits.animal_id
    GROUP BY animals.name
    ORDER BY visit_count
     DESC LIMIT 1;


-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.date_of_visit AS Maisy_Smith_first_visit
 FROM visits
     JOIN vets 
     ON vets.id = visits.vet_id
     JOIN animals
      ON animals.id = visits.animal_id
    WHERE vets.name = 'Maisy Smith'
    ORDER BY Maisy_Smith_first_visit
    LIMIT 1;


-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT
 animals.name AS animal_name, weight_kg, neutered, escape_attempts, date_of_birth AS aniaml_DOB,
 vets.name AS vet_name,
 visits.date_of_visit AS LAST_VISIT
 FROM visits
 JOIN animals on animals.id = visits.animal_id
 JOIN vets on vets.id = visits.vet_id
 ORDER BY LAST_VISIT
 DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT count(*) FROM visits JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = (
    SELECT vets.name 
    FROM vets 
    LEFT JOIN specializations ON vets.id = specializations.vet_id
    LEFT JOIN species ON specializations.species_id = species.id
    WHERE species.name IS NULL
    );

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT count(*), species.name  FROM visits 
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE vets.name='Maisy Smith'
GROUP BY species.name
LIMIT 1;






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

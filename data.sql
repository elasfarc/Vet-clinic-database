/* Populate database with sample data. */

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', DATE '2020-02-03', 10.23, TRUE, 0 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', DATE '2018-11-15', 8, TRUE, 2 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', DATE '2021-01-07', 15.04, FALSE, 1 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', DATE '2017-05-12', 11, TRUE, 5 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', DATE '2020-02-08', 11, FALSE, 0 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', DATE '2022-11-15', 5.7, TRUE, 2 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', DATE '1993-04-02', 12.13, FALSE, 3 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', DATE '2005-06-12', 45, TRUE, 1 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', DATE '2005-06-07', 20.4, TRUE, 7 );

INSERT INTO ANIMALS(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', DATE '1998-10-13', 17, TRUE, 3 );

BEGIN;

UPDATE ANIMALS
SET species='unspecified';

ROLLBACK;

BEGIN;
UPDATE ANIMALS 
SET species='digimon'
WHERE name LIKE '%mon';

UPDATE ANIMALS 
SET species='pokemon'
WHERE species IS NULL;

COMMIT;



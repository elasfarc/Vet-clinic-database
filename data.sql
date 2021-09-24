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

BEGIN;

DELETE FROM ANIMALS;

ROLLBACK;

BEGIN;
DELETE FROM ANIMALS
WHERE date_of_birth>DATE '01-01-2022';
SAVEPOINT d1;
UPDATE ANIMALS SET weight_kg=weight_kg*-1;
ROLLBACK TO d1;
UPDATE ANIMALS 
SET weight_kg=weight_kg*-1
WHERE weight_kg<0;
COMMIT;


INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);


INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

UPDATE ANIMALS 
SET species_id = CASE 
WHEN name like '%mon' THEN (select id from species where species.name = 'Digimon')
ELSE (select id from species where species.name != 'Digimon')
END;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';
COMMIT;


INSERT INTO vets(name, age, date_of_graduation) VALUES ('William Tatcher', 45, DATE '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Maisy Smith', 26, DATE '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, DATE '1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Jack Harkness', 38, DATE '2008-06-08');







/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	date_of_birth DATE ,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL(10,3)
);

ALTER TABLE animals
ADD species VARCHAR(100);

CREATE TABLE owners (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(150),
	age INT
);
CREATE TABLE species (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100)
);

ALTER TABLE animals
DROP species,
ADD species_id int,
ADD CONSTRAINT fk_animal_spe FOREIGN KEY (species_id) REFERENCES species(id),
ADD owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);


CREATE TABLE vets(
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(150),
age INT,
date_of_graduation DATE
);

CREATE TABLE specializations(
vet_id INT, 
species_id INT, 
FOREIGN KEY (vet_id) REFERENCES vets(id),
FOREIGN KEY (species_id) REFERENCES species(id),
PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits(
vet_id INT, 
animal_id INT,
date_of_visit DATE, 
FOREIGN KEY (vet_id) REFERENCES vets (id),
FOREIGN KEY (animal_id) REFERENCES animals (id),
PRIMARY KEY (vet_id, animal_id, date_of_visit)
);

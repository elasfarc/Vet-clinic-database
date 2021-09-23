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
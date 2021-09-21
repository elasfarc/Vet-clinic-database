/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name CHAR(100),
	date_of_birth DATE ,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL(10,3)
);

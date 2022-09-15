/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- TRANSACTONS
BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;
-----
BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;
-----
-- Hold Breath
BEGIN;

DELETE FROM animals;

ROLLBACK;
-- Continue Breathing
-----


-- QUERIES (2)
-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals 
WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) FROM animals 
GROUP BY neutered;

-- Query the minimum weight of the types of animals
SELECT MIN(weigth_kg) FROM animals;

-- Query the maximum weight of the types of animals
SELECT MAX(weigth_kg) FROM  animals;

-- Query the average number of escape attempts of animals born between 1990 and 2000
SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

-- QUERIES (3) USING JOIN
-- What animals belong to Melody Pond?
SELECT animals.name animals_owned FROM animals
JOIN owners ON owners.id = animals.owner_id  AND owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name, species.name type FROM animals
JOIN species ON species.id = animals.species_id AND species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(animals.name) FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals
JOIN owners ON owners.full_name = 'Jennifer Orwell' AND owners.id = animals.owner_id
JOIN species ON species.name = 'Digimon' AND species.id = animals.species_id;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name, animals.name FROM owners
JOIN animals ON animals.owner_id = owners.id 
  AND owners.full_name = 'Dean Winchester'
  AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name AS owner, COUNT(animals.name) AS animal_count FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owner
ORDER BY animal_count DESC LIMIT 1;
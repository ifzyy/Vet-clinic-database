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

-- QUERIES (4)
-- Who was the last animal seen by William Tatcher?
SELECT * FROM visits
WHERE vet = 'William Tatcher'
ORDER BY date_visited DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vet, COUNT(animal) FROM visits
GROUP BY vet
HAVING vet = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, specializations.specie FROM vets
LEFT JOIN specializations ON specializations.vet = vets.name;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT * FROM visits
WHERE vet = 'Stephanie Mendez' AND (date_visited BETWEEN '2020-04-01' AND '2020-08-30');

-- What animal has the most visits to vets?
SELECT animal, COUNT(date_visited) FROM visits
GROUP BY animal
ORDER BY COUNT(date_visited) DESC limit 1;

-- Who was Maisy Smith's first visit?
SELECT visits.animal from visits
WHERE vet = 'Maisy Smith' 
ORDER BY date_visited LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT '' as animal_info, animals.*, '' as vet_info, vets.*, date_visited FROM visits
JOIN animals ON animals.name = visits.animal
JOIN vets ON vets.name = visits.vet 
ORDER BY date_visited DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) as visit_count FROM visits
WHERE visits.vet = (
  SELECT vets.name as VETS_NAME FROM vets -- vets without specializations
  LEFT JOIN specializations ON specializations.vet = vets.name
  WHERE specie IS NULL
);

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT animals.name as highest_visiting_animal, species.name as specie FROM animals
JOIN species ON species.id = animals.species_id
WHERE animals.name = (
  SELECT animal as highest_visiting_animal FROM visits -- Maisy's highest visiting animal
  WHERE vet = 'Maisy Smith'
  GROUP BY animal
  ORDER BY COUNT(*) DESC LIMIT 1
);

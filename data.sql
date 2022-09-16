/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8.0);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11.0);
INSERT INTO animals VALUES(5, 'Charmander', '2020-02-08', 0, FALSE, -11.0);
INSERT INTO animals VALUES(6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals VALUES(7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals VALUES(8, 'Angemon', '2005-06-12', 1, TRUE, -45.0);
INSERT INTO animals VALUES(9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals VALUES(10, 'Blossom', '1998-10-13', 3, TRUE, 17.0);
INSERT INTO animals VALUES(11, 'Ditto', '2022-05-14', 4, TRUE, 22.0);

INSERT INTO OWNERS (full_name, age)

VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name)

VALUES
    ('Pokemon'),
    ('Digimon');


UPDATE animals SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets
  (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-27'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations
VALUES
  ('William Tatcher', 'Pokemon'),
  ('Stephanie Mendez', 'Digimon'),
  ('Stephanie Mendez', 'Pokemon'),
  ('Jack Harkness', 'Digimon');

INSERT INTO VISITS
VALUES
  ('William Tatcher', 'Agumon', '2020-05-24'),
  ('Stephanie Mendez', 'Agumon', '2020-07-22'),
  ('Jack Harkness', 'Gabumon', '2021-02-02'),
  ('Maisy Smith', 'Pikachu', '2020-01-05'),
  ('Maisy Smith', 'Pikachu', '2020-03-08'),
  ('Maisy Smith', 'Pikachu', '2020-05-14'),
  ('Stephanie Mendez', 'Devimon', '2021-05-04'),
  ('Jack Harkness', 'Charmander', '2021-02-24'),
  ('Maisy Smith', 'Plantmon', '2019-12-21'),
  ('William Tatcher', 'Plantmon', '2020-08-10'),
  ('Maisy Smith', 'Plantmon', '2021-04-07'),
  ('Stephanie Mendez', 'Squirtle', '2019-09-29'),
  ('Jack Harkness', 'Angemon', '2020-10-03'),
  ('Jack Harkness', 'Angemon', '2020-11-04'),
  ('Maisy Smith', 'Boarmon', '2019-01-24'),
  ('Maisy Smith', 'Boarmon', '2019-05-15'),
  ('Maisy Smith', 'Boarmon', '2020-02-27'),
  ('Maisy Smith', 'Boarmon', '2020-08-03'),
  ('Stephanie Mendez', 'Blossom', '2020-05-24'),
  ('William Tatcher', 'Blossom', '2021-01-11');
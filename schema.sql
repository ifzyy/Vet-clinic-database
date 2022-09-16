/* Database schema to keep the structure of entire database. */
CREATE TABLE animals(
    id integer PRIMARY KEY,
    name VARCHAR,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    FOREIGN KEY(species_id) REFERENCES species(id),
    FOREIGN KEY(owner_id) REFERENCES species(id)
);

CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR,
    age integer
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR
);
ALTER TABLE animals ADD COLUMN species_id INT, ADD FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD COLUMN owner_id INT, ADD FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE;

ALTER TABLE animals ALTER COLUMN name TYPE VARCHAR;
ALTER TABLE owners ALTER COLUMN full_name TYPE VARCHAR;
ALTER TABLE species ALTER COLUMN name TYPE VARCHAR;

CREATE TABLE vets(
 id INT GENERATED ALWAYS AS IDENTIY,
 name TEXT,
 age INT,
 date_of_graduation DATE
);

CREATE TABLE specializations(
 vet TEXT,
 specie TEXT
);

CREATE TABLE visits(
 vet TEXT,
 animal TEXT,
 date_visited DATE
);
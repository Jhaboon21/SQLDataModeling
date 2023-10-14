-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- hold data for the visit itself of who doc was and who patient was
CREATE TABLE vists (
    id SERIAL PRIMARY KEY,
    doc_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
);

-- The center will hold data of the vist and what disease was diagnosed
CREATE TABLE center (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES vists,
    disease_id INTEGER REFERENCES disease
);
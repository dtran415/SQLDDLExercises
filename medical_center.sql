DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE visits 
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors (id),
    patient_id INTEGER REFERENCES patients (id),
    date DATE
);

CREATE TABLE diseases
(    
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE diagnoses 
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits(id),
    disease_id INTEGER REFERENCES diseases(id)
);
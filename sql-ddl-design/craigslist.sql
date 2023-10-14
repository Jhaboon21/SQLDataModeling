-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE category ( 
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location_id INTEGER REFERENCES location,
    region_id INTEGER REFERENCES region,
    user_id INTEGER REFERENCES users,
    category_id INTEGER REFERENCES category
);
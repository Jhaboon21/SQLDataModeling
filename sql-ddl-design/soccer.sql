-- from the terminal run:
-- psql < soccer.sql

DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    first_team_id INTEGER REFERENCES teams,
    second_team_id INTEGER REFERENCES teams,
    season_id INTEGER REFERENCES season,
    referee_id INTEGER REFERENCES referees,
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES player,
    match_id INTEGER REFERENCES matches
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT 
);
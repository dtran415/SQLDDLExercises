DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    date DATE,
    team1 INTEGER REFERENCES teams(id),
    team2 INTEGER REFERENCES teams(id)
);

CREATE TABLE players
(    
    id SERIAL PRIMARY KEY,
    name TEXT,
    team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id)
);

CREATE TABLE referees 
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    match_id INTEGER REFERENCES matches(id)
);

CREATE TABLE seasons 
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);
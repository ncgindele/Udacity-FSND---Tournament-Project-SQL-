-- This sets up a database for running a Swiss pairing tournament.
-- If you wish to clear the database automatically (for code modification and
-- testing purposes), uncomment the following line:
-- DROP DATABASE IF EXISTS tournament;



CREATE DATABASE tournament;

\c tournament;

CREATE TABLE players (
    id  SERIAL PRIMARY KEY,
    name varchar(150) NOT NULL
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    winner integer REFERENCES players(id),
    loser integer REFERENCES players(id)
);

CREATE VIEW win_view AS
SELECT id, count(*) AS win_count
FROM players INNER JOIN matches
ON players.id = matches.winner
GROUP BY id;

CREATE VIEW loss_view AS
SELECT id, count(*) AS loss_count
FROM players INNER JOIN matches
ON players.id = matches.loser
GROUP BY id;

CREATE VIEW standings AS
SELECT id, name, COALESCE(win_count, 0) AS wins,
COALESCE(win_count, 0) + coalesce(loss_count, 0) AS matches
FROM players LEFT JOIN win_view USING (id)
LEFT JOIN loss_view USING (id)
ORDER BY wins DESC, matches ASC;

# Udacity-FSND---Tournament-Project-SQL-
Project fulfilling the requirements for the relational database project for the Udacity FSND program

# Overview
This code is used to manage a Swiss-style tournament whereby each round participants are matched according to their number of wins. It can handle any even number of participants and has no predifined number of rounds. It keeps track of players' names and records using PostgreSQL, Python, and the Psycopg2 adapter.

# Usage
The database can be established using the 'tournament.sql' file (One would type '\i tournament.sql' in a PostgreSQL command prompt). Next, one can run the 'tournament_test.py' code to ensure functionality and was provided by Udacity. 'tournament.py' contains functions used for operating a tournament using this code. These functions are described in greater detail under the 'Structure' section.

# Structure
The file 'tournament.sql' contains sql code to establish the 'tournament' database and the 'players' and 'matches' tables. The 'standings' view allows the user to retrieve a list of the participants sorted by wins. The 'tournament' database can be manipulated by the functions in 'tournament.py'. Here you will functions to establish a connection to the database, clear the tables in the database, count the number of participants, register a new player, retrieve the current standings, report the conclusion of a match, and return the Swiss pairings for a new round.

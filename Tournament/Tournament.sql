CREATE TABLE tournament 
( game_date DATE NOT NULL
 ,round VARCHAR NOT NULL 
 ,region VARCHAR 
 ,winning_seed INTEGER NOT NULL 
 ,winner VARCHAR NOT NULL 
 ,winning_score INTEGER NOT NULL
 ,losing_seed INTEGER NOT NULL 
 ,loser VARCHAR NOT NULL
 ,losing_score INTEGER NOT NULL
 ,overtime VARCHAR
); 

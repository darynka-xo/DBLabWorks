CREATE DATABASE quiz222;

CREATE TABLE movie(
    mID INTEGER PRIMARY KEY ,
    title VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    director VARCHAR(50)
);

CREATE TABLE reviewer(
    rID INTEGER PRIMARY KEY ,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE rating(
    rID INTEGER REFERENCES reviewer,
    mID INTEGER REFERENCES movie,
    stars INTEGER NOT NULL,
    ratingDate DATE
);

INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (101,'Gone with the Wind',1939,'Victor Fleming');
INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (102,'Star Wars',1977,'George Lucas');
INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (103,'The Sound of Music',1965,'Robert Wise');
INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (104,'E.T.',1982,'Steven Spielberg');
INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (105,'Titanic',1997,'James Cameron');
INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (106,'Snow White',1937,NULL);
INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (107,'Avatar',2009,'James Cameron');
INSERT INTO movie(mID, TITLE, YEAR, DIRECTOR) VALUES (108,'Raiders of the Lost Ark',1981,'Steven Spielberg');


INSERT INTO reviewer(RID, NAME) VALUES (201,'Sarah Martinez');
INSERT INTO reviewer(RID, NAME) VALUES (202,'Daniel Lewis');
INSERT INTO reviewer(RID, NAME) VALUES (203,'Brittany Harris');
INSERT INTO reviewer(RID, NAME) VALUES (204,'Mike Anderson');
INSERT INTO reviewer(RID, NAME) VALUES (205,'Chris Jackson');
INSERT INTO reviewer(RID, NAME) VALUES (206,'Elizabeth Thomas');
INSERT INTO reviewer(RID, NAME) VALUES (207,'James Cameron');
INSERT INTO reviewer(RID, NAME) VALUES (208,'Ashley White');

INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (201,101,2,'2011-01-22');
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (201,101,4,'2011-01-27');
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (202,106,4,NULL);
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (203,103,2,'2011-01-20');
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (203,108,4,'2011-01-12');
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (203,108,2,'2011-01-30');
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (204,101,3,'2011-01-09');
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (205,103,3,'2011-01-27');
INSERT INTO rating(RID, MID, STARS, RATINGDATE) VALUES (205,104,2,'2011-01-22');


--Task6
SELECT movie.title, AVG(rating.stars) FROM movie INNER JOIN rating ON movie.mID = rating.mID GROUP BY title ORDER BY AVG(stars) DESC;

--Task7
SELECT movie.title, MIN(rating.stars) FROM movie INNER JOIN rating USING(mID) GROUP BY mID ORDER BY title;

--Task8
SELECT name FROM reviewer INNER JOIN rating USING(rID) WHERE ratingDate IS NULL;

--Task9
CREATE MATERIALIZED VIEW view2 AS SELECT title FROM movie INNER JOIN rating USING (mID) WHERE movie.mID NOT IN (SELECT DISTINCT );
SELECT * FROM view2;

SELECT title FROM movie INNER JOIN rating ON movie.mID = rating.mID;
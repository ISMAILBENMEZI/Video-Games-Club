-- Creea de Base de Donnees
CREATE DATABASE Video_games_slub


--Creation d’une table avec les bons types SQL-------
CREATE TABLE member(id int PRIMARY KEY AUTO_INCREMENT ,pseudo varchar(255), email varchar(255), join_date date);

CREATE TABLE video_games(id int PRIMARY KEY AUTO_INCREMENT, title varchar(255), studio varchar(255), release_date date, genre varchar(255), is_multiplayer boolean);

CREATE TABLE subscription(id int PRIMARY KEY AUTO_INCREMENT,TYPE ENUM('Monthly', 'Half-yearly', 'Yearly'), subscription_date date);

CREATE TABLE borrowing(id int PRIMARY KEY AUTO_INCREMENT,borrow_date date, expected_return_date date);

CREATE TABLE tournament_participation(id int PRIMARY KEY AUTO_INCREMENT, score int, final_ranking int);

CREATE TABLE tournament(id int PRIMARY KEY AUTO_INCREMENT,name varchar(255), Tour_date date,reward varchar(255));

-- Creea FOREIGN KEY ------------------------------------------

ALTER TABLE borrowing ADD member_id int;
ALTER TABLE borrowing ADD FOREIGN KEY(member_id) REFERENCES member(id);

ALTER TABLE borrowing ADD videogame_id int;
ALTER TABLE borrowing ADD FOREIGN KEY(videogame_id) REFERENCES video_games(id);

ALTER TABLE tournament_participation ADD member_id int;
ALTER TABLE tournament_participation ADD FOREIGN KEY(member_id) REFERENCES member(id);

ALTER TABLE tournament_participation ADD tournament_id int;
ALTER TABLE tournament_participation ADD FOREIGN KEY(tournament_id) REFERENCES tournament(id);

ALTER TABLE subscription ADD member_id int;
ALTER TABLE subscription ADD FOREIGN KEY(member_id) REFERENCES member(id);

ALTER TABLE tournament ADD videogame_id int;
ALTER TABLE tournament ADD FOREIGN KEY(videogame_id) REFERENCES video_games(id);


-- Inserer des donnees dans la table -----------------------------------

INSERT INTO member(pseudo, email, join_date) 
VALUES('Isamil', 'ismail@.com', '2025-01-01'),
	  ('Ali', 'Ali@.com', '2025-05-05'),
      ('Kalid', 'Khalid@.com', '2025-07-07');
----------------------------------------------

INSERT INTO video_games(title, studio, release_date, genre , is_multiplayer) 
VALUES('League of Legends', 'Riot Games', '2025-01-01', 'MOBA', 1),
	  ('Fortnite', 'Epic Games', '2024-05-01', 'Battle Royale', 0),
      ('Counter-Strike 2', 'Valve', '2024-01-01', 'FPS', 1);
-----------------------------------------------

INSERT INTO tournament(videogame_id,name, Tour_date,reword)
VALUES (1, 'Ultimate Gamers Cup', '2025-12-10', '1000$'),
	   (2, 'Pro Legends Tournament', '2025-20-10', '10000$'),
       (3, 'Battle Arena Championship', '2025-12-10', '1500$');
--------------------------------------------------

INSERT INTO tournament_participation(tournament_id ,member_id , score, final_ranking)
VALUES(1,1,300,3),
	  (2,2,400,2),
      (3,3,550,1);
----------------------------------------------------

INSERT INTO borrowing(videogame_id ,member_id,borrow_date, expected_return_date)
VALUES(1,1,'2024-01-05','2025-04-10'),
	  (2,2,'2024-12-12','2025-02-08'),
      (3,3,'2025-07-08','2025-08-11');
-----------------------------------------------------

INSERT INTO subscription(member_id ,TYPE, subscription_date)
VALUES(1,'Monthly','2025-04-10'),
	  (2,'Yearly','2025-02-08'),
      (3,'Half-yearly','2025-08-11');
----------------------------------------------------

--Lire & filtrer des données avec SELECT + WHERE

SELECT * FROM member WHERE join_date = '2025-01-01'; 
SELECT * FROM member WHERE join_date != '2025-01-01';
SELECT * FROM member WHERE join_date >= '2025-01-01' AND id = 1;
SELECT * FROM member WHERE join_date <= '2025-01-01' OR pseudo = 'Ali';

SELECT title from video_games WHERE id = 1;
SELECT * FROM video_games WHERE release_date LIKE '2025-01-01';

SELECT * FROM video_games WHERE title LIKE 'a%';
SELECT * FROM video_games WHERE title LIKE '%f';
SELECT * FROM video_games WHERE title LIKE '%e%';

SELECT * FROM video_games WHERE title LIKE '%[lfs]e%';
SELECT * FROM video_games WHERE title LIKE '%a[gsd]%';
SELECT * FROM video_games WHERE title LIKE '%[a-m]g%';

------------Trier les résultats avec ORDER BY-------------

SELECT * FROM member ORDER BY pseudo DESC;
SELECT * FROM member ORDER BY join_date ASC;
SELECT * FROM member ORDER BY pseudo DESC , join_date ASC;

--------------Modifier des données avec UPDATE------------

UPDATE member SET pseudo = 'Taha' WHERE id = 2;
UPDATE member SET join_date = '2025-04-11' WHERE pseudo = 'Ismail';

-------------Supprimer des données avec DELETE-----------

DELETE FROM borrowing WHERE borrow_date > expected_return_date;
DELETE FROM borrowing WHERE expected_return_date = '2026-01-01';



--
-- Create database
-- Use database
--
CREATE DATABASE IF NOT EXISTS rpg_game;
use rpg_game;

-- Skapa en användare user med lösenordet pass och ge tillgång oavsett
-- hostnamn.
CREATE USER IF NOT EXISTS 
	'user'@'%'
IDENTIFIED BY 
	'pass'
;

-- Ge användaren alla rättigheter på alla databaser.
GRANT ALL PRIVILEGES
    ON *.*
    TO 'user'@'%'
;

--
-- Drop tables in correct order
--
DROP TABLE IF EXISTS user_stats;
DROP TABLE IF EXISTS user_logins;

--
-- Create table for user logins
--
CREATE TABLE user_logins
(
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
	username VARCHAR(20),
    password VARCHAR(20),
    PRIMARY KEY (id)
)
ENGINE 
	INNODB
CHARSET
	utf8
COLLATE
	utf8_swedish_ci
;

--
-- create table user stats
--
CREATE TABLE user_stats
(
	id INT NOT NULL,
    `level` INT NOT NULL,
    experience INT NOT NULL,
	money INT NOT NULL,
    health INT NOT NULL,
	strength INT NOT NULL,
    agility INT NOT NULL,
    weapon_skill INT NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY (id) REFERENCES user_logins(id)
)
ENGINE 
	INNODB
CHARSET
	utf8
COLLATE
	utf8_swedish_ci
;

--
-- Create procedure for create user
--
DROP PROCEDURE IF EXISTS create_account;
DELIMITER ;;
CREATE PROCEDURE create_account(
    a_username VARCHAR(20),
    a_password VARCHAR(20)
)
BEGIN
    INSERT INTO user_logins (username, password) VALUES (a_username, a_password);
END
;;
DELIMITER ;

--
-- Create procedure for create user
--
DROP PROCEDURE IF EXISTS create_user;
DELIMITER ;;
CREATE PROCEDURE create_user(
	a_level INT,
    a_experience INT,
    a_health INT,
    a_strength INT,
    a_agility INT,
    a_weapon_skill INT
)
BEGIN
    INSERT INTO user_stats (level, experience, health, strength, agility, weapon_skill) VALUES (a_level, a_experience, a_health, a_strength, a_agility, a_weapon_skill);
END
;;
DELIMITER ;

--
-- Trigger for creating user base
--
DROP TRIGGER IF EXISTS create_user_base;
CREATE TRIGGER create_user_base
AFTER INSERT
ON user_logins FOR EACH ROW
    INSERT INTO user_stats (`id`)
        VALUES (NEW.id);

--
-- Add test users
--
INSERT INTO user_logins VALUES
	(default, 'korvin1337', 'korvin1337'),
    (default, 'smog', 'smog'),
    (default, 'OSTO80', 'OSTO80'),
    (default, 'arvid', 'arvid');
    
--
-- Add standard test character
--
UPDATE user_stats 
	SET 
    `level` = 1,
    experience = 0,
    health = 25,
    strength = 50,
    agility = 20,
    weapon_skill = 35
    WHERE id = 1 AND 2 AND 3 AND 4; -- user_id
    
SELECT * FROM user_stats;

--
-- Create procedure for create user
--
DROP PROCEDURE IF EXISTS show_users;
DELIMITER ;;
CREATE PROCEDURE show_users(
	a_id VARCHAR(40)
)
BEGIN
    SELECT * FROM user_logins WHERE id = a_id;-- ORDER BY id asc;
END
;;
DELIMITER ;

CALL show_users(1);

--
-- Create procedure for showing user stats
--
DROP PROCEDURE IF EXISTS show_user_stats;
DELIMITER ;;
CREATE PROCEDURE show_user_stats(
	a_id VARCHAR(40)
)
BEGIN
	SELECT 
		money as Money,
        health as Health,
        strength as Strength,
        agility as Agility,
        weapon_skill as 'Weapon Skill'
	FROM 
		user_stats 
	WHERE 
		id = a_id;
END
;;
DELIMITER ;





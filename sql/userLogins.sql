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
    a_health INT,
    a_strength INT,
    a_agility INT,
    a_weapon_skill INT
)
BEGIN
    INSERT INTO user_stats (health, strength, agility, weapon_skill) VALUES (a_health, a_strength, a_agility, a_weapon_skill);
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
-- Add standard test user
--
INSERT INTO user_logins 
	SET username = 'user',
    password = 'password';
    
--
-- Add standard test character
--
UPDATE user_stats 
	SET health = 25,
    strength = 50,
    agility = 20,
    weapon_skill = 35
    WHERE id = 1; -- user_id
    
SELECT * FROM user_stats;

--
-- Create procedure for create user
--
DROP PROCEDURE IF EXISTS show_users;
DELIMITER ;;
CREATE PROCEDURE show_users(
)
BEGIN
    SELECT * FROM user_logins;-- ORDER BY id asc;
END
;;
DELIMITER ;



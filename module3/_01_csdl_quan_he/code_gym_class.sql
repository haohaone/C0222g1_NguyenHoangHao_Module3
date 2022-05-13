CREATE DATABASE code_gym;

use code_gym;

CREATE TABLE class(
	id INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE teacher(
	id INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    age int,
    country VARCHAR(50)
);

SELECT * FROM code_gym.class;
SELECT * FROM code_gym.teacher;

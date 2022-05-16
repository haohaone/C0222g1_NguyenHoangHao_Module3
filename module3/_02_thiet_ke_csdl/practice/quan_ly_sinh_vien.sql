CREATE DATABASE IF NOT EXISTS quan_ly_sinh_vien;

USE quan_ly_sinh_vien;

CREATE TABLE IF NOT EXISTS class (
    id_class INT 					AUTO_INCREMENT PRIMARY KEY,
    `name_class` VARCHAR(60) 		NOT NULL,
    start_date DATE 				NOT NULL,
    `status` BIT
);

CREATE TABLE IF NOT EXISTS student(
	id_student INT 					AUTO_INCREMENT PRIMARY KEY,
    `name_student` VARCHAR(30) 		NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    `status` BIT,
    id_class INT NOT NULL REFERENCES class(id_class)
);
ALTER TABLE student
ADD CONSTRAINT fk_id_class FOREIGN KEY (id_class) REFERENCES class(id_class);

CREATE TABLE IF NOT EXISTS `subject`(
	id_sub INT 						AUTO_INCREMENT PRIMARY KEY,
    `name_sub` VARCHAR(30) 			NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    `status` BIT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS mark(
	id_mark INT 					AUTO_INCREMENT PRIMARY KEY,
    id_sub INT 						NOT NULL ,
    id_student INT 					NOT NULL ,
    mark FLOAT DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    CONSTRAINT fk_id_sub FOREIGN KEY (id_sub) REFERENCES `subject`(id_sub),
	CONSTRAINT fk_id_student FOREIGN KEY (id_student) REFERENCES student(id_student)
);
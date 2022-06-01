CREATE DATABASE furama_management;

USE furama_management;

CREATE TABLE service_type(
	service_type_id INT AUTO_INCREMENT PRIMARY KEY,
    service_type_name VARCHAR(45)
);

CREATE TABLE rent_type(
	rent_type_id INT AUTO_INCREMENT PRIMARY KEY,
    rent_type_name VARCHAR(45),
    rent_type_cost DOUBLE
);

CREATE TABLE service(
	service_id INT AUTO_INCREMENT PRIMARY KEY,
	service_name VARCHAR(45),
    service_area INT,
    service_cost DOUBLE,
    service_max_people INT,
    rent_type_id INT,
    service_type_id INT,
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floors INT,
    CONSTRAINT fk_rent_type_id_service FOREIGN KEY (rent_type_id) REFERENCES rent_type(rent_type_id),
    CONSTRAINT fk_service_type_id FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id)
);

CREATE TABLE customer_type(
	customer_type_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_type_name VARCHAR(45)
);

CREATE TABLE customer(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_type_id INT,
    customer_name VARCHAR(45),
    customer_birthday DATE,
    customer_gender BIT(1),
    customer_id_card VARCHAR(45),
    customer_phone VARCHAR(45),
    customer_email VARCHAR(45),
    customer_address VARCHAR(45),
    CONSTRAINT fk_customer_type_id FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id)
);

CREATE TABLE `position`(
	position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(45)
);

CREATE TABLE education_degree(
	education_degree_id INT AUTO_INCREMENT PRIMARY KEY,
    education_degree_name VARCHAR(45)
);

CREATE TABLE division(
	division_id INT AUTO_INCREMENT PRIMARY KEY,
    division_name VARCHAR(45)
);

CREATE TABLE `role`(
	role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255)
);

CREATE TABLE `user`(
	username VARCHAR(255) PRIMARY KEY,
    `password` VARCHAR(255)
);

CREATE TABLE user_role(
	role_id INT,
    username VARCHAR(255),
    PRIMARY KEY(role_id, username),
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES `role`(role_id),
    CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES `user`(username)
);

CREATE TABLE employee(
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(45),
    employee_birthday DATE,
    employee_id_card VARCHAR(45),
    employee_salary DOUBLE,
    employee_phone VARCHAR(45),
    employee_email VARCHAR(45),
    employee_address VARCHAR(45),
    position_id INT,
    education_degree_id INT,
    division_id INT,
    username VARCHAR(255),
    CONSTRAINT fk_position_id FOREIGN KEY (position_id) REFERENCES `position`(position_id),
    CONSTRAINT fk_education_degree_id FOREIGN KEY (education_degree_id) REFERENCES `education_degree`(education_degree_id),
    CONSTRAINT fk_division_id FOREIGN KEY (division_id) REFERENCES `division`(division_id),
    CONSTRAINT fk_username_emplyee FOREIGN KEY (username) REFERENCES `user`(username)
);

CREATE TABLE contract(
	contract_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_start_date DATETIME,
    contract_end_date DATETIME,
    contract_deposit DOUBLE,
    contract_total_money DOUBLE,
    employee_id INT,
    customer_id INT,
    service_id INT,
    CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE TABLE attach_service(
	attach_servcie_id INT AUTO_INCREMENT PRIMARY KEY,
    attach_service_name VARCHAR(45),
    attach_service_cost DOUBLE,
    attach_service_unit INT,
    attach_service_status VARCHAR(45)
);

CREATE TABLE contract_detail(
	contract_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT,
    attach_servcie_id INT,
    quanity INT,
    CONSTRAINT fk_contract_id FOREIGN KEY (contract_id) REFERENCES contract(contract_id),
    CONSTRAINT fk_attach_servcie_id FOREIGN KEY (attach_servcie_id) REFERENCES attach_service(attach_servcie_id)
);
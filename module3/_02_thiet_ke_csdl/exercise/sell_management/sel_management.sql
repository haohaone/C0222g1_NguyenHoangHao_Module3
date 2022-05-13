CREATE DATABASE sell_management;

USE sell_management;

CREATE TABLE customer(
	cus_id INT AUTO_INCREMENT PRIMARY KEY,
    cus_name VARCHAR(50) NOT NULL,
    cus_age INT NOT NULL
);

CREATE TABLE `order`(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    cus_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_total_price INT NOT NULL,
    CONSTRAINT fk_cus_id FOREIGN KEY (cus_id) REFERENCES customer (cus_id)
);

CREATE TABLE product(
	product_id INT AUTO_INCREMENT KEY,
    product_name VARCHAR(50) NOT NULL,
    product_price INT NOT NULL
);

CREATE TABLE order_detail(
	order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES `order` (order_id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES product (product_id)
);
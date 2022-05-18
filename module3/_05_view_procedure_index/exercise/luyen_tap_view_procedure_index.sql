CREATE DATABASE products;

USE products;

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(50),
    product_name VARCHAR(50),
    product_price INT,
    product_amonut INT,
    product_decription VARCHAR(100),
    product_status VARCHAR(50)
);

INSERT INTO products VALUE
(1, 'IP-X', 'iphone X', 500, 10, 'From USA', '99%'),
(2, 'IP-11', 'iphone 11', 700, 10, 'From USA', '100%'),
(3, 'IP-13', 'iphone 13', 1500, 5, 'From UK', '99%'),
(4, 'SS13', 'Sam Sung 13', 200, 4, 'From Korea', '100%'),
(5, 'HW-S', 'Huawei S', 1300, 9, 'From Taiwan', '95%');

EXPLAIN SELECT * FROM products WHERE product_code = 'HW-S';

CREATE INDEX id_products_code ON products(product_code);

EXPLAIN SELECT * FROM products WHERE product_code = 'HW-S';

CREATE INDEX composite_id_products ON products(product_decription, product_status);

EXPLAIN SELECT * FROM products WHERE product_decription = 'From USA' AND product_status = '100%';

CREATE VIEW view_test AS
SELECT product_code, product_name, product_price, product_status FROM products;

SELECT * FROM view_test;

SET SQL_SAFE_UPDATES = 0;
UPDATE view_test
SET product_status = '100%';

DELETE FROM view_test
WHERE product_price < 700;

DELIMITER \\
CREATE PROCEDURE get_all_products()
BEGIN
	SELECT * FROM products;
END\\
DELIMITER ;

CALL get_all_products;

DELIMITER \\
CREATE PROCEDURE add_new_products()
BEGIN
	INSERT INTO products (product_code, product_name, product_price, product_amonut, product_decription, product_status)
    VALUE ('IP-15-PRO', 'Iphone 15', 4000, 2, 'From VN', '100%');
END\\
DELIMITER ;

CALL add_new_products;

DELIMITER \\
CREATE PROCEDURE edit_price_by_id(IN set_id INT, IN price INT)
BEGIN
	UPDATE products
    SET product_price = price
    WHERE id = set_id;
END\\
DELIMITER ;

CALL edit_price_by_id(3, 2000)

DELIMITER \\
CREATE PROCEDURE delete_product_by_id(IN set_id INT)
BEGIN
	DELETE FROM products
    WHERE id = set_id;
END\\
DELIMITER ;

CALL delete_product_by_id(3)
CREATE TABLE product_management;

USE product_management;

CREATE TABLE product(
	product_index INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(45),
    product_name VARCHAR(45),
    production_name VARCHAR(45),
    distributorName VARCHAR(45)
);

INSERT INTO product VALUE
(1,	'IP-11',	'Iphone 11',	'Apple',	'Thế giới di dộng'),
(2,	'IP-XS',	'Iphone XS',	'Apple',	'Điện máy xanh'),
(3,	'IP-13',	'Iphone 13',	'Apple',	'Schannel'),
(4,	'SS-A7',	'Samsung-A7',	'Samsung',	'Thế giới di dộng'),
(5,	'SS-B3',	'Samsung-B3',	'Samsung',	'Điện máy xanh'),
(6,	'HW-K11',	'Huawei-K11',	'Huawei',	'Thế giới di dộng');
INSERT INTO customer (cus_name, cus_age)
VALUE ('Minh Quan', 30),
	  ('Ngoc Oanh', 20),
	  ('Hong Ha', 50);
      
INSERT INTO `order` (cus_id, order_date, order_total_price)
VALUE (1, '2006-03-21', NULL),
	  (2, '2006-03-23', NULL),
      (1, '2006-03-16', NULL);
      
INSERT INTO product (product_name, product_price)
VALUE	('May Giat', 3),
		('Tu Lanh', 5),
		('Dieu Hoa', 7),
		('Quat', 1),
		('Bep Dien', 2);
        
INSERT INTO order_detail (order_id, product_id, od_qty)
VALUE	(1, 1, 3),
		(1, 3, 7),
		(1, 4, 2),
		(2, 1, 1),
		(3, 1, 8),
		(2, 5, 4),
		(2, 3, 3);
        
SELECT `order`.order_id, `order`.order_date, product.product_price FROM order_detail 
JOIN `order` ON `order`.order_id = order_detail.order_id
JOIN product ON product.product_id = order_detail.product_id; 

SELECT `order`.order_id, `order`.order_date, customer.cus_id, customer.cus_name, product.product_name FROM order_detail 
JOIN `order` ON `order`.order_id = order_detail.order_id
JOIN product ON product.product_id = order_detail.product_id
JOIN customer ON `order`.cus_id = customer.cus_id
WHERE customer.cus_id  IN (SELECT cus_id  FROM `order` ); 

-- SELECT customer.cus_name, customer.cus_id FROM customer
-- WHERE customer.cus_id  NOT IN (SELECT cus_id  FROM `order` );

SELECT customer.cus_name, customer.cus_id FROM customer
WHERE NOT EXISTS 
(SELECT * FROM `order` WHERE customer.cus_id = `order`.cus_id);

SELECT `order`.order_id, `order`.order_date, sum(`order_detail`.od_qty * product.product_id) AS order_total_price  FROM order_detail 
JOIN `order` ON order_detail.order_id = `order`.order_id
JOIN product ON product.product_id = order_detail.product_id
GROUP BY order_id
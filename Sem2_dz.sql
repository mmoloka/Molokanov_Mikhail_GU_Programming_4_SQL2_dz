CREATE DATABASE seminar2_dz;
USE seminar2_dz;

CREATE TABLE sales
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT
);
INSERT sales(order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
SELECT * FROM sales;

SELECT id,
CASE
	WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product >= 100 AND count_product <= 300 THEN 'Средний заказ'
    WHEN count_product > 300 THEN 'Большой заказ'
END AS `Тип заказа` 
FROM sales;

CREATE TABLE orders
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(20),
amount DECIMAL(5, 2),
order_status VARCHAR(20)
);
INSERT orders(employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');
SELECT * FROM orders;
SELECT *,
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS full_order_status
FROM orders;   
SELECT *,
IF(order_status = 'OPEN', 'Order is in open state', IF(order_status = 'CLOSED', 'Order is closed', 'Order is cancelled'))
AS full_order_status
FROM orders
 

CREATE DATABASE Food_delivery;
USE Food_delivery;

CREATE TABLE CUSTOMER(customer_id INT NOT NULL,
customer_name VARCHAR(45) NOT NULL,
customer_address VARCHAR(45) NOT NULL,
customer_contact_no VARCHAR(45) NOT NULL,
PRIMARY KEY (customer_id),
COMMENT = 'Strong Entity' );

CREATE TABLE DELIVERY_PERSON(delivery_id INT NOT NULL,
delivery_name VARCHAR(50) NOT NULL,
delivery_contactno VARCHAR(50) NOT NULL,
PRIMARY KEY (delivery_id),
COMMENT = 'Strong Entity');

CREATE TABLE RESTAURANT(restaurant_id INT NOT NULL,
restaurant_name VARCHAR(45) NOT NULL,
restaurant_address VARCHAR(45) NOT NULL,
restaurant_contact_no VARCHAR(45) NOT NULL,
PRIMARY KEY (restaurant_id),
COMMENT = 'Strong Entity');

CREATE TABLE ORDERS(order_id INT NOT NULL,
customer_id INT NOT NULL,
delivery_id INT NOT NULL,
restaurant_id INT NOT NULL,
bill DOUBLE NOT NULL,
orderplacingtime DATETIME UNIQUE NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY(customer_id) REFERENCES CUSTOMER(customer_id)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY(delivery_id) REFERENCES DELIVERY_PERSON(delivery_id)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY(restaurant_id) REFERENCES RESTAURANT(restaurant_id)
ON DELETE SET NULL
ON UPDATE CASCADE,
COMMENT = 'Weak Entity');

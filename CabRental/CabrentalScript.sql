CREATE DATABASE Cab_Rental;
USE Cab_Rental ;

CREATE TABLE IF NOT EXISTS Cab (
cab_id INT NOT NULL,
cab_name VARCHAR(45) NULL,
cab_no INT NOT NULL,
PRIMARY KEY (cab_id),
COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS driver (
driver_id INT NOT NULL,
driver_name VARCHAR(45) NULL,
driver_contactno VARCHAR(45) NULL,
driver_rating VARCHAR(45) NULL,
PRIMARY KEY (driver_id),
COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS customer (
customer_id INT NOT NULL,
first_name VARCHAR(45) NULL,
last_name VARCHAR(45) NULL,
emailid VARCHAR(45) NULL,
contact_no VARCHAR(45) NULL,
PRIMARY KEY (customer_id));


CREATE TABLE IF NOT EXISTS booking (
booking_id INT NOT NULL,
customer_id INT NOT NULL,
cab_id INT NOT NULL,
driver_id INT NOT NULL,
start_time DATETIME NULL,
end_time DATETIME NULL,
pickup VARCHAR(45) NULL,
drop_ VARCHAR(45) NULL,
PRIMARY KEY (booking_id, driver_id),
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON DELETE NO ACTION
ON UPDATE CASCADE,
FOREIGN KEY (cab_id)
REFERENCES Cab (cab_id)
ON DELETE NO ACTION
ON UPDATE CASCADE,
FOREIGN KEY (driver_id)
REFERENCES driver (driver_id)
ON DELETE RESTRICT
ON UPDATE CASCADE));







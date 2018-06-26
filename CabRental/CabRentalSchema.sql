CREATE DATABASE Cab_Rental;
USE Cab_Rental ;

CREATE TABLE IF NOT EXISTS Cab (
cab_id INT NOT NULL PRIMARY KEY,
cab_name VARCHAR(45) NULL,
cab_no INT NOT NULL)
COMMENT='Strong entity';


CREATE TABLE IF NOT EXISTS driver (
driver_id INT NOT NULL PRIMARY KEY,
driver_name VARCHAR(45) NULL,
driver_contactno VARCHAR(45) NULL,
driver_rating VARCHAR(45) NULL)
COMMENT='Strong entity';


CREATE TABLE IF NOT EXISTS customer (
customer_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(45) NULL,
last_name VARCHAR(45) NULL,
emailid VARCHAR(45) NULL,
contact_no VARCHAR(45) NULL)
COMMENT='Strong entity';


CREATE TABLE IF NOT EXISTS booking (
booking_id INT NOT NULL PRIMARY KEY,
customer_id INT NOT NULL REFERENCES customer (customer_id) ON DELETE NO ACTION ON UPDATE CASCADE,
cab_id INT NOT NULL REFERENCES Cab (cab_id) ON DELETE NO ACTION ON UPDATE CASCADE,
driver_id INT NOT NULL REFERENCES driver (driver_id) ON DELETE RESTRICT ON UPDATE CASCADE,
start_time DATETIME NULL,
end_time DATETIME NULL,
pickup VARCHAR(45) NULL,
drop_ VARCHAR(45) NULL)
COMMENT='Weak entity';


CREATE TRIGGER delete_from_booking 
    ON  booking
    INSTEAD OF DELETE
AS 
BEGIN
    RAISERROR ('Cannot Delete Records from booking', 16, 1)
END




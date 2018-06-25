CREATE DATABASE IF NOT EXISTS HotelBooking;
USE HotelBooking ;

CREATE TABLE  IF NOT EXISTS hotels (
hotel_id INT NOT NULL AUTO_INCREMENT,
hotel_name VARCHAR(45) NOT NULL,
contact_no DECIMAL(10) NOT NULL,
address VARCHAR(45) NOT NULL,
PRIMARY KEY (hotel_id),
COMMENT = 'Strong Entity');


CREATE TABLE IF NOT EXISTS customer (
customer_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
aadhar_no MEDIUMTEXT NOT NULL,
contact_no DECIMAL(10) NOT NULL,
loyal TINYINT(1) NULL DEFAULT 0,
PRIMARY KEY (customer_id),
COMMENT = 'Strong Entity');



CREATE TABLE IF NOT EXISTS booking (
booking_id INT NOT NULL,
hotel_id INT NOT NULL,
customer_id INT NOT NULL,
booking_date DATE NOT NULL,
no_of_days INT NOT NULL,
price INT NOT NULL,
PRIMARY KEY (booking_id),
FOREIGN KEY (hotel_id)
REFERENCES hotel (hotel_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
COMMENT = 'Weak Entity');




delimiter |

CREATE TRIGGER customer_loyal_or_firsttimer BEFORE INSERT ON customer
  FOR EACH ROW
  BEGIN
    IF((SELECT count(booking.customer_id) FROM booking WHERE booking.customer_id = NEW.customer_id)>0)
		THEN UPDATE customer SET customer.loyal = 1 WHERE customer.customer_id = NEW.customer_id;
	END IF;
  END;
|

delimiter ;


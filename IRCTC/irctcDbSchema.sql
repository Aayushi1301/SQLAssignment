CREATE DATABASE IRCTC1;
USE IRCTC1 ;

CREATE TABLE IF NOT EXISTS train (
train_id INT NOT NULL,
train_name VARCHAR(45) NOT NULL,
source VARCHAR(45) NOT NULL,
destination VARCHAR(45) NOT NULL,
PRIMARY KEY (train_id),
COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS customer (
customer_id INT NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
age INT NOT NULL,
contact_no VARCHAR(45) NULL,
PRIMARY KEY (customer_id),
COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS ticket (
ticket_id INT NOT NULL,
ticket_price INT NOT NULL,
reserved TINYINT(1) NOT NULL DEFAULT 1,
train_id INT NULL,
customer_id INT NULL,
from_ VARCHAR(45) NOT NULL,
to_ VARCHAR(45) NOT NULL,
PRIMARY KEY (ticket_id),
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (train_id)
REFERENCES train (train_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
COMMENT='Weak entity');


delimiter |

CREATE TRIGGER reserved_or_unreserved BEFORE INSERT ON ticket
  FOR EACH ROW
  BEGIN
    IF((SELECT train_id FROM train WHERE train.customer_id = ticket.customer_id) IS NULL)
		THEN UPDATE ticket SET ticket.reserved = 0 WHERE train.customer_id = ticket.customer_id;
	END IF;
  END;
|

delimiter ;





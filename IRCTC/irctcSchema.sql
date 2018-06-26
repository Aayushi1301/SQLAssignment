CREATE DATABASE IRCTC1;
USE IRCTC1 ;

CREATE TABLE IF NOT EXISTS train (
train_id INT NOT NULL PRIMARY KEY ,
train_name VARCHAR(45) NOT NULL,
source VARCHAR(45) NOT NULL,
destination VARCHAR(45) NOT NULL)
COMMENT='Strong entity';


CREATE TABLE IF NOT EXISTS customer (
customer_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
age INT NOT NULL,
contact_no VARCHAR(45) NULL)
COMMENT='Strong entity';


CREATE TABLE IF NOT EXISTS ticket (
ticket_id INT NOT NULL PRIMARY KEY,
ticket_price INT NOT NULL,
reserved TINYINT(1) NOT NULL DEFAULT 1,
train_id INT NULL REFERENCES train (train_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
customer_id INT NULL REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
from_ VARCHAR(45) NOT NULL,
to_ VARCHAR(45) NOT NULL)
COMMENT='Weak entity';


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





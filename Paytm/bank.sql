CREATE DATABASE paytm;
USE paytm ;

CREATE TABLE IF NOT EXISTS customer (
  customer_id INT NOT NULL,
  customer_name VARCHAR(45) ,
  customer_aadharno VARCHAR(45) ,
  customer_contactno VARCHAR(45) ,
  PRIMARY KEY (customer_id),
  COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS branches (
  branch_id INT NOT NULL,
  branche_name VARCHAR(45) ,
  branch_ifsc VARCHAR(45),
  branch_address VARCHAR(45) ,
  PRIMARY KEY (branch_id),
  COMMENT='Strong entity'
);

CREATE TABLE IF NOT EXISTS account (
  account_id INT NOT NULL,
  account_no VARCHAR(45),
  account_type VARCHAR(45) ,
  account_balance VARCHAR(45),
  account_branchid INT,
  account_holderid INT ,
  PRIMARY KEY (account_id),
    FOREIGN KEY (account_branchid)
    REFERENCES branches (branch_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (account_holderid)
    REFERENCES customer (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    COMMENT='Weak entity');



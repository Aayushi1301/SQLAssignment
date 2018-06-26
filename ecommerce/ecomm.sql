CREATE DATABASE ecommerce ;
USE ecommerce ;

CREATE TABLE IF NOT EXISTS supplier (
  supplier_id INT NOT NULL,
  supplier_name VARCHAR(45) ,
  PRIMARY KEY (supplier_id),
  COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS customer (
  customer_id INT NOT NULL,
  customer_name VARCHAR(45) ,
  PRIMARY KEY (customer_id),
  COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS brand (
  brand_id INT NOT NULL,
  brand_name VARCHAR(45),
  PRIMARY KEY (brand_id),
  COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS item (
  item_id INT NOT NULL,
  item_name VARCHAR(45) ,
  item_price FLOAT ,
  brand_id INT ,
  supp_id VARCHAR(45) ,
  PRIMARY KEY (item_id),
  FOREIGN KEY (supp_id)
  REFERENCES supplier (supplier_id)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
  FOREIGN KEY (brand_id)
  REFERENCES brand(brand_id)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
  COMMENT='Weak entity');


CREATE TABLE IF NOT EXISTS order (
  order_id INT NOT NULL,
  order_amount VARCHAR(45),
  i_id INT NOT NULL,
  order_time DATETIME ,
  cus_id INT ,
  PRIMARY KEY (order_id),
  FOREIGN KEY (cus_id)
  REFERENCES customer(customer_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (i_id)
  REFERENCES item (item_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  COMMENT='Weak entity');



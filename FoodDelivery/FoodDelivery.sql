-- MySQL Script generated by MySQL Workbench
-- Friday 22 June 2018 01:46:25 PM IST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema FoodDelivery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FoodDelivery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FoodDelivery` DEFAULT CHARACTER SET utf8 ;
USE `FoodDelivery` ;

-- -----------------------------------------------------
-- Table `FoodDelivery`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`customer` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_address` VARCHAR(45) NOT NULL,
  `customer_contact_no` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_contact_no_UNIQUE` (`customer_contact_no` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`deliveryperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`deliveryperson` (
  `deliveryperson_id` INT NOT NULL,
  `deliveryperson_name` VARCHAR(45) NOT NULL,
  `deliveryperson_contactno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`deliveryperson_id`),
  UNIQUE INDEX `deliveryperson_contactno_UNIQUE` (`deliveryperson_contactno` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`restaurant` (
  `restaurant_id` INT NOT NULL,
  `restaurant_name` VARCHAR(45) NOT NULL,
  `restaurant_address` VARCHAR(45) NOT NULL,
  `restaurant_contact_no` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`restaurant_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`order` (
  `orderid` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `deliveryperson_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  `bill` DOUBLE NOT NULL,
  `orderplacingtime` DATETIME NOT NULL,
  PRIMARY KEY (`orderid`),
  INDEX `fk_order_1_idx` (`customer_id` ASC),
  INDEX `fk_order_2_idx` (`deliveryperson_id` ASC),
  INDEX `fk_order_3_idx` (`restaurant_id` ASC),
  CONSTRAINT `fk_order_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `FoodDelivery`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_2`
    FOREIGN KEY (`deliveryperson_id`)
    REFERENCES `FoodDelivery`.`deliveryperson` (`deliveryperson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_3`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `FoodDelivery`.`restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
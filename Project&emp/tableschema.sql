-- -----------------------------------------------------
-- Schema ProjectsEmployeesSchema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ProjectsEmployeesSchema` ;

-- -----------------------------------------------------
-- Schema ProjectsEmployeesSchema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjectsEmployeesSchema` ;
USE `ProjectsEmployeesSchema` ;

-- -----------------------------------------------------
-- Table `ProjectsEmployeesSchema`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectsEmployeesSchema`.`employees` ;

CREATE TABLE IF NOT EXISTS `ProjectsEmployeesSchema`.`employees` (
  `employee_id` DECIMAL(10) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `designation` VARCHAR(30) NOT NULL,
  `salary` INT NOT NULL DEFAULT 0,
  `contact_no` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`employee_id`))
COMMENT = 'Strong Entity';


-- -----------------------------------------------------
-- Table `ProjectsEmployeesSchema`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectsEmployeesSchema`.`projects` ;

CREATE TABLE IF NOT EXISTS `ProjectsEmployeesSchema`.`projects` (
  `project_id` DECIMAL(10) NOT NULL,
  `project_title` VARCHAR(45) NOT NULL,
  `project_desc` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`))
COMMENT = 'Weak Entity';


-- -----------------------------------------------------
-- Table `ProjectsEmployeesSchema`.`employee_manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectsEmployeesSchema`.`employee_manager` ;

CREATE TABLE IF NOT EXISTS `ProjectsEmployeesSchema`.`employee_manager` (
  `employee_id` DECIMAL(10) NOT NULL,
  `manager_id` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`employee_id`),
    FOREIGN KEY (`employee_id`)
    REFERENCES `ProjectsEmployeesSchema`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (`manager_id`)
    REFERENCES `ProjectsEmployeesSchema`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table `ProjectsEmployeesSchema`.`employee_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectsEmployeesSchema`.`employee_project` ;

CREATE TABLE IF NOT EXISTS `ProjectsEmployeesSchema`.`employee_project` (
  `employee_id` DECIMAL(10) NOT NULL,
  `project_id` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`employee_id`),
    FOREIGN KEY (`employee_id`)
    REFERENCES `ProjectsEmployeesSchema`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`project_id`)
    REFERENCES `ProjectsEmployeesSchema`.`projects` (`project_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

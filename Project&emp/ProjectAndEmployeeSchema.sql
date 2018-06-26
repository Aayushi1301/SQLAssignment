CREATE DATABASE ProjEmp ;
USE ProjEmp ;


CREATE TABLE IF NOT EXISTS employee (
employee_id INT NOT NULL PRIMARY KEY,
employee_name VARCHAR(45) NOT NULL,
employee_salary VARCHAR(45) NULL,
employee_contactno VARCHAR(45) NULL,
employee_projectid INT NOT NULL REFERENCES project(project_id) ON DELETE SET NULL ON UPDATE CASCADE,
report_to VARCHAR(45) REFERENCES employee(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
d_id INT NOT NULL REFERENCES designation(designation_id) ON DELETE NO ACTION ON UPDATE CASCADE)
COMMENT='Weak entity';

CREATE TABLE IF NOT EXISTS project (
project_id INT NOT NULL,
project_title VARCHAR(45) NOT NULL,
PRIMARY KEY (project_id))
COMMENT='Strong entity';


CREATE TABLE IF NOT EXISTS designation (
did INT NOT NULL,
designation VARCHAR(45) NULL,
rank VARCHAR(45) NULL,
PRIMARY KEY (did))
COMMENT='Strong entity';




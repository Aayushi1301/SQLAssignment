CREATE DATABASE IF NOT EXISTS ProjEmp ;
USE ProjEmp ;


CREATE TABLE IF NOT EXISTS employee (
employee_id INT NOT NULL PRIMARY KEY,
employee_name VARCHAR(45) NOT NULL,
employee_salary VARCHAR(45) ,
employee_contactno VARCHAR(45) ,
employee_projectid INT NOT NULL REFERENCES project(project_id) ON DELETE SET NULL ON UPDATE CASCADE,
report_to VARCHAR(45) REFERENCES employee(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
d_id INT NOT NULL REFERENCES designation(designation_id) ON DELETE NO ACTION ON UPDATE CASCADE)
COMMENT='Weak entity';

CREATE TABLE IF NOT EXISTS project (
project_id INT NOT NULL PRIMARY KEY,
project_title VARCHAR(45) NOT NULL)
COMMENT='Strong entity';


CREATE TABLE IF NOT EXISTS designation (
did INT NOT NULL PRIMARY KEY ,
designation VARCHAR(45) ,
rank VARCHAR(45))
COMMENT='Strong entity';




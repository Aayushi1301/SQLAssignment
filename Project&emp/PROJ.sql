CREATE DATABASE ProjEmp ;
USE ProjEmp ;


CREATE TABLE IF NOT EXISTS employee (
employee_id INT NOT NULL,
employee_name VARCHAR(45) NOT NULL,
employee_salary VARCHAR(45) NULL,
employee_contactno VARCHAR(45) NULL,
employee_projectid INT NOT NULL,
report_to VARCHAR(45) NULL,
d_id INT NOT NULL,
PRIMARY KEY (employee_id),
FOREIGN KEY (employee_projectid)
REFERENCES project(project_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (report_to)
REFERENCES designation(eid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (d_id)
REFERENCES designation(designation_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
COMMENT='Weak entity');

CREATE TABLE IF NOT EXISTS project (
project_id INT NOT NULL,
project_title VARCHAR(45) NOT NULL,
projectcol VARCHAR(45) NULL,
PRIMARY KEY (project_id),
COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS designation (
did INT NOT NULL,
designation VARCHAR(45) NULL,
rank VARCHAR(45) NULL,
PRIMARY KEY (did),
COMMENT='Strong entity');




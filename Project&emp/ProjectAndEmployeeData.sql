USE ProjEmp;
INSERT INTO employee values(1,'Jack',50000,+919162503897,2,1,1);
INSERT INTO employee values(2,'Jackie',51000,+918152503897,1,1,2);
INSERT INTO employee values(3,'Mack',60000,+918342503897,2,2,3);



INSERT INTO project values(1,'SMB');
INSERT INTO project values(2,'PPD');
INSERT INTO project values(3,'CCY');


INSERT INTO designation values(1,'CEO',1);
INSERT INTO designation values(2,'HR',2);
INSERT INTO designation values(3,'Manager',3);


UPDATE employee SET employee_salary=70000 WHERE employee_name='Mack';
UPDATE project SET project_name='RYZ' WHERE project_id=1;
UPDATE designation SET designation='Project Manager' WHERE desination='Manager';


DELETE FROM designation WHERE did=2;
DELETE FROM project WHERE project_id=1;
DELETE FROM employee WHERE eid=1;



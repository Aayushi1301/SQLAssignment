INSERT INTO train VALUES(1,'steel express','hwh','tata');
INSERT INTO train VALUES(2,'janstatabdi','tata','hwh');


INSERT INTO customer VALUES(1,'ria','sri',22,'98078675');
INSERT INTO customer VALUES(2,'joy','de',50,'88900976');


INSERT INTO ticket VALUES(1,600,0,2,1,'kgp','gmh');
INSERT INTO ticket VALUES(2,500,0,1,2,'rkh','shc');

UPDATE train SET  source='rnc' WHERE source='kgp';
UPDATE customer SET  last_name='kri' WHERE last_name='sri';
UPDATE ticket SET  from_='rnc' WHERE to_='shc';



DELETE FROM train where train_id=1;
DELETE FROM customer where customer_age=22;
DELETE FROM ticket where ticket_price=600;

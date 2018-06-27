USE Cab_Rental ;
INSERT INTO Cab VALUES(1,'sedan',2012);
INSERT INTO Cab VALUES(2,'share',2113);

INSERT INTO driver VALUES(1,'Amar','9876543210','4*');
INSERT INTO driver VALUES(2,'Jubair','9087654321','5*');

INSERT INTO customer VALUES(1,'priya','rani','pr@gmail.com','980787867');
INSERT INTO customer VALUES(2,'kumar','prakash','abc@gmail.com','90876534');

INSERT INTO booking VALUES(1,1,2,2,'2018-05-02 07:10:01','2018-05-02 08:00:01','Madhapur','airport');
INSERT INTO booking VALUES(2,2,1,1,'2017-05-11 07:00:01','2017-05-11 07:10:11','DLF','hi-tech');

UPDATE Cab set cab_name='suv' WHERE cab_name='sedan';
UPDATE driver set driver_rating='3*' WHERE driver_rating='4*';
UPDATE customer set first_name='rai' WHERE first_name='kumar';
UPDATE booking SET drop_= 'railway station' WHERE drop_='airport';


DELETE FROM Cab WHERE cab_id=1;
DELETE FROM customer WHERE customer_id=1;
DELETE FROM driver WHERE driver_id=1;
DELETE FROM booking WHERE booking_id=1;

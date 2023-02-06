/* Name of the project : Food delivery Application
Course number : ISMG6080  
Title : DBMS
Semester : Spring 2021
year :  2021
Group number : 13 
Name : Spandana Narahari
Oracle account user Id : ORA41
project tables Database : cloud database
*/

/* Adding Drop table statements in the code
to drop tables created in the prior run. This is for debugging.
When code is re-run, those tables will be created again. 
Without those drop table statements, some tables from the 
previous run remain while others are not created. This 
can prevent new tables from being created due to
constraints. Also, sometimes, some rows are inserted
and other rows are not due to errors, which will cause 
entity integrity rule violation when you run the script again.
Starting with dropping table statements
allows easy debugging.*/

DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE DELIVERYAGENT CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT CASCADE CONSTRAINTS;
DROP TABLE ORD CASCADE CONSTRAINTS;
DROP TABLE MENUITEM CASCADE CONSTRAINTS;
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE ORDERITEM CASCADE CONSTRAINTS;


/* When tables and constraints are dropped,
they go to the recyclebin.If you query 
your contraints to verify they are created,
you'll see constraint names similar to this: 
BIN$NGPSQZbrQA+d1QyHg9tXog==$0 for those 
dropped contraints.
To remove those tables and constraints
permanently from the recylebin, purge it.*/

Purge RecycleBin; 

/*Create Customer table and insert data before
creating ord table and data due to referential
integrity rule.*/

CREATE TABLE CUSTOMER(
 CUSTID              NUMBER(4) NOT NULL,
 FNAME               VARCHAR2(14),
 LNAME               VARCHAR2(13),
 ADDRESS             VARCHAR2 (40),
 PHONE               VARCHAR2 (13),
 EMAIL               VARCHAR2 (30),
CONSTRAINT CUSTOMER_PRIMARY_KEY PRIMARY KEY(CUSTID));
INSERT INTO CUSTOMER VALUES (1001,'Marion','Garcia','345 VIEWRIDGE','4155986609','mariongarc@gmail.com');
INSERT INTO CUSTOMER VALUES(1002,'Perry','Harmon','490 BOLI RD.','4153681223','perryharm@gmail.com');
INSERT INTO CUSTOMER VALUES(1003,'Jana','Nguyen','9722 HAMILTON','4156443341','jananguyen@gmail.com');
INSERT INTO CUSTOMER VALUES(1004,'Alonzo','Peters','HILLVIEW MALL','4156779312','alonzopete@gmail.com');
INSERT INTO CUSTOMER VALUES(1005,'Noah','Dawson','574 SUYYYYY RD','4089962323','charlesd@gmail.com');
INSERT INTO CUSTOMER VALUES(1006,'Megan','Rose','453 N Amelia St','4805756616','meghanrose@gmail.com');
INSERT INTO CUSTOMER VALUES(1007,'Isabella','patel','453 Stardust Ct','5059826734','isabella@gmail.com');
INSERT INTO CUSTOMER VALUES(1008,'Angelica','macarona','454 N Elkhart St #A','5093774127','angelica@gmail.com');
INSERT INTO CUSTOMER VALUES(1009,'Myra','peterson','4540 Yarrow St','5126957151','myrapeter@gmail.com');
INSERT INTO CUSTOMER VALUES(1010,'Laynie','tiptun','45409 Stagecoach Rd','5152689312','laynie@gmail.com');
INSERT INTO CUSTOMER VALUES(1011,'Damon','salvatore','4545 Seaway Cir','5203160575','damonsalva@gmail.com');
INSERT INTO CUSTOMER VALUES(1012,'Stefan','salvatore','0326 133rd Hwy','3032000292','stefan@gmail.com');
INSERT INTO CUSTOMER VALUES(1013,'Elena','Gilbert','794 Eiger Rd','3032000270','elenagil@gmail.com');
INSERT INTO CUSTOMER VALUES(1014,'Caroline','forbes','6936 Raleigh St','3032009539','caroline@gmail.com');
INSERT INTO CUSTOMER VALUES(1015,'Luke','skywalker','4410 Arapahoe Ave #135','3032021164','lukesky@gmail.com');

/*Create DELIVERYAGENT table and insert data before
creating ord table and data due to referential
integrity rule.*/
DROP TABLE DELIVERYAGENT CASCADE CONSTRAINTS;
CREATE TABLE DELIVERYAGENT(
 AGENTID             VARCHAR2(4) NOT NULL,
 ANAME               VARCHAR2(14),
 VEHICLE#            VARCHAR2(9),
 APHONE              VARCHAR2 (13),
 CONSTRAINT AGENT_PRIMARY_KEY PRIMARY KEY(AGENTID));
INSERT INTO DELIVERYAGENT VALUES('A1','Alvin','TA136','8749687432');
INSERT INTO DELIVERYAGENT VALUES('A10','Cameron','BA517','6787842060');
INSERT INTO DELIVERYAGENT VALUES('A11','Nick','DC621','6787842091');
INSERT INTO DELIVERYAGENT VALUES('A12','Julie','CA641','7024385996');
INSERT INTO DELIVERYAGENT VALUES('A2','Annette','GH179','9847885521');
INSERT INTO DELIVERYAGENT VALUES('A3','Myron','FF181','3127672314');
INSERT INTO DELIVERYAGENT VALUES('A4','Miranda','CH785','7266621234');
INSERT INTO DELIVERYAGENT VALUES('A5','Micheal','BB321','3332221514');
INSERT INTO DELIVERYAGENT VALUES('A6','Ted','EG124','7192034459');
INSERT INTO DELIVERYAGENT VALUES('A7','Barney','NA777','7192034249');
INSERT INTO DELIVERYAGENT VALUES('A8','Mitchell','LB345','7062912059');
INSERT INTO DELIVERYAGENT VALUES('A9','Robinson','AC545','3034692162');

/*Create PAYMENT table and insert data before
creating ord table and data due to referential
integrity rule.*/

CREATE TABLE PAYMENT(
 PID             VARCHAR2(4) NOT NULL,
 STATUS          VARCHAR2(14),
 PDATE            DATE,
 TYPEID          NUMBER(4),
 CONSTRAINT PAYMENT_PRIMARY_KEY PRIMARY KEY(PID));
 INSERT INTO PAYMENT VALUES('P1','Pending',TO_DATE('5-2-2009','DD-MM-YYYY'),1);
INSERT INTO PAYMENT VALUES('P2','Success',TO_DATE('5-6-2010','DD-MM-YYYY'),2);
INSERT INTO PAYMENT VALUES('P3','Failed',TO_DATE('7-5-2009','DD-MM-YYYY'),4);
INSERT INTO PAYMENT VALUES('P4','PaymentProcess',TO_DATE('4-4-2008','DD-MM-YYYY'),3);
INSERT INTO PAYMENT VALUES('P5','Refund',TO_DATE('7-7-2009','DD-MM-YYYY'),3);
INSERT INTO PAYMENT VALUES('P6','PaymentCancel',TO_DATE('5-2-2010','DD-MM-YYYY'),1);

/*Create RESTAURANT table and insert data before
creating ord table and menuitem table and data due to referential
integrity rule.*/

CREATE TABLE RESTAURANT(
RID              NUMBER (6) NOT NULL,
RNAME            VARCHAR2 (45),
RPHONE           VARCHAR2 (10),
RLOCATION        VARCHAR2 (40),
RADDRESS         VARCHAR2 (70),
CONSTRAINT RESTAURANT_RID_PK PRIMARY KEY (RID));
INSERT INTO RESTAURANT VALUES(101,'McDonalds','3032233987','Highlands Ranch','9235 S Broadway, Highlands Ranch, CO 80129');
INSERT INTO RESTAURANT VALUES(102,'Starbucks','3032217132','Lucent Town Center','1519 Park Central Drive, Highlands Ranch, CO 80129');
INSERT INTO RESTAURANT VALUES(103,'Taco Bell','3032192806','7911 S Broadway','7911 S Broadway, Littleton, CO 80122');
INSERT INTO RESTAURANT VALUES(104,'Subway','3032176673','S Broadway','9245 S Brdway, Highlands Ranch, CO 80129');
INSERT INTO RESTAURANT VALUES(105,'Corner Bakery','3032152312','Briarwood Ave','2253 E Briarwood Ave, Centennial, CO 80122');
INSERT INTO RESTAURANT VALUES(106,'Panera bread','3032000323','Telluride','8254 Silver Glen Dr,CO 80217');
INSERT INTO RESTAURANT VALUES(107,'Chickfill-a','3032020609','Windsor','42605 County Rd #36,Steamboat Springs,CO 80712');
INSERT INTO RESTAURANT VALUES(108,'Chipotle','3032042310','Federal Heights','1375 View Ridge Bennett, Colorado(CO), 80102');
INSERT INTO RESTAURANT VALUES(109,'B-Dubs','3032060875','Towaoc','1530 Aspen, Colorado(CO), 81612');
INSERT INTO RESTAURANT VALUES(110,'Dominos','3032083339','Kremmling','206 Lyell St,Monte Vista, Colorado(CO), 81144');
INSERT INTO RESTAURANT VALUES(111,'BIBIPOP Asian grill','3032109872','Severance','984 County Rd #245,New Castle, Colorado(CO), 81647');
INSERT INTO RESTAURANT VALUES(112,'Coldstone','3032134470','Genesee','239 Monares Ln,Erie, Colorado(CO), 80516');

/*Create ORD table and insert data.ORD table has four foreign keys and one primary key*/
CREATE TABLE ORD(
ORDID               NUMBER (4) NOT NULL,
ODATE                 DATE,
TOTALAMOUNT           NUMBER (8),
CUSTID                NUMBER(4) ,
RID                   NUMBER (6) ,
PID                   VARCHAR2(4) ,
AGENTID               VARCHAR2(4) ,
CONSTRAINT ORD_ORDID_PK PRIMARY KEY(ORDID),
CONSTRAINT ORD_CUSTID_FK FOREIGN KEY(CUSTID) REFERENCES CUSTOMER(CUSTID),
CONSTRAINT ORD_RID_FK FOREIGN KEY(RID) REFERENCES RESTAURANT(RID),
CONSTRAINT ORD_PID_FK FOREIGN KEY(PID) REFERENCES PAYMENT(PID),
CONSTRAINT ORD_AGENTID_FK FOREIGN KEY(AGENTID) REFERENCES DELIVERYAGENT(AGENTID));
INSERT INTO ORD VALUES(1158, TO_DATE('5-1-2009','DD-MM-YYYY'),'520 ',1005,104,'P1','A2');
INSERT INTO ORD VALUES(1234, TO_DATE('5-6-2010','DD-MM-YYYY'),'150',1001,103,'P2','A1');
INSERT INTO ORD VALUES(1308, TO_DATE('9-2-2011','DD-MM-YYYY'),'500',1009,109,'P3','A1');
INSERT INTO ORD VALUES(1675, TO_DATE('6-5-2012','DD-MM-YYYY'),'800',1007,106,'P2','A9');
INSERT INTO ORD VALUES(3321, TO_DATE('5-3-2010','DD-MM-YYYY'),'333 ',1001,105,'P2','A4');
INSERT INTO ORD VALUES(4040, TO_DATE('4-4-2009','DD-MM-YYYY'),'200',1014,101,'P4','A6');
INSERT INTO ORD VALUES(4231, TO_DATE('7-5-2009','DD-MM-YYYY'),'320 ',1003,102,'P3','A2');
INSERT INTO ORD VALUES(5512, TO_DATE('4-4-2008','DD-MM-YYYY'),'152 ',1004,105,'P4','A3');
INSERT INTO ORD VALUES(6789, TO_DATE('5-2-2009','DD-MM-YYYY'),'722 ',1005,103,'P1','A5');
INSERT INTO ORD VALUES(7032, TO_DATE('10-10-2012','DD-MM-YYYY'),'900',1012,110,'P2','A5');
INSERT INTO ORD VALUES(9052, TO_DATE('9-10-2014','DD-MM-YYYY'),'600',1015,112,'P3','A2');
INSERT INTO ORD VALUES(9985, TO_DATE('3-1-2012','DD-MM-YYYY'),'150',1013,107,'P1','A2');


CREATE TABLE MENUITEM(
MID                   NUMBER (4) NOT NULL,
MDESCRIPTION          VARCHAR2(30),
UNITPRICE             NUMBER (8),
RID                   NUMBER (6) NOT NULL,
CONSTRAINT MENUITEM_MID_PK PRIMARY KEY(MID),
CONSTRAINT MENUITEM_RID_FK FOREIGN KEY(RID) REFERENCES RESTAURANT(RID));

INSERT INTO MENUITEM VALUES(1,'Chicken Pomodori',75,107);
INSERT INTO MENUITEM VALUES(2,'Pasta',170,112);
INSERT INTO MENUITEM VALUES(3,'Chicken and Bacon Ranch',9,104);
INSERT INTO MENUITEM VALUES(4,'American Club Footlong',10,108);
INSERT INTO MENUITEM VALUES(5,'Nacho Fries Box',6,105);
INSERT INTO MENUITEM VALUES(6,'Supreme Taco Party Pack',24,103);
INSERT INTO MENUITEM VALUES(7,'Iced Caramel Macchiato',5,109);
INSERT INTO MENUITEM VALUES(8,'Caffè Latte',4,102);
INSERT INTO MENUITEM VALUES(9,'Spicy Chicken Sandwich Meal',9,101);
INSERT INTO MENUITEM VALUES(10,'Double Bacon Quarter Pounder',11,101);
INSERT INTO MENUITEM VALUES(11,'Biriyani',13,111);
INSERT INTO MENUITEM VALUES(12,'Burrito',6,103);
select * from menuitem;

CREATE TABLE ORDERITEM(
MID                 NUMBER (4) NOT NULL,
ORDID               NUMBER (4) NOT NULL,
CURRENTPRICE        NUMBER (4),
QTY                 NUMBER (3),
CONSTRAINT ORDERITEM_MID_PK PRIMARY KEY(MID,ORDID),
CONSTRAINT ORDERITEM_MID_FK FOREIGN KEY(MID) REFERENCES MENUITEM(MID),
CONSTRAINT ORDERITEM_ORDID_FK FOREIGN KEY(ORDID) REFERENCES ORD(ORDID));

INSERT INTO ORDERITEM VALUES(1,1234,75,2);
INSERT INTO ORDERITEM VALUES(2,1158,170,3);
INSERT INTO ORDERITEM VALUES(3,5512,152,1);
INSERT INTO ORDERITEM VALUES(4,6789,144,5);
INSERT INTO ORDERITEM VALUES(5,1158,170,1);
INSERT INTO ORDERITEM VALUES(6,3321,83,4);
INSERT INTO ORDERITEM VALUES(7,4231,45,7);
INSERT INTO ORDERITEM VALUES(8,6789,361,2);
INSERT INTO ORDERITEM VALUES(9,4231,46,8);
INSERT INTO ORDERITEM VALUES(10,5512,76,2);
SELECT * FROM ORDERITEM;

commit; --commit so all inserted data are saved.


select * from ord;
select * from restaurant;
select * from menuitem;
select * from payment;
select * from customer;
select * from deliveryagent;


--find all orders who ordered from corner bakery
select ord.ordid,restaurant.rname from ord inner join restaurant on (ord.rid=restaurant.rid) where restaurant.rname='Corner Bakery';

--Find the vehicle numbers of agent whose date of order is in  2009 and 2010.Show agent name,vehicle number and order date
select deliveryagent.aname,deliveryagent.vehicle#,ord.odate from deliveryagent inner join ord on (deliveryagent.agentid=ord.agentid) where To_char(ord.odate,'yyyy')='2009' or To_char(ord.odate,'yyyy')='2010';

-- Find the customers whose payment status is success.Show customer name,customer id and staus of the payment
select customer.custid,customer.fname,payment.status from customer inner join ord on (customer.custid=ord.custid) inner join payment on (payment.pid=ord.pid) where payment.status like '%Success%';

--Find the total amount spent by each customer on orders.
select custid,sum(totalamount)"Total" from ord group by custid;

--Find the total revenue accrued in each year.
select to_char(odate, 'yyyy') "Year", sum(totalamount) "Total Revenue" from ord group by to_char(odate, 'yyyy');

--Find the total number of orders placed by each customer with CustId=1001 and CustId=1004.
select custid,count(custid) from ord where custid='1001' or custid='1004' group by custid;

--Find Agent numbers for those agents who represent 2 or more customers
select agentid, count(custid)from ord group by agentid having count(custid)>=2;

--Find the name of the delivery agent who represented a customer in viewridge.
select agentid,aname from deliveryagent where agentid in(
select agentid from ord where custid in (
select custid from customer where lower(address) like '%viewridge%'));

--Find all restaurant names that did not deliver between 01-Jan-2009 to 31-Dec-2010.
select rid,rname from restaurant where rid in(
select rid from ord where to_char(odate, 'yyyy')  NOT in ('2009','2010'));

-- Find customers (custid, name) who ordered food in october

Select customer.custid, customer.fname from customer inner join Ord on (customer.custid=ord.custid) where To_char(ODate, 'MM')='10';


















 










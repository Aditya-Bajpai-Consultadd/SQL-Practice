
create database practice;
use practice;
CREATE TABLE Customer (
CUSTOMER_ID int PRIMARY KEY,
CUSTOMER_DOB date,
ORDER_ID int,
ADDRESS_ID int
);
CREATE TABLE Orders (
ORDER_ID int PRIMARY KEY,
PRODUCT_ID int,
DATE_OF_ORDER date
);
CREATE TABLE Address (
ADDRESS_ID int PRIMARY KEY,
LINE_1 varchar(255),
PINCODE varchar(10)
);
CREATE TABLE Product (
PRODUCT_ID int PRIMARY KEY,
PRICE DECIMAL(7,2),
RATINGS FLOAT
);
ALTER TABLE Customer 
ADD FOREIGN KEY (ORDER_ID) References ORDERS(ORDER_ID);

ALTER TABLE Customer 
ADD FOREIGN KEY (ADDRESS_ID) References ADDRESS(ADDRESS_ID);

ALTER TABLE Orders 
ADD FOREIGN KEY (PRODUCT_ID) References PRODUCT(PRODUCT_ID);




INSERT INTO Product (PRODUCT_ID, PRICE, RATINGS)
VALUES (1, 200, 4.5), (2,150,5.0), (3,125,3.8);

INSERT INTO Orders (ORDER_ID, PRODUCT_ID, DATE_OF_ORDER)
VALUES (1, 1, '2025-01-01'), (2,1,'2022-02-01'), (3,2,'2024-09-11');

INSERT INTO Address (ADDRESS_ID, LINE_1, PINCODE)
VALUES (1, '123 Main Street', '123456'),(2, 'Pune Kharadi ', '12346'), (3, 'Indore MP', '452001') ;

INSERT INTO Customer (CUSTOMER_ID, CUSTOMER_DOB, ORDER_ID, ADDRESS_ID)
VALUES (1, '1990-05-15', 1, 1), (1, '1990-05-15', 1, 1);


---UPDATE COMMAND
--Update the address of a specific customer.
UPDATE Address
SET LINE_1 = '123, Tech Park', PINCODE = '23456'
WHERE ADDRESS_ID = 1;

-- DLETE COMMAND
--Delete a customer and their corresponding order
-- Delete the order first due to foreign key constraint
DELETE FROM Orders
WHERE ORDER_ID = 1;

-- Delete the customer
DELETE FROM Customer
WHERE CUSTOMER_ID = 1;

--SELECT COMMAND 
--Get all details of every order ever.
Select * from Orders;
--GRANT COMMAND 
--Grant a user permission to select and insert data into the Customer table.
GRANT SELECT, INSERT ON Customer TO 'username'@'hostname';
---REVOKE COMMAND
--Revoke the user's permission to insert data into the Customer table.
REVOKE INSERT ON Customer FROM 'username'@'hostname';


--Begin COMMAND 
--Start a new transaction to insert data in table.
BEGIN;

-- Example: Insert a new address and link it to a customer
INSERT INTO Address (ADDRESS_ID, LINE_1, PINCODE)
VALUES (4,'Pandurang Nagar Pune', '987654');

INSERT INTO Customer (CUSTOMER_ID, CUSTOMER_DOB, ORDER_ID, ADDRESS_ID)
VALUES (5, '1995-07-20', 2, 2);

--This transaction is right now open and waiting to be committed to roll back 

COMMIT; -- the above transaction is now committed
ROLLBACK; -- Similarily if wesomething unwanted happens while the transaction occurs 
--then the changes from this tranaction rolls back and Db comes again into consistent state

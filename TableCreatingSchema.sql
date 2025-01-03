
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




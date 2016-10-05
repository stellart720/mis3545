CREATE DATABASE SampleDb
Go

USE SampleDb
Go

--  Create the customer and order tables
CREATE TABLE Customer(
	CustomerID bigint NOT NULL PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	CustomerRanking varchar(50) NULL)

CREATE TABLE OrderHeader(
	OrderHeaderID bigint NOT NULL,
	CustomerID bigint NOT NULL,
	OrderTotal money NOT NULL)

-- Create the relationship
ALTER TABLE OrderHeader ADD CONSTRAINT FK_OrderHeader_Customer
FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)

-- Add a few Customers
INSERT INTO Customer (CustomerID, FirstName, LastName, CustomerRanking) VALUES
(1, 'John', 'Lennon', NULL),
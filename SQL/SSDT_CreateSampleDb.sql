CREATE DATABASE SampleDb
Go

USE SampleDb
Go

--  Create the customer and order tables
CREATE TABLE Customer(
	CustomerID Bigint NOT NULL PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	CustomerRanking varchar(50) NULL)


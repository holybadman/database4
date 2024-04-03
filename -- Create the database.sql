-- Create the database
CREATE DATABASE IF NOT EXISTS it_firm_database;
USE it_firm_database;
-- Create the Employee table
CREATE TABLE IF NOT EXISTS Employee (
 EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(100),
 Position VARCHAR(100),
 Department VARCHAR(100),
 Salary DECIMAL(10, 2),
 DateHired DATE,
 ContactInfo VARCHAR(255)
);
-- Create the Project table
CREATE TABLE IF NOT EXISTS Project (
 ProjectID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(100),
 Description TEXT,
 StartDate DATE,
 EndDate DATE,
 Status VARCHAR(50),
 Budget DECIMAL(10, 2)
);
-- Create the Client table
CREATE TABLE IF NOT EXISTS Client (
 ClientID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(100),
 ContactPerson VARCHAR(100),
 ContactInfo VARCHAR(255)
);
-- Create the Technology table
CREATE TABLE IF NOT EXISTS Technology (
 TechnologyID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(100),
 Description TEXT
);
-- Create the Employee_Project table for the many-to-many relationship
CREATE TABLE IF NOT EXISTS Employee_Project (
 EmployeeID INT,
 ProjectID INT,
 PRIMARY KEY (EmployeeID, ProjectID),
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
 FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);
-- Create the Project_Client table for the many-to-one relationship
ALTER TABLE Project
ADD COLUMN ClientID INT,
ADD CONSTRAINT fk_project_client
FOREIGN KEY (ClientID)
REFERENCES Client(ClientID);
-- Create the Project_Technology table for the many-to-many relationship
CREATE TABLE IF NOT EXISTS Project_Technology (
 ProjectID INT,
 TechnologyID INT,
 PRIMARY KEY (ProjectID, TechnologyID),
 FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
 FOREIGN KEY (TechnologyID) REFERENCES Technology(TechnologyID)
);
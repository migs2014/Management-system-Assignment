-- Create Database
CREATE DATABASE studentdb;
-- use the database
USE studentdb;
-- Create Tables
CREATE TABLE class (
    classID INT PRIMARY KEY,
    className VARCHAR(100) NOT NULL
);
INSERT INTO class (classID, className) VALUES
(1, 'Grade 10'),
(2, 'Grade 11'),
(3, 'Grade 12');


-- stream table
CREATE TABLE streams (
    streamID INT PRIMARY KEY,
    streamName VARCHAR(100) NOT NULL,
    classID INT,
    FOREIGN KEY (classID) REFERENCES class(classID)
);

INSERT INTO streams (streamID, streamName, classID) VALUES
(1, 'NORTH', 1),
(2, 'EAST', 2),
(3, 'WEST', 3),
(4, 'SOUTH', 2);

-- Create student table
CREATE TABLE student (
    studentID INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    secondName VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    classID INT,
    streamID INT,
    FOREIGN KEY (classID) REFERENCES class(classID),
    FOREIGN KEY (streamID) REFERENCES streams(streamID)
);
INSERT INTO student (studentID, firstName, secondName, gender, classID, streamID) VALUES
(1, 'Alice', 'Njeri', 'Female', 1, 1),
(2, 'Bob', 'Williams', 'Male', 2, 3),
(3, 'Wesley', 'Rotich', 'Male', 3, 4);

-- Create parent table
CREATE TABLE parent (
    parentID INT PRIMARY KEY,
    parentName VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone1 VARCHAR(15) NOT NULL,
    phone2 VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    postalAddress VARCHAR(255),
    studentID INT,
    FOREIGN KEY (studentID) REFERENCES student(studentID) ON DELETE CASCADE
);
INSERT INTO parent (parentID, parentName, gender, phone1, phone2, email, postalAddress, studentID) VALUES
(1, 'David Kamau', 'Male', '0700111222', '0711223344', 'davidkamau@gmail.com', '123 Naivasha', 1),
(2, 'Emma Anyango', 'Female', '0722334455', NULl, 'emma.williams@gmail.com', '456 Kisumu', 2),
(3, 'Frank Kiptoo', 'Male', '0733445566', '0744556677', 'frankkiptoo@gmail.com', '789 Kericho', 3);

-- create  county table
CREATE TABLE county (
    countyID INT PRIMARY KEY,
    countyName VARCHAR(100) NOT NULL,
    parentID INT,
    FOREIGN KEY (parentID) REFERENCES parent(parentID) ON DELETE CASCADE
);
INSERT INTO county (countyID, countyName, parentID) VALUES
(1, 'Nakuru', 1),
(2, 'Kisumu', 2),
(3, 'Kericho', 3);

-- Create pathway table
CREATE TABLE pathways (
    pathwayID INT PRIMARY KEY,
    pathwayName VARCHAR(100) NOT NULL,
    studentID INT,
    FOREIGN KEY (studentID) REFERENCES student(studentID) ON DELETE CASCADE
);
INSERT INTO pathways (pathwayID, pathwayName, studentID) VALUES
(1, 'STEM', 1),
(2, 'Social Sciences', 2),
(3, 'Arts and Sports', 3);


-- Create subject table
CREATE TABLE subjects (
    subjectID INT PRIMARY KEY,
    subjectName VARCHAR(100) NOT NULL,
    pathwayID INT,
    FOREIGN KEY (pathwayID) REFERENCES pathways(pathwayID) 
);
INSERT INTO subjects (subjectID, subjectName, pathwayID) VALUES
-- STEM Pathway
(1, 'Applied Sciences', 1),
(2, 'Pure Sciences', 1),
(3, 'Technical Studies', 1),

-- Social Sciences Pathway
(4, 'Language and Literature', 2),
(5, 'Humanities and Business Studies', 2),
(6, 'Applied Sciences', 2),

-- Arts & Sports Pathway
(7, 'Sports Science', 3),
(8, 'Art', 3);


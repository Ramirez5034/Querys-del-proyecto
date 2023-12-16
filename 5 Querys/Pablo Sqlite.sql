--Tables
CREATE TABLE [User] (
    idUser serial PRIMARY KEY,
    userName VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    creationDate DATE,
    idUserModify INT,
    modifiedDate DATE
);
--Course
CREATE TABLE Course (
    CourseID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(50) NOT NULL,
    Credits INTEGER NOT NULL,
    Code VARCHAR(20) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUserCreate INT NOT NULL,
    creationDate Timestamp NOT NULL,
    idUserModify INT,
    modifiedDate Timestamp
);

--Class
CREATE TABLE Class (
    ClassID INTEGER PRIMARY KEY AUTOINCREMENT,
    EmployeeID INTEGER NOT NULL,
    CourseID INTEGER NOT NULL,
    PeriodID INTEGER NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUserCreate INT NOT NULL,
    creationDate Timestamp NOT NULL,
    idUserModify INT,
    modifiedDate Timestamp,
    FOREIGN KEY (CourseID) REFERENCES Course (CourseID)
);

--Opportunity
CREATE TABLE Opportunity (
    OpportunityID INTEGER PRIMARY KEY AUTOINCREMENT,
    Number INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUserCreate INT NOT NULL,
    creationDate Timestamp NOT NULL,
    idUserModify INT,
    modifiedDate Timestamp
);

--Kardex
CREATE TABLE Kardex (
    KardexID INTEGER PRIMARY KEY AUTOINCREMENT,
    ClassID INTEGER NOT NULL,
    OpportunityID INTEGER NOT NULL,
    StudentID INTEGER NOT NULL,
    Grade DECIMAL(5, 2) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUserCreate INT NOT NULL,
    creationDate Timestamp NOT NULL,
    idUserModify INT,
    modifiedDate Timestamp,
    FOREIGN KEY (ClassID) REFERENCES Class (ClassID),
    FOREIGN KEY (OpportunityID) REFERENCES Opportunity (OpportunityID)
);

--CareerService
CREATE TABLE CareerService (
    CareerServiceID INTEGER PRIMARY KEY AUTOINCREMENT,
    CareerID INTEGER NOT NULL,
    EmployeeID INTEGER NOT NULL,
    ServiceDate DATE NOT NULL,
    Description VARCHAR(100) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUserCreate INT NOT NULL,
    creationDate Timestamp NOT NULL,
    idUserModify INT,
    modifiedDate Timestamp
);

--Index
CREATE INDEX IF NOT EXISTS IX_Course ON Course (CourseID);
CREATE INDEX IF NOT EXISTS IX_Class ON Class (ClassID);
CREATE INDEX IF NOT EXISTS IX_Kardex ON Kardex (KardexID);
CREATE INDEX IF NOT EXISTS IX_CareerService ON CareerService (CareerServiceID);
CREATE INDEX IF NOT EXISTS IX_Opportunity ON Opportunity (OpportunityID);

--Insert
--Course
INSERT INTO Course (Name, Credits, Code) VALUES ('Introduction to Programming', 3, 'PROG101');
INSERT INTO Course (Name, Credits, Code) VALUES ('Business Ethics', 2, 'ETHICS201');
INSERT INTO Course (Name, Credits, Code) VALUES ('Advanced Calculus', 4, 'MATH301');

--Class
INSERT INTO Class (EmployeeID, CourseID, PeriodID) VALUES (1, 1, 1);
INSERT INTO Class (EmployeeID, CourseID, PeriodID) VALUES (2, 2, 2);
INSERT INTO Class (EmployeeID, CourseID, PeriodID) VALUES (3, 3, 3);

--Opportunity
INSERT INTO Opportunity (Number, Name) VALUES (1, 'Internship Opportunity at Company A');
INSERT INTO Opportunity (Number, Name) VALUES (2, 'Scholarship Opportunity for STEM Students');
INSERT INTO Opportunity (Number, Name) VALUES (3, 'Job Fair - Spring 2023');

--Kardex
INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade) VALUES (1, 1, 1, 95.5);
INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade) VALUES (2, 2, 2, 88.0);
INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade) VALUES (3, 3, 3, 76.5);

--CareerService
INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State) VALUES (1, 1, '2023-04-15', 'Career counseling', 'Active');
INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State) VALUES (2, 2, '2023-05-20', 'Job placement assistance', 'Active');
INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State) VALUES (3, 3, '2023-06-10', 'Resume review', 'Active');

CREATE TABLE Usser (
    idUsserr INT NOT NULL auto_increment,
    UsserrName VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUsserrCreate INT,
    creationDate DATE,
    idUsserrModify INT,
    modifiedDate DATE
);
--Course
CREATE TABLE Course (
    CourseID INT NOT NULL auto_increment,
    Name VARCHAR(50) NOT NULL,
    Credits INTEGER NOT NULL,
    Code VARCHAR(20) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUsserrCreate INT NOT NULL,
    creationDate Date NOT NULL,
    idUsserrModify INT,
    modifiedDate Date
);

--Class
CREATE TABLE Class (
    ClassID INT NOT NULL auto_increment,
    EmployeeID INTEGER NOT NULL,
    CourseID INTEGER NOT NULL,
    PeriodID INTEGER NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUsserrCreate INT NOT NULL,
    creationDate Date NOT NULL,
    idUsserrModify INT,
    modifiedDate Date,
);

--Opportunity
CREATE TABLE Opportunity (
    OpportunityID INT NOT NULL auto_increment,
    Number INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUsserrCreate INT NOT NULL,
    creationDate Date NOT NULL,
    idUsserrModify INT,
    modifiedDate Date
);

--Kardex
CREATE TABLE Kardex (
    KardexID INT NOT NULL auto_increment,
    ClassID INTEGER NOT NULL,
    OpportunityID INTEGER NOT NULL,
    StudentID INTEGER NOT NULL,
    Grade DECIMAL(5, 2) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUsserrCreate INT NOT NULL,
    creationDate Date NOT NULL,
    idUsserrModify INT,
    modifiedDate Date,
);

--CareerService
CREATE TABLE CareerService (
    CareerServiceID INT NOT NULL auto_increment,
    CareerID INTEGER NOT NULL,
    EmployeeID INTEGER NOT NULL,
    ServiceDate DATE NOT NULL,
    Description VARCHAR(100) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Status INTEGER DEFAULT 1 NOT NULL,
 idUsserrCreate INT NOT NULL,
    creationDate Date NOT NULL,
    idUsserrModify INT,
    modifiedDate Date
);

CREATE INDEX IX_Course ON Course (CourseID);
CREATE INDEX IX_Class ON Class (ClassID);
CREATE INDEX IX_Kardex ON Kardex (KardexID);
CREATE INDEX IX_CareerService ON CareerService (CareerServiceID);
CREATE INDEX IX_Opportunity ON Opportunity (OpportunityID);


-- Class
ALTER TABLE Class
ADD CONSTRAINT FK_ClassCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

ALTER TABLE Class
ADD CONSTRAINT FK_Classcreate FOREIGN KEY (idUsserrCreate) REFERENCES Usser (idUsserr);
ALTER TABLE Class
ADD CONSTRAINT FK_Classmodify FOREIGN KEY (idUsserrModify) REFERENCES Usser (idUsserr);
-- Kardex
ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexClass FOREIGN KEY (ClassID) REFERENCES Class (ClassID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexOpportunity FOREIGN KEY (OpportunityID) REFERENCES Opportunity (OpportunityID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_Kardexcreate FOREIGN KEY (idUsserrCreate) REFERENCES Usser (idUsserr);
ALTER TABLE Kardex
ADD CONSTRAINT FK_Kardexmodify FOREIGN KEY (idUsserrModify) REFERENCES Usser (idUsserr);

-- CareerService
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServicecreate FOREIGN KEY (idUsserrCreate) REFERENCES Usser (idUsserr);
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServicemodify FOREIGN KEY (idUsserrModify) REFERENCES Usser (idUsserr);

--Course

ALTER TABLE Course
ADD CONSTRAINT FK_Coursecreate FOREIGN KEY (idUsserrCreate) REFERENCES Usser (idUsserr);
ALTER TABLE Course
ADD CONSTRAINT FK_Coursemodify FOREIGN KEY (idUsserrModify) REFERENCES Usser (idUsserr);

--Opportunity
ALTER TABLE Opportunity
ADD CONSTRAINT FK_Opportunitycreate FOREIGN KEY (idUsserrCreate) REFERENCES Usser (idUsserr);
ALTER TABLE Opportunity
ADD CONSTRAINT FK_Opportunitymodify FOREIGN KEY (idUsserrModify) REFERENCES Usser (idUsserr);


INSERT INTO Usser (UsserrName, name, password, email, idUsserrCreate, creationDate)
VALUES ('sa', 'Super Admin', 'AdM1nPaSsW', 'superadmin@example.com', null, null),
       ('Pablo', 'Pablo Ramirez', 'Us3rPwd!23', 'yael_r3y@example.com', 1, '2023-12-08');

INSERT INTO Course (Name, Credits, Code, idUsserrCreate, creationDate)
VALUES ('Introduction to Programming', 3, 'PROG101');

INSERT INTO Course (Name, Credits, Code, idUsserrCreate, creationDate)
VALUES ('Business Ethics', 2, 'ETHICS201');

INSERT INTO Course (Name, Credits, Code, idUsserrCreate, creationDate)
VALUES ('Advanced Calculus', 4, 'MATH301');

INSERT INTO Class (EmployeeID, CourseID, PeriodID, idUsserrCreate, creationDate)
VALUES (1, 1, 1);

INSERT INTO Class (EmployeeID, CourseID, PeriodID, idUsserrCreate, creationDate)
VALUES (2, 2, 2);

INSERT INTO Class (EmployeeID, CourseID, PeriodID, idUsserrCreate, creationDate)
VALUES (3, 3, 3);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade, idUsserrCreate, creationDate)
VALUES (1, 1, 1, 95.5);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade, idUsserrCreate, creationDate)
VALUES (2, 2, 2, 88.0);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade, idUsserrCreate, creationDate)
VALUES (3, 3, 3, 76.5);

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State, idUsserrCreate, creationDate)
VALUES (1, 1, '2023-04-15', 'Career counseling', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State, idUsserrCreate, creationDate)
VALUES (2, 2, '2023-05-20', 'Job placement assistance', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State, idUsserrCreate, creationDate)
VALUES (3, 3, '2023-06-10', 'Resume review', 'Active');

INSERT INTO Opportunity (Number, Name, idUsserrCreate, creationDate)
VALUES (1, 'Internship Opportunity at Company A');

INSERT INTO Opportunity (Number, Name, idUsserrCreate, creationDate)
VALUES (2, 'Scholarship Opportunity for STEM Students');

INSERT INTO Opportunity (Number, Name, idUsserrCreate, creationDate)
VALUES (3, 'Job Fair - Spring 2023');

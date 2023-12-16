CREATE TABLE Use (
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

CREATE INDEX IX_Course ON Course (CourseID);
CREATE INDEX IX_Class ON Class (ClassID);
CREATE INDEX IX_Kardex ON Kardex (KardexID);
CREATE INDEX IX_CareerService ON CareerService (CareerServiceID);
CREATE INDEX IX_Opportunity ON Opportunity (OpportunityID);


-- Class
ALTER TABLE Class
ADD CONSTRAINT FK_ClassCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

ALTER TABLE Class
ADD CONSTRAINT FK_Classcreate FOREIGN KEY (idUserCreate) REFERENCES Use (idUser);
ALTER TABLE Class
ADD CONSTRAINT FK_Classmodify FOREIGN KEY (idUserModify) REFERENCES Use (idUser);
-- Kardex
ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexClass FOREIGN KEY (ClassID) REFERENCES Class (ClassID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexOpportunity FOREIGN KEY (OpportunityID) REFERENCES Opportunity (OpportunityID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_Kardexcreate FOREIGN KEY (idUserCreate) REFERENCES Use (idUser);
ALTER TABLE Kardex
ADD CONSTRAINT FK_Kardexmodify FOREIGN KEY (idUserModify) REFERENCES Use (idUser);

-- CareerService
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServicecreate FOREIGN KEY (idUserCreate) REFERENCES Use (idUser);
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServicemodify FOREIGN KEY (idUserModify) REFERENCES Use (idUser);

--Course

ALTER TABLE Course
ADD CONSTRAINT FK_Coursecreate FOREIGN KEY (idUserCreate) REFERENCES Use (idUser);
ALTER TABLE Course
ADD CONSTRAINT FK_Coursemodify FOREIGN KEY (idUserModify) REFERENCES Use (idUser);

--Opportunity
ALTER TABLE Opportunity
ADD CONSTRAINT FK_Opportunitycreate FOREIGN KEY (idUserCreate) REFERENCES Use (idUser);
ALTER TABLE Opportunity
ADD CONSTRAINT FK_Opportunitymodify FOREIGN KEY (idUserModify) REFERENCES Use (idUser);


INSERT INTO Use (UserName, name, password, email, idUserCreate, creationDate)
VALUES ('sa', 'Super Admin', 'AdM1nPaSsW', 'superadmin@example.com', null, null),
       ('Pablo', 'Pablo Ramirez', 'Us3rPwd!23', 'yael_r3y@example.com', 1, '2023-12-08');

INSERT INTO Course (Name, Credits, Code, idUserCreate, creationDate)
VALUES ('Introduction to Programming', 3, 'PROG101');

INSERT INTO Course (Name, Credits, Code, idUserCreate, creationDate)
VALUES ('Business Ethics', 2, 'ETHICS201');

INSERT INTO Course (Name, Credits, Code, idUserCreate, creationDate)
VALUES ('Advanced Calculus', 4, 'MATH301');

INSERT INTO Class (EmployeeID, CourseID, PeriodID, idUserCreate, creationDate)
VALUES (1, 1, 1);

INSERT INTO Class (EmployeeID, CourseID, PeriodID, idUserCreate, creationDate)
VALUES (2, 2, 2);

INSERT INTO Class (EmployeeID, CourseID, PeriodID, idUserCreate, creationDate)
VALUES (3, 3, 3);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade, idUserCreate, creationDate)
VALUES (1, 1, 1, 95.5);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade, idUserCreate, creationDate)
VALUES (2, 2, 2, 88.0);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade, idUserCreate, creationDate)
VALUES (3, 3, 3, 76.5);

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State, idUserCreate, creationDate)
VALUES (1, 1, '2023-04-15', 'Career counseling', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State, idUserCreate, creationDate)
VALUES (2, 2, '2023-05-20', 'Job placement assistance', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State, idUserCreate, creationDate)
VALUES (3, 3, '2023-06-10', 'Resume review', 'Active');

INSERT INTO Opportunity (Number, Name, idUserCreate, creationDate)
VALUES (1, 'Internship Opportunity at Company A');

INSERT INTO Opportunity (Number, Name, idUserCreate, creationDate)
VALUES (2, 'Scholarship Opportunity for STEM Students');

INSERT INTO Opportunity (Number, Name, idUserCreate, creationDate)
VALUES (3, 'Job Fair - Spring 2023');

USE master;
GO
IF DB_ID(N'SchoolservicesPablo')IS NOT NULL
DROP DATABASE SchoolServicesPablo;
GO
CREATE DATABASE SchoolServicesPablo
ON
(NAME = SchoolServicesPablo_dat,
FILENAME= 'C:\BaseDatos\SchoolservicesPablo.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME =SchoolServices_log,
FILENAME = 'C:\BaseDatos\SchoolservicesPablo.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE SchoolServicesPablo;
GO
-- Course
CREATE TABLE Course (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Credits INT NOT NULL,
    Code VARCHAR(20) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Class
CREATE TABLE Class (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    CourseID INT NOT NULL,
    PeriodID INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Kardex
CREATE TABLE Kardex (
    KardexID INT PRIMARY KEY IDENTITY(1,1),
    ClassID INT NOT NULL,
    OpportunityID INT NOT NULL,
    StudentID INT NOT NULL,
    Grade DECIMAL(5, 2) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- CareerService
CREATE TABLE CareerService (
    CareerServiceID INT PRIMARY KEY IDENTITY(1,1),
    CareerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ServiceDate DATE NOT NULL,
    Description VARCHAR(100) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Opportunity
CREATE TABLE Opportunity (
    OpportunityID INT PRIMARY KEY IDENTITY(1,1),
    Number INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);
GO

CREATE INDEX IX_Course ON Course (CourseID);
CREATE INDEX IX_Class ON Class (ClassID);
CREATE INDEX IX_Kardex ON Kardex (KardexID);
CREATE INDEX IX_CareerService ON CareerService (CareerServiceID);
CREATE INDEX IX_Opportunity ON Opportunity (OpportunityID);

-- Foreign Keys
-- Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_EmployeeEmployeeType FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeType (EmployeeTypeID);

-- StudyPlan
ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

-- Class
ALTER TABLE Class
ADD CONSTRAINT FK_ClassEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassPeriod FOREIGN KEY (PeriodID) REFERENCES Period (PeriodID);

-- Kardex
ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexClass FOREIGN KEY (ClassID) REFERENCES Class (ClassID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexOpportunity FOREIGN KEY (OpportunityID) REFERENCES Opportunity (OpportunityID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

-- CareerService
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

-- DocumentRequest
ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestDocumentType FOREIGN KEY (DocumentTypeID) REFERENCES DocumentType (DocumentTypeID);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

-- InstitutionalScholar
ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarInstitutionalScholar FOREIGN KEY (InstitutionalScholarshipID) REFERENCES InstitutionalScholarship (InstitutionalScholarshipID);

ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

-- ExternalScholar
ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarSUBES FOREIGN KEY (SUBESID) REFERENCES SUBES (SUBESID);


-- Enrollment
ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentPeriod FOREIGN KEY (PeriodID) REFERENCES Period (PeriodID);


-- Reticule
ALTER TABLE Reticule
ADD CONSTRAINT FK_ReticuleCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

-- Student
ALTER TABLE Student
ADD CONSTRAINT FK_StudentStudyPlan FOREIGN KEY (StudyPlanID) REFERENCES StudyPlan (StudyPlanID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentStudyCertificate FOREIGN KEY (StudyCertificateID) REFERENCES StudyCertificate (StudyCertificateID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentExternalScholar FOREIGN KEY (ExternalScholarID) REFERENCES ExternalScholar (ExternalScholarID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentTitle FOREIGN KEY (TitleID) REFERENCES Title (TitleID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentLifeInsurance FOREIGN KEY (LifeInsuranceID) REFERENCES LifeInsurance (LifeInsuranceID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentEducation FOREIGN KEY (EducationID) REFERENCES Education (EducationID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentCertificate FOREIGN KEY (CertificateID) REFERENCES StudyCertificate (StudyCertificateID);

INSERT INTO Course (Name, Credits, Code)
VALUES ('Introduction to Programming', 3, 'PROG101');

INSERT INTO Course (Name, Credits, Code)
VALUES ('Business Ethics', 2, 'ETHICS201');

INSERT INTO Course (Name, Credits, Code)
VALUES ('Advanced Calculus', 4, 'MATH301');

INSERT INTO Class (EmployeeID, CourseID, PeriodID)
VALUES (1, 1, 1);

INSERT INTO Class (EmployeeID, CourseID, PeriodID)
VALUES (2, 2, 2);

INSERT INTO Class (EmployeeID, CourseID, PeriodID)
VALUES (3, 3, 3);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade)
VALUES (1, 1, 1, 95.5);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade)
VALUES (2, 2, 2, 88.0);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade)
VALUES (3, 3, 3, 76.5);

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State)
VALUES (1, 1, '2023-04-15', 'Career counseling', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State)
VALUES (2, 2, '2023-05-20', 'Job placement assistance', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State)
VALUES (3, 3, '2023-06-10', 'Resume review', 'Active');

INSERT INTO Opportunity (Number, Name)
VALUES (1, 'Internship Opportunity at Company A');

INSERT INTO Opportunity (Number, Name)
VALUES (2, 'Scholarship Opportunity for STEM Students');

INSERT INTO Opportunity (Number, Name)
VALUES (3, 'Job Fair - Spring 2023');
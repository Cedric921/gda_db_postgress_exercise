CREATE DATABASE gouniv;

CREATE USER admin;

CREATE USER doyen;

CREATE USER assistant;

CREATE TABLE IF NOT EXISTS staff(
StaffNo serial PRIMARY KEY,c
Name VARCHAR(50) UNIQUE NOT NULL,
Region VARCHAR(50));

CREATE TABLE IF NOT EXISTS student(
StudentID serial PRIMARY KEY,
Name VARCHAR(50) UNIQUE NOT NULL,
Region VARCHAR(50),
StaffNo INT,
FOREIGN KEY (StaffNo) REFERENCES staff(StaffNo));

CREATE TABLE IF NOT EXISTS course(
CourseCode serial PRIMARY KEY,
Title VARCHAR(50) UNIQUE NOT NULL,
Credit INT,
Quota INT,
StaffNo INT,
FOREIGN KEY (StaffNo) REFERENCES staff(StaffNo));

CREATE TABLE IF NOT EXISTS enrollment(
StudentID INT NOT NULL,
CourseCode INT NOT NULL,
DateEnrolled DATE DEFAULT CURRENT_DATE,
FinalGrade INT,
PRIMARY KEY(StudentID, CourseCode),
FOREIGN KEY (StudentID) REFERENCES student(StudentID),
FOREIGN KEY (CourseCode) REFERENCES course(CourseCode));

CREATE TABLE IF NOT EXISTS assignment(
StudentID INT NOT NULL,
CourseCode INT NOT NULL,
Assignment SERIAL,
Grade INT,
PRIMARY KEY(StudentID, CourseCode, Assignment),
FOREIGN KEY (StudentID) REFERENCES student(StudentID),
FOREIGN KEY (CourseCode) REFERENCES course(CourseCode));


ALTER DATABASE gouniv OWNER  TO admin;
REVOKE ALL PRIVILEGES ON DATABASE gouniv FROM PUBLIC;

GRANT ALL PRIVILEGES ON TABLE Student, Course TO doyen;
GRANT SELECT ON TABLE Staff TO doyen;

GRANT SELECT ON TABLE Student, Course TO assistant;

GRANT CONNECT ON DATABASE gouniv TO doyen, assistant;

INSERT INTO Staff(Name, Region) VALUES ('Cedric', 'Kinshasa');
INSERT INTO student(Name, Region, StaffNo) VALUES ('karungu','kivu',1);
INSERT INTO course(Title, Credit, Quota, StaffNo) VALUES ('Chimie',6,4,1);
INSERT INTO enrollment(StudentID, CourseCode, FinalGrade) VALUES (1,1,5);
INSERT INTO assignment(StudentID, CourseCode, Grade) VALUES (1,1,4);

COMMIT;

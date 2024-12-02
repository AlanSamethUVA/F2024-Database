IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'P3')
BEGIN
    CREATE DATABASE P3;
END


-- Student Table
CREATE TABLE Student(
	student_id INT UNIQUE NOT NULL,
	student_id_encrypted VARBINARY(128) NOT NULL,
	CONSTRAINT Student_PK PRIMARY KEY (Student_id),
	student_year INT CONSTRAINT
	student_year_CHK CHECK (student_year > 1819)
	
)

-- Department
CREATE TABLE Department(
	department_id INT UNIQUE NOT NULL,
	CONSTRAINT department_PK PRIMARY KEY (department_id),
	department_name VARCHAR(100)
)

-- Professor
CREATE TABLE Professors(
	professor_id INT UNIQUE NOT NULL,
	CONSTRAINT professor_PK PRIMARY KEY (professor_id),
	professor_name VARCHAR(100),
	professor_contact VARCHAR(100) CONSTRAINT
	professor_contact_CHK CHECK (professor_contact LIKE '%@virginia.edu'),
	office_hours VARCHAR(100)
)

-- Course Table
CREATE TABLE Course(
	course_id INT UNIQUE NOT NULL,
	CONSTRAINT course_PK PRIMARY KEY (course_id),
	department_id INT NOT NULL,
	CONSTRAINT department_FK FOREIGN KEY (department_id)
	REFERENCES [Department] (department_id) 
	ON DELETE CASCADE,
	course_name VARCHAR(100),
	semester VARCHAR(5),
	professor_id INT UNIQUE NOT NULL,
	CONSTRAINT professor_FK FOREIGN KEY (professor_id) 
	REFERENCES [Professors] (professor_id) 
	ON DELETE CASCADE
)

-- Enroll Table
CREATE TABLE Enroll(
	student_id INT UNIQUE NOT NULL,
	CONSTRAINT student_FK FOREIGN KEY (student_id)
	REFERENCES [Student] (student_id) 
	ON DELETE CASCADE,
	course_id INT UNIQUE NOT NULL,
	CONSTRAINT course_FK FOREIGN KEY (course_id)
	REFERENCES [Course] (course_id) 
	ON DELETE CASCADE,
	semester VARCHAR(5)
)


CREATE TABLE Notes(
	note_id INT UNIQUE NOT NULL,
	CONSTRAINT note_PK PRIMARY KEY (note_id),
	note_format VARCHAR(50),
	semester VARCHAR(5),
	course_id INT UNIQUE NOT NULL,
	tag varchar(50)
	CONSTRAINT course_FK1 FOREIGN KEY (course_id) 
	REFERENCES [Course] (course_id) 
	ON DELETE CASCADE
)

CREATE TABLE Submits(
	note_id INT UNIQUE NOT NULL,
	CONSTRAINT note_FK FOREIGN KEY (note_id)
	REFERENCES [Notes] (note_id),
	student_id INT UNIQUE NOT NULL,
	CONSTRAINT student_FK1 FOREIGN KEY (student_id)
	REFERENCES [Student] (student_id) 
	ON DELETE CASCADE,
	permissions_list VARCHAR(50)
)


CREATE TABLE Feedback (
	feedback_id int NOT NULL PRIMARY KEY,
	note_id int,
	student_id int,
	feedback_content varchar(300),
	rating int,
	CONSTRAINT rating_check CHECK (rating BETWEEN 1 AND 5),
	FOREIGN KEY (note_id) REFERENCES Notes(note_id) 
	ON DELETE CASCADE
)


CREATE TABLE Syllabus (
	syllabus_id int NOT NULL PRIMARY KEY,
	course_id int,
	syllabus_content varchar(4000)
	FOREIGN KEY (course_id) REFERENCES Course(course_id) 
	ON DELETE CASCADE
)

CREATE TABLE Contact(
	contact_id int NOT NULL PRIMARY KEY,
	student_id int,
	email varchar(50)
)


CREATE TABLE Locations(
	location_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	location_name varchar(50),
	contact_id int,
	FOREIGN KEY (contact_id) REFERENCES Contact(contact_id)
)

CREATE TABLE Roster(
	roster_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	student_id int,
	course_id int,
	FOREIGN KEY (student_id) REFERENCES Student(student_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (course_id) REFERENCES Course(course_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)

CREATE TABLE Uses(
	permission_id int NOT NULL PRIMARY KEY,
	student_id int,
	course_id int,
	permission varchar(50),
	FOREIGN KEY (student_id) REFERENCES Student(student_id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	FOREIGN KEY (course_id) REFERENCES Course(course_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)



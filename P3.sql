IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'P3')
BEGIN
    CREATE DATABASE P3;
END


-- Student Table
CREATE TABLE Student(
	student_id INT UNIQUE NOT NULL,
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
	professor_id INT UNIQUE NOT NULL,
	tag varchar(50)
	CONSTRAINT professor_FK1 FOREIGN KEY (professor_id) 
	REFERENCES [Professors] (professor_id) 
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

INSERT INTO Department (department_id, department_name) VALUES
(1, 'Math'),
(2, 'CS'),
(3, 'English'),
(4, 'History'),
(5, 'Science'),
(6, 'Chemistry'),
(7, 'Philosophy'),
(8, 'Arts'),
(9, 'Psychology'),
(10, 'Social Studies'),
(11, 'Politics'),
(12, 'Business'),
(13, 'Marketing'),
(14, 'Design'),
(15, 'Engineering'),
(16, 'Environmental Science'),
(17, 'Aerospace'),
(18, 'Civil Engineering'),
(19, 'Nursing'),
(20, 'Health Sciences'),
(21, 'Law'),
(22, 'Social Work'),
(23, 'Finance'),
(24, 'Anthropology'),
(25, 'Sociology'),
(26, 'Geography'),
(27, 'Physics'),
(28, 'Biochemistry'),
(29, 'Political Theory'),
(30, 'Architecture');

INSERT INTO Student (student_id, student_year) VALUES
(1, 2020),
(2, 2021),
(3, 2022),
(4, 2023),
(5, 2020),
(6, 2021),
(7, 2022),
(8, 2023),
(9, 2020),
(10, 2021),
(11, 2022),
(12, 2023),
(13, 2020),
(14, 2021),
(15, 2022),
(16, 2023),
(17, 2020),
(18, 2021),
(19, 2022),
(20, 2023),
(21, 2020),
(22, 2021),
(23, 2022),
(24, 2023),
(25, 2020),
(26, 2021),
(27, 2022),
(28, 2023),
(29, 2020),
(30, 2021);

INSERT INTO Professors (professor_id, professor_name, professor_contact, office_hours) VALUES
(1, 'Dr. Alice Smith', 'alice.smith@virginia.edu', 'M 9-11 AM, W 1-3 PM'),
(2, 'Dr. Bob Johnson', 'bob.johnson@virginia.edu', 'T 10-12 AM, Th 2-4 PM'),
(3, 'Dr. Carol Williams', 'carol.williams@virginia.edu', 'M 10-12 PM, F 2-4 PM'),
(4, 'Dr. David Brown', 'david.brown@virginia.edu', 'W 9-11 AM, Th 1-3 PM'),
(5, 'Dr. Emily Jones', 'emily.jones@virginia.edu', 'M 1-3 PM, T 10-12 AM'),
(6, 'Dr. Frank Garcia', 'frank.garcia@virginia.edu', 'Th 11-1 PM, F 3-5 PM'),
(7, 'Dr. Grace Martinez', 'grace.martinez@virginia.edu', 'M 2-4 PM, W 10-12 AM'),
(8, 'Dr. Henry Davis', 'henry.davis@virginia.edu', 'T 1-3 PM, F 11-1 PM'),
(9, 'Dr. Irene Lopez', 'irene.lopez@virginia.edu', 'M 3-5 PM, W 9-11 AM'),
(10, 'Dr. John Wilson', 'john.wilson@virginia.edu', 'T 9-11 AM, Th 1-3 PM'),
(11, 'Dr. Kate Anderson', 'kate.anderson@virginia.edu', 'M 11-1 PM, Th 2-4 PM'),
(12, 'Dr. Liam Thomas', 'liam.thomas@virginia.edu', 'W 1-3 PM, F 10-12 AM'),
(13, 'Dr. Mia Taylor', 'mia.taylor@virginia.edu', 'M 9-11 AM, T 1-3 PM'),
(14, 'Dr. Noah Hernandez', 'noah.hernandez@virginia.edu', 'Th 10-12 AM, F 2-4 PM'),
(15, 'Dr. Olivia Clark', 'olivia.clark@virginia.edu', 'M 2-4 PM, W 1-3 PM'),
(16, 'Dr. Paul Rodriguez', 'paul.rodriguez@virginia.edu', 'T 10-12 AM, F 1-3 PM'),
(17, 'Dr. Quincy Lewis', 'quincy.lewis@virginia.edu', 'M 11-1 PM, Th 3-5 PM'),
(18, 'Dr. Rachel Walker', 'rachel.walker@virginia.edu', 'W 10-12 AM, F 2-4 PM'),
(19, 'Dr. Steve Hall', 'steve.hall@virginia.edu', 'T 1-3 PM, Th 11-1 PM'),
(20, 'Dr. Tara Young', 'tara.young@virginia.edu', 'M 3-5 PM, W 9-11 AM'),
(21, 'Dr. Uma King', 'uma.king@virginia.edu', 'T 10-12 AM, F 1-3 PM'),
(22, 'Dr. Victor Scott', 'victor.scott@virginia.edu', 'M 9-11 AM, Th 2-4 PM'),
(23, 'Dr. Wendy Green', 'wendy.green@virginia.edu', 'M 1-3 PM, W 10-12 AM'),
(24, 'Dr. Xavier Adams', 'xavier.adams@virginia.edu', 'T 9-11 AM, F 11-1 PM'),
(25, 'Dr. Yvonne Nelson', 'yvonne.nelson@virginia.edu', 'M 2-4 PM, W 1-3 PM'),
(26, 'Dr. Zachary Carter', 'zachary.carter@virginia.edu', 'T 10-12 AM, F 3-5 PM'),
(27, 'Dr. Anne Evans', 'anne.evans@virginia.edu', 'M 9-11 AM, T 2-4 PM'),
(28, 'Dr. Brian Murphy', 'brian.murphy@virginia.edu', 'W 10-12 AM, F 2-4 PM'),
(29, 'Dr. Chloe Cooper', 'chloe.cooper@virginia.edu', 'T 1-3 PM, Th 11-1 PM'),
(30, 'Dr. Daniel Reed', 'daniel.reed@virginia.edu', 'M 3-5 PM, W 9-11 AM');


INSERT INTO Course (course_id, department_id, course_name, semester, professor_id) VALUES
(1, 1, 'Calculus I', 'F2023', 1),
(2, 1, 'Linear Algebra', 'S2024', 2),
(3, 2, 'Introduction to Computer Science', 'F2023', 3),
(4, 2, 'Data Structures', 'S2024', 4),
(5, 3, 'English Literature', 'F2023', 5),
(6, 3, 'Creative Writing', 'S2024', 6),
(7, 4, 'World History', 'F2023', 7),
(8, 4, 'American History', 'S2024', 8),
(9, 5, 'General Biology', 'F2023', 9),
(10, 5, 'Chemistry I', 'S2024', 10),
(11, 6, 'Organic Chemistry', 'F2023', 11),
(12, 6, 'Physical Chemistry', 'S2024', 12),
(13, 7, 'Introduction to Philosophy', 'F2023', 13),
(14, 7, 'Ethics', 'S2024', 14),
(15, 8, 'Art History', 'F2023', 15),
(16, 8, 'Painting I', 'S2024', 16),
(17, 9, 'Introduction to Psychology', 'F2023', 17),
(18, 9, 'Cognitive Psychology', 'S2024', 18),
(19, 10, 'Sociology 101', 'F2023', 19),
(20, 10, 'Social Psychology', 'S2024', 20),
(21, 11, 'Political Science Basics', 'F2023', 21),
(22, 11, 'International Relations', 'S2024', 22),
(23, 12, 'Business Management', 'F2023', 23),
(24, 12, 'Marketing Strategies', 'S2024', 24),
(25, 13, 'Digital Marketing', 'F2023', 25),
(26, 13, 'Consumer Behavior', 'S2024', 26),
(27, 14, 'Graphic Design', 'F2023', 27),
(28, 14, 'Web Design', 'S2024', 28),
(29, 15, 'Thermodynamics', 'F2023', 29),
(30, 15, 'Fluid Mechanics', 'S2024', 30);


INSERT INTO Enroll (student_id, course_id, semester)
VALUES
(1, 1, 'F2023'),
(2, 2, 'S2021'),
(3, 3, 'F2021'),
(4, 4, 'S2020'),
(5, 5, 'F2023'),
(6, 6, 'S2021'),
(7, 7, 'F2023'),
(8, 8, 'S2020'),
(9, 9, 'F2023'),
(10, 10, 'S2020'),
(11, 11, 'F2023'),
(12, 12, 'S2023'),
(13, 13, 'F2023'),
(14, 14, 'S2021'),
(15, 15, 'F2023'),
(16, 16, 'S2024'),
(17, 17, 'F2022'),
(18, 18, 'S2020'),
(19, 19, 'F2023'),
(20, 20, 'S2020'),
(21, 21, 'F2023'),
(22, 22, 'S2020'),
(23, 23, 'F2024'),
(24, 24, 'S2021'),
(25, 25, 'F2023'),
(26, 26, 'S2024'),
(27, 27, 'F2023'),
(28, 28, 'S2022'),
(29, 29, 'F2023'),
(30, 30, 'S2022');



INSERT INTO Contact (contact_id, student_id, email)
VALUES
(1, 23, 'student1@example.com'),
(2, 553, 'student2@example.com'),
(3, 64, 'student3@example.com'),
(4, 64, 'student4@example.com'),
(5, 86, 'student5@example.com'),
(6, 65, 'student6@example.com'),
(7, 73, 'student7@example.com'),
(8, 456, 'student8@example.com'),
(9, 345, 'student9@example.com'),
(10, 89, 'student10@example.com'),
(11, 90, 'student11@example.com'),
(12, 45, 'student12@example.com'),
(13, 21, 'student13@example.com'),
(14, 88, 'student14@example.com'),
(15, 34, 'student15@example.com'),
(16, 78, 'student16@example.com'),
(17, 45, 'student17@example.com'),
(18, 33, 'student18@example.com'),
(19, 56, 'student19@example.com'),
(20, 71, 'student20@example.com'),
(21, 66, 'student21@example.com'),
(22, 99, 'student22@example.com'),
(23, 25, 'student23@example.com'),
(24, 58, 'student24@example.com'),
(25, 46, 'student25@example.com'),
(26, 55, 'student26@example.com'),
(27, 41, 'student27@example.com'),
(28, 23, 'student28@example.com'),
(29, 74, 'student29@example.com'),
(30, 67, 'student30@example.com');


--Number of students in courses in department 3
SELECT c.course_id, COUNT(student_id) as num_students 
FROM Course c
INNER JOIN Enroll
ON c.course_id = Enroll.course_id WHERE EXISTS
(SELECT * FROM Course
WHERE Course.department_id = 3)
GROUP BY c.course_id;

--All professors that teach in department 4
SELECT professor_name FROM Professors WHERE
EXISTS (SELECT * FROM Professors
INNER JOIN Course
ON Professors.professor_id = Course.professor_id
WHERE department_id= 4)

--What students do each professor teach
SELECT student_id, professor_id FROM Enroll e
INNER JOIN Course c
ON e.course_id = c.course_id

--How many courses in department name CS
SELECT course_name FROM Course c
INNER JOIN Department d
ON c.department_id = d.department_id
WHERE department_name = 'Computer Science'

--Sum of students enrolled in 2024 classes
SELECT COUNT(student_id) AS num_students
FROM Enroll
WHERE semester = '%*2024%'

--Frequency of students per semester
SELECT semester, COUNT(student_year) AS num_student_year
FROM Enroll e
INNER JOIN Student
ON e.student_id = Student.student_id
GROUP BY semester

--Average amount of courses per department
SELECT department_id, AVG(course_id) FROM Course
GROUP BY department_id

--Frequency of different note tags
SELECT tag, COUNT(note_id) FROM Notes
GROUP BY tag
--What is the average note rating
SELECT AVG(rating) FROM Feedback

--Number of professors per department
SELECT department_id, COUNT(professor_id) FROM Course
GROUP BY department_id



DROP TABLE Uses;
DROP TABLE Roster;
DROP TABLE Locations;
DROP TABLE Contact; 
DROP TABLE Syllabus;
DROP TABLE Feedback;
DROP TABLE Submits;
DROP TABLE Notes;
DROP TABLE Enroll;
DROP TABLE Course;
DROP TABLE Department;
DROP TABLE Professors;
DROP TABLE Student;

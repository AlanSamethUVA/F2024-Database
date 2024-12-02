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
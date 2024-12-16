CREATE TABLE IF NOT EXISTS Students (
    StudentID INTEGER PRIMARY KEY,
    Name TEXT,
    Age INTEGER,
    Grade TEXT
);

INSERT INTO Students (StudentID, Name, Age, Grade) VALUES
(101, 'Alice', 14, '9th'),
(102, 'Bob', 15, '10th'),
(103, 'Charlie', 13, '8th'),
(104, 'Diana', 14, '9th'),
(105, 'Evan', 15, '10th');

CREATE TABLE IF NOT EXISTS Subjects (
    SubjectID INTEGER PRIMARY KEY,
    SubjectName TEXT,
    TeacherName TEXT
);

INSERT INTO Subjects (SubjectID, SubjectName, TeacherName) VALUES
(201, 'Mathematics', 'Mr. Smith'),
(202, 'Science', 'Ms. Johnson'),
(203, 'History', 'Mr. Brown'),
(204, 'English', 'Mrs. Davis'),
(205, 'Art', 'Ms. Taylor');

CREATE TABLE IF NOT EXISTS Enrollment (
    EnrollmentID INTEGER PRIMARY KEY,
    StudentID INTEGER,
    SubjectID INTEGER,
    Score REAL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

INSERT INTO Enrollment (EnrollmentID, StudentID, SubjectID, Score) VALUES
(1, 101, 201, 85.5),
(2, 102, 202, 92.0),
(3, 103, 203, 78.0),
(4, 104, 204, 88.5),
(5, 105, 205, 91.0),
(6, 101, 202, 89.0),
(7, 102, 203, 76.0),
(8, 103, 201, 82.5),
(9, 104, 205, 90.0),
(10, 105, 204, 87.5);

SELECT * FROM Students;
SELECT * FROM Students ORDER BY Age ASC;
SELECT * FROM Students WHERE Grade = '9th';
SELECT 
    Students.Name AS StudentName,
    Subjects.SubjectName AS Subject,
    Enrollment.Score AS Score
FROM Enrollment
JOIN Students ON Enrollment.StudentID = Students.StudentID
JOIN Subjects ON Enrollment.SubjectID = Subjects.SubjectID;
SELECT 
    Students.Name AS StudentName,
    Subjects.SubjectName AS Subject,
    Enrollment.Score AS Score
FROM Enrollment
JOIN Students ON Enrollment.StudentID = Students.StudentID
JOIN Subjects ON Enrollment.SubjectID = Subjects.SubjectID
WHERE Enrollment.Score > 90;
SELECT Grade, COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY Grade;
SELECT 
    Subjects.SubjectName AS Subject,
    AVG(Enrollment.Score) AS AverageScore
FROM Enrollment
JOIN Subjects ON Enrollment.SubjectID = Subjects.SubjectID
GROUP BY Subjects.SubjectName;

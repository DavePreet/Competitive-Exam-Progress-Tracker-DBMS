

-- Insert 15 Students with diverse profiles
INSERT INTO Student (student_id, name, email, phone) VALUES
(1, 'Rajesh Kumar', 'rajesh.kumar@email.com', '9876543210'),
(2, 'Priya Sharma', 'priya.sharma@email.com', '9876543211'),
(3, 'Amit Patel', 'amit.patel@email.com', '9876543212'),
(4, 'Sneha Gupta', 'sneha.gupta@email.com', '9876543213'),
(5, 'Vikram Singh', 'vikram.singh@email.com', '9876543214'),
(6, 'Anita Desai', 'anita.desai@email.com', '9876543215'),
(7, 'Rohit Mehta', 'rohit.mehta@email.com', '9876543216'),
(8, 'Kavya Nair', 'kavya.nair@email.com', '9876543217'),
(9, 'Arjun Reddy', 'arjun.reddy@email.com', '9876543218'),
(10, 'Deepika Joshi', 'deepika.joshi@email.com', '9876543219'),
(11, 'Siddharth Agarwal', 'siddharth.agarwal@email.com', '9876543220'),
(12, 'Ritu Malhotra', 'ritu.malhotra@email.com', '9876543221'),
(13, 'Karan Kapoor', 'karan.kapoor@email.com', '9876543222'),
(14, 'Pooja Bansal', 'pooja.bansal@email.com', '9876543223'),
(15, 'Abhishek Tiwari', 'abhishek.tiwari@email.com', '9876543224');

-- Insert 12 Exams (mix of government and private)
INSERT INTO Exam (exam_id, exam_name, exam_type, exam_date, application_deadline, syllabus, total_marks, duration_minutes) VALUES
(1, 'UPSC Civil Services', 'Government', '2024-06-15', '2024-03-15', 'General Studies, Optional Subject, Essay Writing', 1000, 180),
(2, 'SBI PO', 'Banking', '2024-07-20', '2024-05-20', 'English, Quantitative Aptitude, Reasoning, Computer', 200, 120),
(3, 'Google Software Engineer', 'Private', '2024-08-10', '2024-06-10', 'Data Structures, Algorithms, System Design', 100, 90),
(4, 'GATE Computer Science', 'Government', '2024-09-25', '2024-07-25', 'Programming, Data Structures, Computer Networks', 100, 180),
(5, 'Microsoft Developer', 'Private', '2024-10-05', '2024-08-05', 'C#, .NET, Azure, Problem Solving', 150, 120),
(6, 'IBPS Clerk', 'Banking', '2024-11-12', '2024-09-12', 'English, Numerical Ability, Reasoning, Computer', 100, 60),
(7, 'Amazon SDE', 'Private', '2024-12-03', '2024-10-03', 'Java, Python, AWS, Data Structures', 200, 150),
(8, 'SSC CGL', 'Government', '2024-08-30', '2024-06-30', 'General Intelligence, Quantitative Aptitude, English', 200, 120),
(9, 'TCS Digital', 'Private', '2024-09-15', '2024-07-15', 'Programming, Database, Web Technologies', 120, 90),
(10, 'RBI Grade B', 'Banking', '2024-10-20', '2024-08-20', 'Economic and Social Issues, English, Finance', 300, 180),
(11, 'Infosys Specialist Programmer', 'Private', '2024-11-25', '2024-09-25', 'Java, Spring, Microservices, Cloud', 100, 120),
(12, 'NABARD Grade A', 'Banking', '2024-12-15', '2024-10-15', 'Agriculture, Rural Development, Economics', 200, 150);

-- Insert Government Exams
INSERT INTO GovtExam (exam_id, conducting_body, vacancy_count) VALUES
(1, 'Union Public Service Commission', 1000),
(4, 'Indian Institute of Technology', 150),
(8, 'Staff Selection Commission', 2500);

-- Insert Private Exams
INSERT INTO PrivateExam (exam_id, company_name, job_profile) VALUES
(3, 'Google Inc.', 'Software Engineer'),
(5, 'Microsoft Corporation', 'Software Developer'),
(7, 'Amazon Web Services', 'Software Development Engineer'),
(9, 'Tata Consultancy Services', 'Digital Specialist'),
(11, 'Infosys Limited', 'Specialist Programmer');

-- Insert Banking Exams (separate category)
INSERT INTO GovtExam (exam_id, conducting_body, vacancy_count) VALUES
(2, 'State Bank of India', 2000),
(6, 'Institute of Banking Personnel Selection', 1500),
(10, 'Reserve Bank of India', 300),
(12, 'National Bank for Agriculture and Rural Development', 250);

-- Insert 20 Registration records
INSERT INTO Registration (registration_id, status) VALUES
(1, 'confirmed'), (2, 'pending'), (3, 'confirmed'), (4, 'rejected'), (5, 'confirmed'),
(6, 'pending'), (7, 'confirmed'), (8, 'confirmed'), (9, 'pending'), (10, 'confirmed'),
(11, 'rejected'), (12, 'confirmed'), (13, 'pending'), (14, 'confirmed'), (15, 'confirmed'),
(16, 'pending'), (17, 'confirmed'), (18, 'rejected'), (19, 'confirmed'), (20, 'pending');

-- Insert 25 Registers (Student-Exam registrations)
INSERT INTO Registers (student_id, exam_id, registration_id) VALUES
(1, 1, 1), (1, 2, 2), (1, 8, 3),
(2, 3, 4), (2, 4, 5), (2, 7, 6),
(3, 1, 7), (3, 8, 8), (3, 2, 9),
(4, 2, 10), (4, 6, 11), (4, 10, 12),
(5, 3, 13), (5, 5, 14), (5, 7, 15),
(6, 4, 16), (6, 8, 17), (6, 1, 18),
(7, 9, 19), (7, 11, 20),
(8, 10, 1), (8, 12, 2),
(9, 5, 3), (9, 7, 4),
(10, 6, 5), (10, 2, 6),
(11, 1, 7), (11, 4, 8),
(12, 9, 9), (12, 11, 10),
(13, 3, 11), (13, 5, 12),
(14, 8, 13), (14, 1, 14),
(15, 12, 15), (15, 10, 16);

-- Insert 15 Mock Tests
INSERT INTO MockTest (test_id, exam_id, total_marks, test_date) VALUES
(1, 1, 100, '2024-04-01'), (2, 1, 100, '2024-04-15'), (3, 1, 100, '2024-05-01'),
(4, 2, 50, '2024-04-10'), (5, 2, 50, '2024-04-25'), (6, 2, 50, '2024-05-10'),
(7, 3, 25, '2024-04-20'), (8, 3, 25, '2024-05-05'),
(9, 4, 50, '2024-04-25'), (10, 4, 50, '2024-05-15'),
(11, 8, 40, '2024-04-30'), (12, 8, 40, '2024-05-20'),
(13, 5, 30, '2024-05-08'), (14, 7, 35, '2024-05-12'),
(15, 9, 25, '2024-05-18');

-- Insert 40 Mock Test Attempts
INSERT INTO Attempts_MockTest (student_id, test_id, score, percentage) VALUES
(1, 1, 85, 85.00), (1, 2, 90, 90.00), (1, 3, 88, 88.00), (1, 4, 42, 84.00), (1, 5, 45, 90.00),
(2, 7, 20, 80.00), (2, 8, 22, 88.00), (2, 9, 40, 80.00), (2, 10, 45, 90.00),
(3, 1, 78, 78.00), (3, 2, 82, 82.00), (3, 4, 35, 70.00), (3, 11, 32, 80.00),
(4, 4, 38, 76.00), (4, 5, 40, 80.00), (4, 6, 42, 84.00),
(5, 7, 22, 88.00), (5, 13, 25, 83.33), (5, 14, 30, 85.71),
(6, 9, 42, 84.00), (6, 10, 38, 76.00), (6, 1, 75, 75.00),
(7, 15, 20, 80.00), (7, 13, 24, 80.00),
(8, 6, 45, 90.00), (8, 4, 40, 80.00),
(9, 13, 27, 90.00), (9, 14, 28, 80.00),
(10, 4, 35, 70.00), (10, 5, 38, 76.00),
(11, 1, 92, 92.00), (11, 9, 46, 92.00),
(12, 15, 23, 92.00), (12, 13, 26, 86.67),
(13, 7, 18, 72.00), (13, 13, 21, 70.00),
(14, 11, 35, 87.50), (14, 1, 80, 80.00),
(15, 6, 44, 88.00), (15, 4, 41, 82.00);

-- Insert 20 Student Preferences
INSERT INTO StudentPreferred (student_id, exam_type) VALUES
(1, 'Government'), (1, 'Banking'),
(2, 'Private'), (2, 'Government'),
(3, 'Government'), (3, 'Banking'),
(4, 'Banking'), (4, 'Government'),
(5, 'Private'),
(6, 'Government'), (6, 'Private'),
(7, 'Private'),
(8, 'Banking'),
(9, 'Private'), (9, 'Government'),
(10, 'Banking'), (10, 'Government'),
(11, 'Government'),
(12, 'Private'), (12, 'Banking'),
(13, 'Private'),
(14, 'Government'), (14, 'Banking'),
(15, 'Banking');

-- Insert 12 Practice Sessions
INSERT INTO PracticeSession (session_id, topic_name, attempt_date, num_questions, correct_answers) VALUES
(1, 'Quantitative Aptitude', '2024-04-01', 20, 15),
(2, 'Logical Reasoning', '2024-04-02', 25, 20),
(3, 'Data Structures', '2024-04-03', 15, 12),
(4, 'English Grammar', '2024-04-04', 30, 25),
(5, 'General Knowledge', '2024-04-05', 20, 18),
(6, 'Computer Fundamentals', '2024-04-06', 25, 22),
(7, 'Programming Concepts', '2024-04-07', 20, 16),
(8, 'Current Affairs', '2024-04-08', 15, 13),
(9, 'Banking Awareness', '2024-04-09', 18, 14),
(10, 'Verbal Ability', '2024-04-10', 22, 19),
(11, 'Numerical Ability', '2024-04-11', 25, 21),
(12, 'System Design', '2024-04-12', 10, 8);

-- Insert 30 Practice Session Attempts
INSERT INTO Attempts_PracticeSession (student_id, session_id) VALUES
(1, 1), (1, 4), (1, 2), (1, 5),
(2, 3), (2, 7), (2, 12),
(3, 2), (3, 5), (3, 8), (3, 1),
(4, 1), (4, 4), (4, 6), (4, 9),
(5, 3), (5, 7), (5, 12),
(6, 9), (6, 10), (6, 2), (6, 5),
(7, 3), (7, 7), (7, 12),
(8, 6), (8, 9), (8, 10), (8, 1),
(9, 7), (9, 12), (9, 3),
(10, 1), (10, 6), (10, 9),
(11, 2), (11, 5), (11, 8),
(12, 3), (12, 7), (12, 12),
(13, 7), (13, 3), (13, 12),
(14, 1), (14, 2), (14, 8),
(15, 6), (15, 9), (15, 10);

-- Insert 15 Notifications
INSERT INTO Notification (notification_id, message, notify_date) VALUES
(1, 'UPSC Civil Services exam registration is now open', '2024-03-01'),
(2, 'SBI PO exam date has been announced', '2024-04-01'),
(3, 'Google Software Engineer interview shortlist released', '2024-04-15'),
(4, 'GATE 2024 admit cards are available for download', '2024-07-01'),
(5, 'Microsoft Developer position applications closing soon', '2024-07-20'),
(6, 'IBPS Clerk notification released', '2024-08-01'),
(7, 'Amazon SDE hiring drive started', '2024-08-15'),
(8, 'SSC CGL exam pattern updated', '2024-05-01'),
(9, 'TCS Digital recruitment process begins', '2024-06-01'),
(10, 'RBI Grade B exam schedule announced', '2024-07-15'),
(11, 'Infosys Specialist Programmer applications open', '2024-08-20'),
(12, 'NABARD Grade A syllabus updated', '2024-09-01'),
(13, 'Mock test results published for UPSC', '2024-04-20'),
(14, 'New practice sessions added for Banking exams', '2024-04-25'),
(15, 'System maintenance scheduled for this weekend', '2024-05-10');

-- Insert 50 Receives (Student-Notification)
INSERT INTO Receives (student_id, notification_id) VALUES
(1, 1), (1, 2), (1, 8), (1, 13), (1, 15),
(2, 3), (2, 4), (2, 7), (2, 15),
(3, 1), (3, 5), (3, 8), (3, 13), (3, 15),
(4, 2), (4, 6), (4, 10), (4, 14), (4, 15),
(5, 3), (5, 5), (5, 7), (5, 15),
(6, 1), (6, 4), (6, 8), (6, 13), (6, 15),
(7, 9), (7, 11), (7, 15),
(8, 2), (8, 6), (8, 10), (8, 12), (8, 14), (8, 15),
(9, 3), (9, 5), (9, 7), (9, 15),
(10, 2), (10, 6), (10, 14), (10, 15),
(11, 1), (11, 4), (11, 13), (11, 15),
(12, 9), (12, 11), (12, 15),
(13, 3), (13, 5), (13, 15),
(14, 1), (14, 8), (14, 13), (14, 15),
(15, 6), (15, 10), (15, 12), (15, 14), (15, 15);

-- Show data summary
SELECT 'Students' as Table_Name, COUNT(*) as Record_Count FROM Student
UNION ALL
SELECT 'Exams', COUNT(*) FROM Exam
UNION ALL
SELECT 'Government Exams', COUNT(*) FROM GovtExam
UNION ALL
SELECT 'Private Exams', COUNT(*) FROM PrivateExam
UNION ALL
SELECT 'Registrations', COUNT(*) FROM Registration
UNION ALL
SELECT 'Student-Exam Registrations', COUNT(*) FROM Registers
UNION ALL
SELECT 'Mock Tests', COUNT(*) FROM MockTest
UNION ALL
SELECT 'Mock Test Attempts', COUNT(*) FROM Attempts_MockTest
UNION ALL
SELECT 'Student Preferences', COUNT(*) FROM StudentPreferred
UNION ALL
SELECT 'Practice Sessions', COUNT(*) FROM PracticeSession
UNION ALL
SELECT 'Practice Attempts', COUNT(*) FROM Attempts_PracticeSession
UNION ALL
SELECT 'Notifications', COUNT(*) FROM Notification
UNION ALL
SELECT 'Notification Receives', COUNT(*) FROM Receives;
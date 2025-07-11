-- Exam Management System Database Schema

-- Create Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

-- Create Exam table
CREATE TABLE Exam (
    exam_id INT PRIMARY KEY,
    exam_name VARCHAR(100) NOT NULL,
    exam_type VARCHAR(50) NOT NULL,
    exam_date DATE NOT NULL,
    application_deadline DATE NOT NULL,
    syllabus TEXT,
    total_marks INT NOT NULL,
    duration_minutes INT NOT NULL
);

-- Create GovtExam table (ISA relationship)
CREATE TABLE GovtExam (
    exam_id INT PRIMARY KEY,
    conducting_body VARCHAR(100) NOT NULL,
    vacancy_count INT,
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id) ON DELETE CASCADE
);

-- Create PrivateExam table (ISA relationship)
CREATE TABLE PrivateExam (
    exam_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    job_profile VARCHAR(100),
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id) ON DELETE CASCADE
);

-- Create Registration table
CREATE TABLE Registration (
    registration_id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'pending'
);

-- Create Registers relationship table
CREATE TABLE Registers (
    student_id INT,
    exam_id INT,
    registration_id INT,
    PRIMARY KEY (student_id, exam_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id) ON DELETE CASCADE,
    FOREIGN KEY (registration_id) REFERENCES Registration(registration_id) ON DELETE CASCADE
);

-- Create MockTest table
CREATE TABLE MockTest (
    test_id INT PRIMARY KEY,
    exam_id INT NOT NULL,
    total_marks INT NOT NULL,
    test_date DATE NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id) ON DELETE CASCADE
);

-- Create Attempts_MockTest table
CREATE TABLE Attempts_MockTest (
    student_id INT,
    test_id INT,
    score INT,
    percentage DECIMAL(5,2),
    PRIMARY KEY (student_id, test_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (test_id) REFERENCES MockTest(test_id) ON DELETE CASCADE
);

-- Create StudentPreferred table
CREATE TABLE StudentPreferred (
    student_id INT,
    exam_type VARCHAR(50),
    PRIMARY KEY (student_id, exam_type),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE
);

-- Create PracticeSession table
CREATE TABLE PracticeSession (
    session_id INT PRIMARY KEY,
    topic_name VARCHAR(100) NOT NULL,
    attempt_date DATE NOT NULL,
    num_questions INT NOT NULL,
    correct_answers INT NOT NULL
);

-- Create Attempts_PracticeSession table
CREATE TABLE Attempts_PracticeSession (
    student_id INT,
    session_id INT,
    PRIMARY KEY (student_id, session_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (session_id) REFERENCES PracticeSession(session_id) ON DELETE CASCADE
);

-- Create Notification table
CREATE TABLE Notification (
    notification_id INT PRIMARY KEY,
    message TEXT NOT NULL,
    notify_date DATE NOT NULL
);

-- Create Receives table
CREATE TABLE Receives (
    student_id INT,
    notification_id INT,
    PRIMARY KEY (student_id, notification_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (notification_id) REFERENCES Notification(notification_id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX idx_student_email ON Student(email);
CREATE INDEX idx_exam_date ON Exam(exam_date);
CREATE INDEX idx_exam_type ON Exam(exam_type);
CREATE INDEX idx_mocktest_date ON MockTest(test_date);
CREATE INDEX idx_notification_date ON Notification(notify_date);
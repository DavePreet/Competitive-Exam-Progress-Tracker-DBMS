-- 1. List all students with their registered exams
SELECT s.name, s.email, e.exam_name, e.exam_type, r.status
FROM Student s
JOIN Registers reg ON s.student_id = reg.student_id
JOIN Exam e ON reg.exam_id = e.exam_id
JOIN Registration r ON reg.registration_id = r.registration_id;

-- 2. Find students who scored above 80% in mock tests
SELECT s.name, e.exam_name, amt.percentage
FROM Student s
JOIN Attempts_MockTest amt ON s.student_id = amt.student_id
JOIN MockTest mt ON amt.test_id = mt.test_id
JOIN Exam e ON mt.exam_id = e.exam_id
WHERE amt.percentage > 80;

-- 3. Get exam statistics (total registrations, confirmed and pending)
SELECT 
    e.exam_name,
    COUNT(reg.student_id) AS total_registrations,
    SUM(CASE WHEN r.status = 'confirmed' THEN 1 ELSE 0 END) AS confirmed,
    SUM(CASE WHEN r.status = 'pending' THEN 1 ELSE 0 END) AS pending
FROM Exam e
LEFT JOIN Registers reg ON e.exam_id = reg.exam_id
LEFT JOIN Registration r ON reg.registration_id = r.registration_id
GROUP BY e.exam_name;

-- 4. Students' preferred exam types and their actual registrations
SELECT s.name, sp.exam_type, COUNT(reg.exam_id) AS exams_registered
FROM Student s
LEFT JOIN StudentPreferred sp ON s.student_id = sp.student_id
LEFT JOIN Registers reg ON s.student_id = reg.student_id
GROUP BY s.name, sp.exam_type;

-- 5. Top performing students in mock tests
SELECT 
    s.name,
    COUNT(amt.test_id) AS tests_taken,
    AVG(amt.percentage) AS average_score,
    MAX(amt.percentage) AS best_score
FROM Student s
JOIN Attempts_MockTest amt ON s.student_id = amt.student_id
GROUP BY s.name
HAVING COUNT(amt.test_id) >= 2;

-- 6. Upcoming exams after 2024-04-01
SELECT e.exam_name, e.exam_date, COUNT(reg.student_id) AS students_registered
FROM Exam e
LEFT JOIN Registers reg ON e.exam_id = reg.exam_id
WHERE e.exam_date > '2024-04-01'
GROUP BY e.exam_name, e.exam_date;

-- 7. Government vs Private exam popularity
SELECT 
    CASE 
        WHEN ge.exam_id IS NOT NULL THEN 'Government'
        WHEN pe.exam_id IS NOT NULL THEN 'Private'
        ELSE 'Other'
    END AS exam_category,
    COUNT(DISTINCT e.exam_id) AS total_exams,
    COUNT(reg.student_id) AS registrations
FROM Exam e
LEFT JOIN GovtExam ge ON e.exam_id = ge.exam_id
LEFT JOIN PrivateExam pe ON e.exam_id = pe.exam_id
LEFT JOIN Registers reg ON e.exam_id = reg.exam_id
GROUP BY exam_category;

-- 8. Students with no mock test attempts
SELECT s.name, s.email
FROM Student s
LEFT JOIN Attempts_MockTest amt ON s.student_id = amt.student_id
WHERE amt.student_id IS NULL;

-- 9. Practice session performance analysis
SELECT s.name, ps.topic_name,
       ROUND((ps.correct_answers * 100.0 / ps.num_questions), 2) AS success_rate
FROM Student s
JOIN Attempts_PracticeSession aps ON s.student_id = aps.student_id
JOIN PracticeSession ps ON aps.session_id = ps.session_id;

-- 10. Recent notifications and their reach
SELECT n.message, n.notify_date, COUNT(r.student_id) AS notified_students
FROM Notification n
LEFT JOIN Receives r ON n.notification_id = r.notification_id
WHERE n.notify_date >= '2024-04-01'
GROUP BY n.message, n.notify_date;

-- 11. Students ready for specific exam types (based on mock test performance)
SELECT 
    s.name, 
    e.exam_type,
    AVG(amt.percentage) AS average_score,
    COUNT(amt.test_id) AS tests_taken
FROM Student s
JOIN Attempts_MockTest amt ON s.student_id = amt.student_id
JOIN MockTest mt ON amt.test_id = mt.test_id
JOIN Exam e ON mt.exam_id = e.exam_id
GROUP BY s.name, e.exam_type
HAVING AVG(amt.percentage) >= 75 AND COUNT(amt.test_id) >= 2;

-- 12. Exam difficulty analysis based on mock test scores
SELECT 
    e.exam_name,
    COUNT(amt.student_id) AS students_attempted,
    AVG(amt.percentage) AS avg_score,
    MIN(amt.percentage) AS min_score,
    MAX(amt.percentage) AS max_score,
    STDDEV(amt.percentage) AS score_variation
FROM Exam e
JOIN MockTest mt ON e.exam_id = mt.exam_id
JOIN Attempts_MockTest amt ON mt.test_id = amt.test_id
GROUP BY e.exam_name
HAVING COUNT(amt.student_id) >= 2;

-- ==============================
-- EDUCATIONAL ANALYTICS 
-- AZURE DATABASE FOR MySQL
-- Kamal Ibrahim
-- ==============================
use educational_analytics;

-- ==================
-- Executive summary 
-- Section 1
-- ==================

-- How many students are enrolled
SELECT COUNT(*) AS Total_students
from dim_student;

-- How many academic terms are recorded
SELECT COUNT(*) AS Total_Terms
from dim_term;

-- What is the average Attendance
SELECT Round(avg(Attendance), 2) AS Average_attendance 
from fact_attendance;

-- What is the Highest Attendance 
SELECT max(Attendance) as Jighest_attendance
from fact_attendance;

-- What is the lowest attendance?
SELECT min(Attendance) as Lowest_attendance
from fact_attendance;

-- What is the average Test 1 score?
SELECT
    ROUND(
        AVG(
            (
                `ENGLISH LANGUAGE` +
                `SOCIAL STUDIES` +
                `REL. & MORAL EDU.` +
                MATHEMATICS +
                `INTEGRATED SCIENCE` +
                COMPUTING +
                FRENCH +
                `GH. LANG. (AKUAPEM TWI)` +
                `CAREER TECHNOLOGY` +
                `CREATIVE ARTS & DESIGN`
            ) / 10
        ),
    2) AS Average_Test1_Score
FROM fact_test1;

-- What is the average Test 2 Score?
SELECT
    ROUND(
        AVG(
            (
                `ENGLISH LANGUAGE` +
                `SOCIAL STUDIES` +
                `REL. & MORAL EDU.` +
                MATHEMATICS +
                `INTEGRATED SCIENCE` +
                COMPUTING +
                FRENCH +
                `GH. LANG. (AKUAPEM TWI)` +
                `CAREER TECHNOLOGY` +
                `CREATIVE ARTS & DESIGN`
            ) / 10
        ),
    2) AS Average_Test1_Score
FROM fact_test2;

-- What is the average score for project work?
SELECT
    ROUND(
        AVG(
            (
                `ENGLISH LANGUAGE` +
                `SOCIAL STUDIES` +
                `REL. & MORAL EDU.` +
                MATHEMATICS +
                `INTEGRATED SCIENCE` +
                COMPUTING +
                FRENCH +
                `GH. LANG. (AKUAPEM TWI)` +
                `CAREER TECHNOLOGY` +
                `CREATIVE ARTS & DESIGN`
            ) / 10
        ),
    2) AS Average_Test1_Score
FROM fact_projectwork;

-- What is the average score for group work? 
SELECT
    ROUND(
        AVG(
            (
                `ENGLISH LANGUAGE` +
                `SOCIAL STUDIES` +
                `REL. & MORAL EDU.` +
                MATHEMATICS +
                `INTEGRATED SCIENCE` +
                COMPUTING +
                FRENCH +
                `GH. LANG. (AKUAPEM TWI)` +
                `CAREER TECHNOLOGY` +
                `CREATIVE ARTS & DESIGN`
            ) / 10
        ),
    2) AS Average_Test1_Score
FROM fact_groupwork;

-- What is the average score for examscore/
SELECT
    ROUND(
        AVG(
            (
                `ENGLISH LANGUAGE` +
                `SOCIAL STUDIES` +
                `REL. & MORAL EDU.` +
                MATHEMATICS +
                `INTEGRATED SCIENCE` +
                COMPUTING +
                FRENCH +
                `GH. LANG. (AKUAPEM TWI)` +
                `CAREER TECHNOLOGY` +
                `CREATIVE ARTS & DESIGN`
            ) / 10
        ),
    2) AS Average_Test1_Score
FROM fact_examscore;




-- ==========================
-- Section 2
-- Attendance Analysis
-- ==========================

-- Which Students had the highest attendance score from term 1

Select a.Student_id, a.Attendance, s.Student_Name
from fact_attendance as a
inner join dim_student as s
on a.student_id = s.student_id
where a.term_id = 1
order by a.Attendance desc
limit 20;

-- Which Students had the highest attendance score from term 2

Select a.Student_id, a.Attendance, s.Student_Name
from fact_attendance as a
inner join dim_student as s
on a.student_id = s.student_id
where a.term_id = 2
order by a.Attendance desc
limit 20;

-- Which Students had the highest attendance score from term 1

Select a.Student_id, a.Attendance, s.Student_Name
from fact_attendance as a
inner join dim_student as s
on a.student_id = s.student_id
where a.term_id = 3
order by a.Attendance desc
limit 20;

-- Which Students had the lowest attendance score from term 1

Select a.Student_id, a.Attendance, s.Student_Name
from fact_attendance as a
inner join dim_student as s
on a.student_id = s.student_id
where a.term_id = 1
order by a.Attendance asc
limit 5;

-- Which Students had the lowest attendance score from term 1

Select a.Student_id, a.Attendance, s.Student_Name
from fact_attendance as a
inner join dim_student as s
on a.student_id = s.student_id
where a.term_id = 2
order by a.Attendance asc
limit 5;

-- Which Students had the highest attendance score from term 1

Select a.Student_id, a.Attendance, s.Student_Name
from fact_attendance as a
inner join dim_student as s
on a.student_id = s.student_id
where a.term_id = 3
order by a.Attendance asc
limit 5;

-- What is the average attendance by term 1
select round(avg(attendance), 2) as Average_Attendance
from fact_attendance 
where term_id = 1;

-- What is the average attendance by term 2
select round(avg(attendance), 2) as Average_Attendance
from fact_attendance 
where term_id = 2;

-- What is the average attendance by term 3
select round(avg(attendance), 2) as Average_Attendance
from fact_attendance 
where term_id = 3;

-- Students with Perfect Attendance 
SELECT
    s.Student_Name,
    a.Attendance
FROM fact_attendance a
JOIN dim_student s
ON a.Student_ID = s.Student_ID
WHERE a.Attendance = (
    SELECT MAX(Attendance)
    FROM fact_attendance
);

-- ==================
-- Section 3 
-- Student Performance
-- ===================
-- Who are the Top 10 Performing Students by term?
-- term 1
SELECT
    Student_ID,
    Student_Name,
    Overall_Average
FROM vw_student_performance
WHERE Term_ID = 1
ORDER BY Overall_Average DESC
LIMIT 10;
-- term 2 
SELECT
    Student_ID,
    Student_Name,
    Overall_Average
FROM vw_student_performance
WHERE Term_ID = 2
ORDER BY Overall_Average DESC
LIMIT 10;
-- term 3
SELECT
    Student_ID,
    Student_Name,
    Overall_Average
FROM vw_student_performance
WHERE Term_ID = 3
ORDER BY Overall_Average DESC
LIMIT 10;

-- Buttom 10 performing Students by term?
-- Term 1
SELECT
    Student_ID,
    Student_Name,
    Overall_Average
FROM vw_student_performance
WHERE Term_ID = 1
ORDER BY Overall_Average ASC
LIMIT 10;

-- Term 2
SELECT
    Student_ID,
    Student_Name,
    Overall_Average
FROM vw_student_performance
WHERE Term_ID = 2
ORDER BY Overall_Average ASC
LIMIT 10;

-- term 3
SELECT
    Student_ID,
    Student_Name,
    Overall_Average
FROM vw_student_performance
WHERE Term_ID = 3
ORDER BY Overall_Average ASC
LIMIT 10;

-- Average Student Performance by Term
SELECT
    Term_Name,
    ROUND(AVG(Overall_Average),2) AS Average_Performance
FROM vw_student_performance
GROUP BY Term_ID, Term_Name
ORDER BY Term_ID;

-- Students scoring above 60%
SELECT
    Student_ID,
    Student_Name,
    Term_Name,
    Overall_Average
FROM vw_student_performance
WHERE Overall_Average >= 60
ORDER BY Overall_Average DESC;

-- Students scoring below 50%
SELECT
    Student_ID,
    Student_Name,
    Term_Name,
    Overall_Average
FROM vw_student_performance
WHERE Overall_Average < 50
ORDER BY Overall_Average ASC;

-- Top 5 consistent Performance
SELECT
    Student_ID,
    Student_Name,
    ROUND(AVG(Overall_Average),2) AS Overall_Score
FROM vw_student_performance
GROUP BY Student_ID, Student_Name
ORDER BY Overall_Score DESC
LIMIT 5;

-- students improving Accross terms 
-- Identifying students whose performance increased from term 1-3
SELECT
    Student_ID,
    Student_Name,
    MAX(CASE WHEN Term_ID = 1 THEN Overall_Average END) AS Term1,
    MAX(CASE WHEN Term_ID = 3 THEN Overall_Average END) AS Term3,
    ROUND(
        MAX(CASE WHEN Term_ID = 3 THEN Overall_Average END) -
        MAX(CASE WHEN Term_ID = 1 THEN Overall_Average END),
    2) AS Improvement
FROM vw_student_performance
GROUP BY Student_ID, Student_Name
HAVING Improvement > 0
ORDER BY Improvement DESC;

-- Students whose performance declined from term 1-3 
SELECT
    Student_ID,
    Student_Name,
    MAX(CASE WHEN Term_ID = 1 THEN Overall_Average END) AS Term1,
    MAX(CASE WHEN Term_ID = 3 THEN Overall_Average END) AS Term3,
    ROUND(
        MAX(CASE WHEN Term_ID = 3 THEN Overall_Average END) -
        MAX(CASE WHEN Term_ID = 1 THEN Overall_Average END),
    2) AS Change_in_Score
FROM vw_student_performance
GROUP BY Student_ID, Student_Name
HAVING Change_in_Score < 0
ORDER BY Change_in_Score;

-- Performance Classification 
SELECT
	Term_ID
    Term_Name,

    CASE
        WHEN Overall_Average >= 80 THEN 'Excellent'
        WHEN Overall_Average >= 70 THEN 'Very Good'
        WHEN Overall_Average >= 60 THEN 'Good'
        WHEN Overall_Average >= 50 THEN 'Pass'
        ELSE 'Needs Improvement'
    END AS Performance_Level,

    COUNT(*) AS Number_of_Students

FROM vw_student_performance

GROUP BY
	Term_ID,
    Term_Name,
    Performance_Level

ORDER BY
	Term_ID,
    Term_ID,
    Performance_Level;
    


-- =======================================
-- SECTION 4: SUBJECT PERFORMANCE ANALYSIS
-- =======================================

-- Average Score by Subject
SELECT
    ROUND(AVG(English),2) AS English,
    ROUND(AVG(Mathematics),2) AS Mathematics,
    ROUND(AVG(Integrated_Science),2) AS Integrated_Science,
    ROUND(AVG(Social_Studies),2) AS Social_Studies,
    ROUND(AVG(Computing),2) AS Computing,
    ROUND(AVG(French),2) AS French,
    ROUND(AVG(Creative_Arts),2) AS Creative_Arts,
    ROUND(AVG(Career_Technology),2) AS Career_Technology,
    ROUND(AVG(Religious_Moral_Education),2) AS RME,
    ROUND(AVG(Ghanaian_Language),2) AS Ghanaian_Language
FROM vw_student_performance;

-- Average Subject Score by Term
SELECT
    Term_Name,

    ROUND(AVG(English),2) AS English,
    ROUND(AVG(Mathematics),2) AS Mathematics,
    ROUND(AVG(Integrated_Science),2) AS Integrated_Science,
    ROUND(AVG(Social_Studies),2) AS Social_Studies,
	ROUND(AVG(Computing),2) AS Computing,
    ROUND(AVG(French),2) AS French,
    ROUND(AVG(Creative_Arts),2) AS Creative_Arts,
    ROUND(AVG(Career_Technology),2) AS Career_Technology,
    ROUND(AVG(Religious_Moral_Education),2) AS RME,
    ROUND(AVG(Ghanaian_Language),2) AS Ghanaian_Language
FROM vw_student_performance

GROUP BY
    Term_ID,
    Term_Name

ORDER BY
    Term_ID;
    
-- Highest Average Core Subject
SELECT
    ROUND(AVG(English),2) AS English,
    ROUND(AVG(Mathematics),2) AS Mathematics,
    ROUND(AVG(Integrated_Science),2) AS Integrated_Science,
    ROUND(AVG(Social_Studies),2) AS Social_Studies
FROM vw_student_performance;

-- Students scoring above 70 in English
SELECT
    Student_ID,
    Student_Name,
    Term_Name,
    English
FROM vw_student_performance
WHERE English >= 70
ORDER BY English DESC;

-- Students scoring below 50 in Mathematics
SELECT
    Term_Name,
    COUNT(Student_ID) AS Num_Students
FROM vw_student_performance
WHERE Mathematics < 50
GROUP BY Term_ID, Term_Name
ORDER BY Term_ID;


-- =============================================
-- SECTION 5: ATTENDANCE VS PERFORMANCE ANALYSIS
-- =============================================
-- Average Academic Performance by Attendance Category
SELECT
    a.Attendance_Category,
    ROUND(AVG(p.Overall_Average),2) AS Average_Performance
FROM vw_student_performance p
JOIN vw_attendance_summary a
ON p.Student_ID = a.Student_ID
AND p.Term_ID = a.Term_ID
GROUP BY a.Attendance_Category
ORDER BY Average_Performance DESC;

-- Top 5 Students by Attendance and Their Academic Performance
WITH RankedAttendance AS
(
    SELECT
        a.Student_ID,
        a.Student_Name,
        a.Term_ID,
        a.Term_Name,
        a.Attendance,
        p.Overall_Average,

        ROW_NUMBER() OVER(
            PARTITION BY a.Term_ID
            ORDER BY a.Attendance DESC
        ) AS Ranking

    FROM vw_attendance_summary a
    JOIN vw_student_performance p
        ON a.Student_ID = p.Student_ID
       AND a.Term_ID = p.Term_ID
)

SELECT *
FROM RankedAttendance
WHERE Ranking <= 5
ORDER BY Term_ID, Ranking;

-- Butom 5 Students by Attendance and their Academic performance 
WITH RankedAttendance AS
(
    SELECT
        a.Student_ID,
        a.Student_Name,
        a.Term_ID,
        a.Term_Name,
        a.Attendance,
        p.Overall_Average,

        ROW_NUMBER() OVER(
            PARTITION BY a.Term_ID
            ORDER BY a.Attendance ASC
        ) AS Ranking

    FROM vw_attendance_summary a
    JOIN vw_student_performance p
        ON a.Student_ID = p.Student_ID
       AND a.Term_ID = p.Term_ID
)

SELECT *
FROM RankedAttendance
WHERE Ranking <= 5
ORDER BY Term_ID, Ranking;

-- Average Attendanceand Academic performance by Term
SELECT
    a.Term_Name,
    ROUND(AVG(a.Attendance),2) AS Average_Attendance,
    ROUND(AVG(p.Overall_Average),2) AS Average_Performance
FROM vw_attendance_summary a
JOIN vw_student_performance p
ON a.Student_ID = p.Student_ID
AND a.Term_ID = p.Term_ID
GROUP BY a.Term_ID, a.Term_Name
ORDER BY a.Term_ID;

-- Attendance Category Distribution by performance level 
SELECT
    a.Attendance_Category,

    CASE
        WHEN p.Overall_Average >= 80 THEN 'Excellent'
        WHEN p.Overall_Average >= 70 THEN 'Very Good'
        WHEN p.Overall_Average >= 60 THEN 'Good'
        WHEN p.Overall_Average >= 50 THEN 'Pass'
        ELSE 'Needs Improvement'
    END AS Performance_Level,

    COUNT(*) AS Number_of_Students

FROM vw_attendance_summary a
JOIN vw_student_performance p
ON a.Student_ID = p.Student_ID
AND a.Term_ID = p.Term_ID

GROUP BY
    a.Attendance_Category,
    Performance_Level

ORDER BY
    a.Attendance_Category,
    Performance_Level;
    
    
    
/*
===========================================================
SECTION 6: KEY FINDINGS & RECOMMENDATIONS
===========================================================

KEY FINDINGS

1. Student attendance generally declined from Term 1 to Term 3 mainly because the number of days for term 1 were more than term 3 .

2. Students with higher attendance generally achieved higher overall academic averages but that was not the case for all the students as some had high attendance but still performed poorly.

3. A small group of students maintained high attendance but performed below expectations,
indicating that attendance alone does not guarantee academic success.

4. Mathematics and English showed greater variation in performance than the other subjects.

5. The performance classification indicated that most students were in the Pass and Good categories,
while relatively few achieved Excellent performance.

RECOMMENDATIONS

• Provide additional academic support for students with high attendance but low performance.

• Monitor students with declining attendance early to prevent further academic decline.

• Develop targeted intervention programmes for subjects with consistently low average scores.

• Recognize high-performing students and identify the learning strategies that contribute to their success.

===========================================================
*/

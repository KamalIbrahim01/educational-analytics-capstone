use educational_analytics;
select count(*) as totalstudents, 
		count(distinct Student_ID) as Uniquestudents
from dim_student;

SELECT COUNT(*) AS TotalTerms,
       COUNT(DISTINCT Term_ID) AS UniqueTerms
FROM dim_term;

SELECT
COUNT(*) AS NRows,
COUNT(Student_ID) AS StudentIDs,
COUNT(Term_ID) AS TermIDs
FROM fact_attendance;

SELECT
COUNT(*) AS NRows,
COUNT(Student_ID) AS StudentIDs,
COUNT(Term_ID) AS TermIDs
FROM fact_test1;

SELECT
COUNT(*) AS NRows,
COUNT(Student_ID) AS StudentIDs,
COUNT(Term_ID) AS TermIDs
FROM fact_test2;

SELECT
COUNT(*) AS NRows,
COUNT(Student_ID) AS StudentIDs,
COUNT(Term_ID) AS TermIDs
FROM fact_groupwork;

SELECT
COUNT(*) AS NRows,
COUNT(Student_ID) AS StudentIDs,
COUNT(Term_ID) AS TermIDs
FROM fact_projectwork;

SELECT
COUNT(*) AS NRows,
COUNT(Student_ID) AS StudentIDs,
COUNT(Term_ID) AS TermIDs
FROM fact_examscore;

SELECT *
FROM fact_examscore f
LEFT JOIN dim_student d
ON f.Student_ID = d.Student_ID
WHERE d.Student_ID IS NULL;

describe fact_attendance;
show tables;
describe dim_term;

SELECT COUNT(*) AS MissingStudents
FROM fact_attendance f
LEFT JOIN dim_student d
ON f.Student_ID = d.Student_ID
WHERE d.Student_ID IS NULL;

SELECT COUNT(*) AS MissingTerms
FROM fact_attendance f
LEFT JOIN dim_term t
ON f.Term_ID = t.Term_ID
WHERE t.Term_ID IS NULL;

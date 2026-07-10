-- Creating MySQL views for calculated and weighted scores
CREATE VIEW vw_weighted_scores AS

SELECT
    t1.Student_ID,
    t1.Term_ID,

    -- English Language
    ROUND(
        (t1.`ENGLISH LANGUAGE` / 30 * 15) +
        (t2.`ENGLISH LANGUAGE` / 30 * 15) +
        (gw.`ENGLISH LANGUAGE` / 20 * 10) +
        (pw.`ENGLISH LANGUAGE` / 20 * 10) +
        (ex.`ENGLISH LANGUAGE` / 100 * 50),2
    ) AS English,

    -- Mathematics
    ROUND(
        (t1.MATHEMATICS / 30 * 15) +
        (t2.MATHEMATICS / 30 * 15) +
        (gw.MATHEMATICS / 20 * 10) +
        (pw.MATHEMATICS / 20 * 10) +
        (ex.MATHEMATICS / 100 * 50),2
    ) AS Mathematics,

    -- Integrated Science
    ROUND(
        (t1.`INTEGRATED SCIENCE` / 30 * 15) +
        (t2.`INTEGRATED SCIENCE` / 30 * 15) +
        (gw.`INTEGRATED SCIENCE` / 20 * 10) +
        (pw.`INTEGRATED SCIENCE` / 20 * 10) +
        (ex.`INTEGRATED SCIENCE` / 100 * 50),2
    ) AS Integrated_Science,

    -- Computing
    ROUND(
        (t1.COMPUTING / 30 * 15) +
        (t2.COMPUTING / 30 * 15) +
        (gw.COMPUTING / 20 * 10) +
        (pw.COMPUTING / 20 * 10) +
        (ex.COMPUTING / 100 * 50),2
    ) AS Computing,

    -- Career Technology
    ROUND(
        (t1.`CAREER TECHNOLOGY` / 30 * 15) +
        (t2.`CAREER TECHNOLOGY` / 30 * 15) +
        (gw.`CAREER TECHNOLOGY` / 20 * 10) +
        (pw.`CAREER TECHNOLOGY` / 20 * 10) +
        (ex.`CAREER TECHNOLOGY` / 100 * 50),2
    ) AS Career_Technology,

    -- Creative Arts & Design
    ROUND(
        (t1.`CREATIVE ARTS & DESIGN` / 30 * 15) +
        (t2.`CREATIVE ARTS & DESIGN` / 30 * 15) +
        (gw.`CREATIVE ARTS & DESIGN` / 20 * 10) +
        (pw.`CREATIVE ARTS & DESIGN` / 20 * 10) +
        (ex.`CREATIVE ARTS & DESIGN` / 100 * 50),2
    ) AS Creative_Arts,

    -- French
    ROUND(
        (t1.FRENCH / 30 * 15) +
        (t2.FRENCH / 30 * 15) +
        (gw.FRENCH / 20 * 10) +
        (pw.FRENCH / 20 * 10) +
        (ex.FRENCH / 100 * 50),2
    ) AS French,

    -- Ghanaian Language
    ROUND(
        (t1.`GH. LANG. (AKUAPEM TWI)` / 30 * 15) +
        (t2.`GH. LANG. (AKUAPEM TWI)` / 30 * 15) +
        (gw.`GH. LANG. (AKUAPEM TWI)` / 20 * 10) +
        (pw.`GH. LANG. (AKUAPEM TWI)` / 20 * 10) +
        (ex.`GH. LANG. (AKUAPEM TWI)` / 100 * 50),2
    ) AS Ghanaian_Language,

    -- Religious & Moral Education
    ROUND(
        (t1.`REL. & MORAL EDU.` / 30 * 15) +
        (t2.`REL. & MORAL EDU.` / 30 * 15) +
        (gw.`REL. & MORAL EDU.` / 20 * 10) +
        (pw.`REL. & MORAL EDU.` / 20 * 10) +
        (ex.`REL. & MORAL EDU.` / 100 * 50),2
    ) AS Religious_Moral_Education,

    -- Social Studies
    ROUND(
        (t1.`SOCIAL STUDIES` / 30 * 15) +
        (t2.`SOCIAL STUDIES` / 30 * 15) +
        (gw.`SOCIAL STUDIES` / 20 * 10) +
        (pw.`SOCIAL STUDIES` / 20 * 10) +
        (ex.`SOCIAL STUDIES` / 100 * 50),2
    ) AS Social_Studies

FROM fact_test1 t1
JOIN fact_test2 t2
    ON t1.Student_ID = t2.Student_ID
   AND t1.Term_ID = t2.Term_ID

JOIN fact_groupwork gw
    ON t1.Student_ID = gw.Student_ID
   AND t1.Term_ID = gw.Term_ID

JOIN fact_projectwork pw
    ON t1.Student_ID = pw.Student_ID
   AND t1.Term_ID = pw.Term_ID

JOIN fact_examscore ex
    ON t1.Student_ID = ex.Student_ID
   AND t1.Term_ID = ex.Term_ID;
   
   
   
CREATE VIEW vw_student_performance AS

SELECT

    ws.Student_ID,
    s.Student_Name,
    ws.Term_ID,
    t.Term_Name,

    ws.English,
    ws.Mathematics,
    ws.Integrated_Science,
    ws.Computing,
    ws.Career_Technology,
    ws.Creative_Arts,
    ws.French,
    ws.Ghanaian_Language,
    ws.Religious_Moral_Education,
    ws.Social_Studies,

    ROUND(
        (
            ws.English +
            ws.Mathematics +
            ws.Integrated_Science +
            ws.Computing +
            ws.Career_Technology +
            ws.Creative_Arts +
            ws.French +
            ws.Ghanaian_Language +
            ws.Religious_Moral_Education +
            ws.Social_Studies
        ) / 10,
        2
    ) AS Overall_Average

FROM vw_weighted_scores ws

JOIN dim_student s
ON ws.Student_ID = s.Student_ID

JOIN dim_term t
ON ws.Term_ID = t.Term_ID;


CREATE OR REPLACE VIEW vw_attendance_summary AS
SELECT
    a.Student_ID,
    s.Student_Name,
    a.Term_ID,
    t.Term_Name,
    a.Attendance,

    CASE
        WHEN a.Attendance < 45 THEN 'Low'
        WHEN a.Attendance < 55 THEN 'Moderate'
        ELSE 'High'
    END AS Attendance_Category

FROM fact_attendance a
JOIN dim_student s
    ON a.Student_ID = s.Student_ID
JOIN dim_term t
    ON a.Term_ID = t.Term_ID;


SELECT *
FROM vw_attendance_summary
LIMIT 10;

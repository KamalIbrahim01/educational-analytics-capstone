--     Educational Analytics Capstone project
-- Creating the database if it does not exist already

CREATE DATABASE IF NOT EXISTS educational_analytics;
USE educational_analytics;

 -- SECTION 2
 -- CREATING STAGING FILES OF 3 TERMLY ATTENDANCE IN ORDER TO ERGE INTO ONE LARGE TABLE 
 -- Attendance Staging Tables


CREATE TABLE stg_student_lookup (

    `STUDENT ID` INT,

    `STUDENT NAME` VARCHAR(100),

    Student_ID VARCHAR(10)

);
 
 CREATE TABLE stg_attendance_term1 (Student_ID VARCHAR(10), Attendance int);
 CREATE TABLE stg_attendance_term2 (Student_ID VARCHAR(10), Attendance int);
 CREATE TABLE stg_attendance_term3 (Student_ID VARCHAR(10), Attendance int);
 
 -- Test 1 Staging Tables
 CREATE TABLE stg_test1_term1 (
			Student_ID VARCHAR(10),

    `ENGLISH LANGUAGE` DECIMAL(5,2),

    `SOCIAL STUDIES` DECIMAL(5,2),

    `REL. & MORAL EDU.` DECIMAL(5,2),

    `MATHEMATICS` DECIMAL(5,2),

    `INTEGRATED SCIENCE` DECIMAL(5,2),

    `COMPUTING` DECIMAL(5,2),

    `FRENCH` DECIMAL(5,2),

    `GH. LANG. (AKUAPEM TWI)` DECIMAL(5,2),

    `CAREER TECHNOLOGY` DECIMAL(5,2),

    `CREATIVE ARTS & DESIGN` DECIMAL(5,2)

);
 CREATE TABLE stg_test1_term2 (
			Student_ID VARCHAR(10),
    `ENGLISH LANGUAGE` DECIMAL(5,2),

    `SOCIAL STUDIES` DECIMAL(5,2),

    `REL. & MORAL EDU.` DECIMAL(5,2),

    `MATHEMATICS` DECIMAL(5,2),

    `INTEGRATED SCIENCE` DECIMAL(5,2),

    `COMPUTING` DECIMAL(5,2),

    `FRENCH` DECIMAL(5,2),

    `GH. LANG. (AKUAPEM TWI)` DECIMAL(5,2),

    `CAREER TECHNOLOGY` DECIMAL(5,2),

    `CREATIVE ARTS & DESIGN` DECIMAL(5,2)

);
 CREATE TABLE stg_test1_term3 (
			Student_ID VARCHAR(10),
    `ENGLISH LANGUAGE` DECIMAL(5,2),

    `SOCIAL STUDIES` DECIMAL(5,2),

    `REL. & MORAL EDU.` DECIMAL(5,2),

    `MATHEMATICS` DECIMAL(5,2),

    `INTEGRATED SCIENCE` DECIMAL(5,2),

    `COMPUTING` DECIMAL(5,2),

    `FRENCH` DECIMAL(5,2),

    `GH. LANG. (AKUAPEM TWI)` DECIMAL(5,2),

    `CAREER TECHNOLOGY` DECIMAL(5,2),

    `CREATIVE ARTS & DESIGN` DECIMAL(5,2)
);
            
-- Test 2 staging tables, introducing the 'like' statement to copy the schema from term 1 to keep the code simple and clean
CREATE TABLE stg_test2_term1 LIKE stg_test1_term1;

CREATE TABLE stg_test2_term2 LIKE stg_test1_term1;

CREATE TABLE stg_test2_term3 LIKE stg_test1_term1;
           
-- Group work staging tables
CREATE TABLE stg_groupwork_term1 LIKE stg_test1_term1;

CREATE TABLE stg_groupwork_term2 LIKE stg_test1_term1;

CREATE TABLE stg_groupwork_term3 LIKE stg_test1_term1;

-- Project work staging tables
CREATE TABLE stg_projectwork_term1 LIKE stg_test1_term1;

CREATE TABLE stg_projectwork_term2 LIKE stg_test1_term1;

CREATE TABLE stg_projectwork_term3 LIKE stg_test1_term1;

-- Class Score Staging tables 
CREATE TABLE stg_classscore_term1 LIKE stg_test1_term1;

CREATE TABLE stg_classscore_term2 LIKE stg_test1_term1;

CREATE TABLE stg_classscore_term3 LIKE stg_test1_term1;

-- Exam Score staging tables
CREATE TABLE stg_examscore_term1 LIKE stg_test1_term1;

CREATE TABLE stg_examscore_term2 LIKE stg_test1_term1;

CREATE TABLE stg_examscore_term3 LIKE stg_test1_term1;

-- Dropping class Score Table because it is a calculated table 

DROP TABLE stg_classscore_term1;

DROP TABLE stg_classscore_term2;

DROP TABLE stg_classscore_term3;

-- The sql import wizard us having some issue with mapping some filles so we would use the local infile variable to insert
SHOW VARIABLES LIKE 'local_infile';
SELECT VERSION();
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE
'/Users/godalone/Documents/educational-analytics-capstone/data/cleaned/student_lookup.csv'
INTO TABLE stg_student_lookup
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
`STUDENT ID`,
`STUDENT NAME`,
Student_ID
);

-- loading the csv file 
LOAD DATA LOCAL INFILE '/Users/godalone/Documents/educational-analytics-capstone/data/cleaned/term3/test1.csv'
INTO TABLE stg_test1_term3
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
`ENGLISH LANGUAGE`,
`SOCIAL STUDIES`,
`REL. & MORAL EDU.`,
`MATHEMATICS`,
`INTEGRATED SCIENCE`,
`COMPUTING`,
`FRENCH`,
`GH. LANG. (AKUAPEM TWI)`,
`CAREER TECHNOLOGY`,
`CREATIVE ARTS & DESIGN`,
Student_ID
);

LOAD DATA LOCAL INFILE '/Users/godalone/Documents/educational-analytics-capstone/data/cleaned/term2/test2.csv'
INTO TABLE stg_test2_term2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
`ENGLISH LANGUAGE`,
`SOCIAL STUDIES`,
`REL. & MORAL EDU.`,
`MATHEMATICS`,
`INTEGRATED SCIENCE`,
`COMPUTING`,
`FRENCH`,
`GH. LANG. (AKUAPEM TWI)`,
`CAREER TECHNOLOGY`,
`CREATIVE ARTS & DESIGN`,
Student_ID
);

LOAD DATA LOCAL INFILE '/Users/godalone/Documents/educational-analytics-capstone/data/cleaned/term3/test2.csv'
INTO TABLE stg_test2_term3
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
`ENGLISH LANGUAGE`,
`SOCIAL STUDIES`,
`REL. & MORAL EDU.`,
`MATHEMATICS`,
`INTEGRATED SCIENCE`,
`COMPUTING`,
`FRENCH`,
`GH. LANG. (AKUAPEM TWI)`,
`CAREER TECHNOLOGY`,
`CREATIVE ARTS & DESIGN`,
Student_ID
);

LOAD DATA LOCAL INFILE '/Users/godalone/Documents/educational-analytics-capstone/data/cleaned/term1/groupwork.csv'
INTO TABLE stg_groupwork_term1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
`ENGLISH LANGUAGE`,
`SOCIAL STUDIES`,
`REL. & MORAL EDU.`,
`MATHEMATICS`,
`INTEGRATED SCIENCE`,
`COMPUTING`,
`FRENCH`,
`GH. LANG. (AKUAPEM TWI)`,
`CAREER TECHNOLOGY`,
`CREATIVE ARTS & DESIGN`,
Student_ID
);

LOAD DATA LOCAL INFILE '/Users/godalone/Documents/educational-analytics-capstone/data/cleaned/term3/groupwork.csv'
INTO TABLE stg_groupwork_term3
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
`ENGLISH LANGUAGE`,
`SOCIAL STUDIES`,
`REL. & MORAL EDU.`,
`MATHEMATICS`,
`INTEGRATED SCIENCE`,
`COMPUTING`,
`FRENCH`,
`GH. LANG. (AKUAPEM TWI)`,
`CAREER TECHNOLOGY`,
`CREATIVE ARTS & DESIGN`,
Student_ID
);

SELECT *
FROM stg_student_lookup
LIMIT 10;

-- CREATING A DIMENSION TABLE FOR ALL THE STAGING TABLES TO HAVE AN ORGANISED DATABASE
-- CREATING THE DIM_STUDENTS

CREATE TABLE dim_student (

    Student_ID VARCHAR(10) PRIMARY KEY,

    Student_Name VARCHAR(100)

);
INSERT INTO dim_student (
    Student_ID,
    Student_Name
)

SELECT

    Student_ID,

    `STUDENT NAME`

FROM stg_student_lookup;
SELECT *
FROM dim_student
ORDER BY Student_ID;


-- CREATING THE TERM DIMENSION

CREATE TABLE dim_term (

    Term_ID INT PRIMARY KEY,

    Term_Name VARCHAR(20)

);

INSERT INTO dim_term (Term_ID, Term_Name)
VALUES
(1, 'Term 1'),
(2, 'Term 2'),
(3, 'Term 3');

-- ATTENDANCE FACT TABLE 
CREATE TABLE fact_attendance (

    Student_ID VARCHAR(10),

    Term_ID INT,

    Attendance INT,

    PRIMARY KEY (Student_ID, Term_ID),

    FOREIGN KEY (Student_ID)
        REFERENCES dim_student(Student_ID),

    FOREIGN KEY (Term_ID)
        REFERENCES dim_term(Term_ID)

);

INSERT INTO fact_attendance (
    Student_ID,
    Term_ID,
    Attendance
)

SELECT
    Student_ID,
    1,
    Attendance
FROM stg_attendance_term1;

INSERT INTO fact_attendance (
    Student_ID,
    Term_ID,
    Attendance
)

SELECT
    Student_ID,
    2,
    Attendance
FROM stg_attendance_term2;

INSERT INTO fact_attendance (
    Student_ID,
    Term_ID,
    Attendance
)

SELECT
    Student_ID,
    3,
    Attendance
FROM stg_attendance_term3;

-- FACT TABLE TEST 1
CREATE TABLE fact_test1 (

    Student_ID VARCHAR(10),

    Term_ID INT,

    `ENGLISH LANGUAGE` DECIMAL(5,2),

    `SOCIAL STUDIES` DECIMAL(5,2),

    `REL. & MORAL EDU.` DECIMAL(5,2),

    `MATHEMATICS` DECIMAL(5,2),

    `INTEGRATED SCIENCE` DECIMAL(5,2),

    `COMPUTING` DECIMAL(5,2),

    `FRENCH` DECIMAL(5,2),

    `GH. LANG. (AKUAPEM TWI)` DECIMAL(5,2),

    `CAREER TECHNOLOGY` DECIMAL(5,2),

    `CREATIVE ARTS & DESIGN` DECIMAL(5,2),

    PRIMARY KEY (Student_ID, Term_ID),

    CONSTRAINT fk_test1_student
        FOREIGN KEY (Student_ID)
        REFERENCES dim_student(Student_ID),

    CONSTRAINT fk_test1_term
        FOREIGN KEY (Term_ID)
        REFERENCES dim_term(Term_ID)

);
INSERT INTO fact_test1
SELECT
    Student_ID,
    1,
    `ENGLISH LANGUAGE`,
    `SOCIAL STUDIES`,
    `REL. & MORAL EDU.`,
    `MATHEMATICS`,
    `INTEGRATED SCIENCE`,
    `COMPUTING`,
    `FRENCH`,
    `GH. LANG. (AKUAPEM TWI)`,
    `CAREER TECHNOLOGY`,
    `CREATIVE ARTS & DESIGN`
FROM stg_test1_term1;

-- Term 2
INSERT INTO fact_test1
SELECT
    Student_ID,
    2,
    `ENGLISH LANGUAGE`,
    `SOCIAL STUDIES`,
    `REL. & MORAL EDU.`,
    `MATHEMATICS`,
    `INTEGRATED SCIENCE`,
    `COMPUTING`,
    `FRENCH`,
    `GH. LANG. (AKUAPEM TWI)`,
    `CAREER TECHNOLOGY`,
    `CREATIVE ARTS & DESIGN`
FROM stg_test1_term2;

-- Term 3
INSERT INTO fact_test1
SELECT
    Student_ID,
    3,
    `ENGLISH LANGUAGE`,
    `SOCIAL STUDIES`,
    `REL. & MORAL EDU.`,
    `MATHEMATICS`,
    `INTEGRATED SCIENCE`,
    `COMPUTING`,
    `FRENCH`,
    `GH. LANG. (AKUAPEM TWI)`,
    `CAREER TECHNOLOGY`,
    `CREATIVE ARTS & DESIGN`
FROM stg_test1_term3;

-- Creating fact test2 table
CREATE TABLE fact_test2 LIKE fact_test1;
-- Term 1
INSERT INTO fact_test2
SELECT
    Student_ID,
    1,
    `ENGLISH LANGUAGE`,
    `SOCIAL STUDIES`,
    `REL. & MORAL EDU.`,
    `MATHEMATICS`,
    `INTEGRATED SCIENCE`,
    `COMPUTING`,
    `FRENCH`,
    `GH. LANG. (AKUAPEM TWI)`,
    `CAREER TECHNOLOGY`,
    `CREATIVE ARTS & DESIGN`
FROM stg_test2_term1;

-- Term 2
INSERT INTO fact_test2
SELECT
    Student_ID,
    2,
    `ENGLISH LANGUAGE`,
    `SOCIAL STUDIES`,
    `REL. & MORAL EDU.`,
    `MATHEMATICS`,
    `INTEGRATED SCIENCE`,
    `COMPUTING`,
    `FRENCH`,
    `GH. LANG. (AKUAPEM TWI)`,
    `CAREER TECHNOLOGY`,
    `CREATIVE ARTS & DESIGN`
FROM stg_test2_term2;

-- Term 3
INSERT INTO fact_test2
SELECT
    Student_ID,
    3,
    `ENGLISH LANGUAGE`,
    `SOCIAL STUDIES`,
    `REL. & MORAL EDU.`,
    `MATHEMATICS`,
    `INTEGRATED SCIENCE`,
    `COMPUTING`,
    `FRENCH`,
    `GH. LANG. (AKUAPEM TWI)`,
    `CAREER TECHNOLOGY`,
    `CREATIVE ARTS & DESIGN`
FROM stg_test2_term3;

-- creating Groupwork fact table
SELECT COUNT(*) AS total_rows
FROM fact_groupwork;
SHOW CREATE TABLE fact_groupwork;
CREATE TABLE fact_groupwork (

    Student_ID VARCHAR(10),
    Term_ID INT,

    `ENGLISH LANGUAGE` DECIMAL(5,2),
    `SOCIAL STUDIES` DECIMAL(5,2),
    `REL. & MORAL EDU.` DECIMAL(5,2),
    `MATHEMATICS` DECIMAL(5,2),
    `INTEGRATED SCIENCE` DECIMAL(5,2),
    `COMPUTING` DECIMAL(5,2),
    `FRENCH` DECIMAL(5,2),
    `GH. LANG. (AKUAPEM TWI)` DECIMAL(5,2),
    `CAREER TECHNOLOGY` DECIMAL(5,2),
    `CREATIVE ARTS & DESIGN` DECIMAL(5,2),

    PRIMARY KEY (Student_ID, Term_ID),

    CONSTRAINT fk_groupwork_student
        FOREIGN KEY (Student_ID)
        REFERENCES dim_student(Student_ID),

    CONSTRAINT fk_groupwork_term
        FOREIGN KEY (Term_ID)
        REFERENCES dim_term(Term_ID)
);



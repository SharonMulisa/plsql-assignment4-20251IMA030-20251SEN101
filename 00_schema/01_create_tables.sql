-- 01_create_tables.sql
-- Student Registration and Grading System

DROP TABLE enrollments CASCADE CONSTRAINTS;
DROP TABLE students CASCADE CONSTRAINTS;
DROP TABLE courses CASCADE CONSTRAINTS;
DROP SEQUENCE enroll_seq;

CREATE TABLE students (
  student_id NUMBER PRIMARY KEY,
  full_name VARCHAR2(100) NOT NULL,
  email VARCHAR2(100) UNIQUE NOT NULL,
  program VARCHAR2(50)
);

CREATE TABLE courses (
  course_id NUMBER PRIMARY KEY,
  course_name VARCHAR2(100) NOT NULL,
  credits NUMBER CHECK (credits > 0)
);

CREATE TABLE enrollments (
  enrollment_id NUMBER PRIMARY KEY,
  student_id NUMBER REFERENCES students(student_id),
  course_id NUMBER REFERENCES courses(course_id),
  grade NUMBER CHECK (grade BETWEEN 0 AND 100),
  UNIQUE(student_id, course_id)
);

CREATE SEQUENCE enroll_seq START WITH 100 INCREMENT BY 1;

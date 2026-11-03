CREATE OR REPLACE PROCEDURE enroll_student(
  p_student_id IN NUMBER,
  p_course_id IN NUMBER,
  p_rows OUT NUMBER
) IS
  -- %ROWTYPE Record
  v_enroll enrollments%ROWTYPE;
  -- User-defined Record
  TYPE student_rec IS RECORD (id NUMBER, name VARCHAR2(100));
  v_student student_rec;
BEGIN
  v_enroll.student_id := p_student_id;
  v_enroll.course_id := p_course_id;

  INSERT INTO enrollments(enrollment_id, student_id, course_id)
  VALUES (enroll_seq.NEXTVAL, v_enroll.student_id, v_enroll.course_id);

  p_rows := SQL%ROWCOUNT; -- Implicit Cursor
  IF SQL%FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Enrolled successfully. Rows: ' || p_rows);
  END IF;
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    RAISE_APPLICATION_ERROR(-20001, 'Student already enrolled in this course');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Enroll Error: ' || SQLERRM);
END;
/

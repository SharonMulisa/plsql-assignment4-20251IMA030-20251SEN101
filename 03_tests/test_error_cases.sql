SET SERVEROUTPUT ON;
-- Test 1: Duplicate enrollment - should raise -20001
BEGIN
  DECLARE v_rows NUMBER; BEGIN enroll_student(1, 101, v_rows); END;
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Expected Error: ' || SQLERRM); END;
/

-- Test 2: No grades - should raise -20003
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_student_gpa(999));
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Expected Error: ' || SQLERRM); END;
/

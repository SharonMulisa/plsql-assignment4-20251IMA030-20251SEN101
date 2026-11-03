CREATE OR REPLACE FUNCTION get_student_gpa(p_student_id IN NUMBER)
RETURN NUMBER IS
  v_avg NUMBER;
BEGIN
  SELECT AVG(grade) INTO v_avg FROM enrollments WHERE student_id = p_student_id;
  IF v_avg IS NULL THEN
    RAISE NO_DATA_FOUND;
  END IF;
  RETURN ROUND(v_avg, 2);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20003, 'No grades found for student ID: ' || p_student_id);
  WHEN TOO_MANY_ROWS THEN
    RAISE_APPLICATION_ERROR(-20004, 'Too many rows error');
END;
/

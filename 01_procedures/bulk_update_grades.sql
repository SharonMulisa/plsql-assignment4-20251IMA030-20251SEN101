CREATE OR REPLACE PROCEDURE bulk_update_grades IS
  TYPE t_ids IS TABLE OF enrollments.enrollment_id%TYPE;
  TYPE t_grades IS TABLE OF enrollments.grade%TYPE;
  v_ids t_ids;
  v_grades t_grades;
BEGIN
  SELECT enrollment_id, grade + 5
  BULK COLLECT INTO v_ids, v_grades
  FROM enrollments WHERE grade < 50;

  IF v_ids.COUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No failing grades to update');
    RETURN;
  END IF;

  FORALL i IN 1..v_ids.COUNT SAVE EXCEPTIONS
    UPDATE enrollments SET grade = v_grades(i)
    WHERE enrollment_id = v_ids(i);

  DBMS_OUTPUT.PUT_LINE('Bulk updated: ' || SQL%ROWCOUNT || ' rows');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Bulk Error: ' || SQLERRM);
END;
/

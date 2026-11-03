CREATE OR REPLACE PROCEDURE print_all_students IS
  CURSOR c_students IS SELECT student_id, full_name, program FROM students;
  v_rec c_students%ROWTYPE;
BEGIN
  OPEN c_students;
  LOOP
    FETCH c_students INTO v_rec;
    EXIT WHEN c_students%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_rec.student_id || ' - ' || v_rec.full_name || ' - ' || v_rec.program);
  END LOOP;
  CLOSE c_students;
EXCEPTION
  WHEN OTHERS THEN
    IF c_students%ISOPEN THEN CLOSE c_students; END IF;
    RAISE;
END;
/

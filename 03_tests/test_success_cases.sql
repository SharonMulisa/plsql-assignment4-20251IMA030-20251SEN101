SET SERVEROUTPUT ON;
DECLARE
  v_rows NUMBER;
BEGIN
  enroll_student(2, 102, v_rows);
  print_all_students;
  DBMS_OUTPUT.PUT_LINE('GPA for student 1: ' || get_student_gpa(1));
  DBMS_OUTPUT.PUT_LINE('Letter for 85: ' || get_grade_letter(85));
  bulk_update_grades;
END;
/

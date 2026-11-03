# Implementation Notes
Records: Used %ROWTYPE (enrollments%ROWTYPE) and user-defined RECORD (student_rec).
Collections: Nested Table / Associative Array for BULK COLLECT.
Implicit Cursor: SQL%ROWCOUNT, SQL%FOUND used in enroll_student.
Explicit Cursor: OPEN, FETCH, CLOSE with %NOTFOUND in print_all_students.
Bulk Processing: BULK COLLECT fetches all failing grades at once, FORALL updates them in one trip.
This is faster than row-by-row loop because it reduces context switches between SQL and PL/SQL.
Exception Handling: NO_DATA_FOUND, TOO_MANY_ROWS, DUP_VAL_ON_INDEX, user-defined via RAISE_APPLICATION_ERROR, SAVE EXCEPTIONS for bulk.

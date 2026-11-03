INSERT INTO students VALUES (1, 'Sharon Mulisa', 'sharon@test.com', 'INSY');
INSERT INTO students VALUES (2, 'Kevin Nkurunziza', 'kevin@test.com', 'INSY');
INSERT INTO students VALUES (3, 'Aline Uwase', 'aline@test.com', 'MA');
INSERT INTO students VALUES (4, 'Eric Maniraguha', 'eric@test.com', 'INSY');
INSERT INTO students VALUES (5, 'Grace Keza', 'grace@test.com', 'SEN');

INSERT INTO courses VALUES (101, 'PL/SQL Programming', 3);
INSERT INTO courses VALUES (102, 'Networking', 3);
INSERT INTO courses VALUES (103, 'Database Systems', 3);

INSERT INTO enrollments VALUES (1, 1, 101, 85);
INSERT INTO enrollments VALUES (2, 1, 102, 72);
INSERT INTO enrollments VALUES (3, 2, 101, 45);
INSERT INTO enrollments VALUES (4, 3, 103, 90);
INSERT INTO enrollments VALUES (5, 4, 101, 60);
COMMIT;

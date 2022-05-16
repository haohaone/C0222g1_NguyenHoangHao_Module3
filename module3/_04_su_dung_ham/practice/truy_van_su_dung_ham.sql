USE quan_ly_sinh_vienl;

SELECT address, count(id_student) FROM student
GROUP BY address;

SELECT s.id_student, s.name_student, AVG(m.mark) FROM student s 
JOIN mark m  ON s.id_student = m.id_student
GROUP BY s.id_student;
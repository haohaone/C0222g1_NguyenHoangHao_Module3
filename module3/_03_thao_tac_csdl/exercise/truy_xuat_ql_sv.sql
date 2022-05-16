USE quan_ly_sinh_vien;

SELECT * FROM student
WHERE student.name_student LIKE 'h%';

SELECT * FROM class
WHERE class.start_date HAVING month(class.start_date) = 12;

SELECT * FROM `subject`
WHERE credit BETWEEN 3 AND 5;

SET SQL_SAFE_UPDATES = 0;
UPDATE student SET id_class = 2
WHERE name_student = 'Hung'; 

SELECT student.name_student, `subject`.name_sub, mark FROM mark
JOIN student ON student.id_student = mark.id_student
JOIN `subject` ON `subject`.id_sub = mark.id_sub
ORDER BY mark DESC , name_sub ASC

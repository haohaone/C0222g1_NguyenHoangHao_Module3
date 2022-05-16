USE quan_ly_sinh_vien;

SELECT * FROM student;
 
SELECT * FROM student WHERE `status` = true;
  
SELECT * FROM `subject` WHERE credit < 10;  

SELECT student.id_student, student.name_student, class.name_class FROM student
JOIN class ON student.id_class = class.id_class;

SELECT student.id_student, student.name_student, class.name_class FROM student
JOIN class ON student.id_class = class.id_class
WHERE class.name_class = 'A2';

SELECT student.id_student, student.name_student, `subject`.name_sub, mark.mark FROM student
JOIN mark ON mark.id_mark = student.id_student JOIN `subject` ON mark.id_sub = `subject`.id_sub;

SELECT student.id_student, student.name_student, `subject`.name_sub, mark.mark FROM student
JOIN mark ON mark.id_mark = student.id_student JOIN `subject` ON mark.id_sub = `subject`.id_sub
WHERE `subject`.name_sub = 'CF';
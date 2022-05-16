USE quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT id_sub, name_sub, max(credit) as credit, `status` FROM `subject`;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT id_mark, id_sub, id_student, avg(mark) as max_avg_mark FROM mark
GROUP BY id_mark
HAVING avg(mark) >= ALL (SELECT avg(mark) FROM mark GROUP BY mark.id_student);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.id_student, s.name_student, s.address, s.phone, s.`status`, AVG(m.mark) as avg_mark FROM student s 
JOIN mark m  ON s.id_student = m.id_student
GROUP BY s.id_student
ORDER BY avg_mark;

INSERT INTO class (name_class, start_date, `status`)
VALUE ('A1', '2008-12-20', 1);
INSERT INTO class (name_class, start_date, `status`)
VALUE ('A2', '2008-12-20', 1);
INSERT INTO class (name_class, start_date, `status`)
VALUE ('A3', current_date, 0);

INSERT INTO student (name_student, address, phone, `status`, id_class)
VALUE ('Hung', 'Ha Noi', '091212121', 1, 1);
INSERT INTO student (name_student, address, `status`, id_class)
VALUE ('Hoa', 'Hai Phong', 1, 1);
INSERT INTO student (name_student, address, phone, `status`, id_class)
VALUE ('Manh', 'HCM', '012331121', 0, 2);

INSERT INTO `subject` (name_sub, credit, `status`)
VALUE ('CF', 5, 1);
INSERT INTO `subject` (name_sub, credit, `status`)
VALUE ('C', 6, 1);
INSERT INTO `subject` (name_sub, credit, `status`)
VALUE ('HDJ', 5, 1);
INSERT INTO `subject` (name_sub, credit, `status`)
VALUE ('RDBMS', 10, 1);

INSERT INTO mark (id_sub, id_student, mark)
VALUES (1, 1, 8),
       (2, 2, 10),
       (3, 3, 12);
USE quan_ly_furama;

INSERT INTO loai_dich_vu
VALUE (1, 'Villa'),
	  (2, 'House'),
	  (3, 'Room');
      
INSERT INTO kieu_thue
VALUE (1, 'Day'),
	  (2, 'Month'),
	  (3, 'Year'),
	  (4, 'Hour');
      
INSERT INTO dich_vu
VALUE (1, 'Villa Beach Front', 500, 5000, 19, 2, 1, 'Vip', 'Full Serveice', 50, 2),
	  (2, 'House Princess 01', 200, 500, 8, 1, 2, 'Normal', 'Service combo 2', 30, NULL),
	  (3, 'Room Twin 01', 40, 4000, 3, 3, 3, NULL, NULL, NULL, NULL);
      
INSERT INTO loai_khach
VALUE (1, 'Diamonmd'),
	  (2, 'Platinium'),
	  (3, 'Gold'),
	  (4, 'Silver'),
	  (5, 'Member');
      
INSERT INTO khach_hang
VALUE (1, 1, 'Nguyễn Hoàng Hảo', '1999-07-08', 1, '201787802', '0976709502', 'hoanghao9x87@gmail.com', 'Đà Nẵng'),
	  (2, 1, 'Nguyễn Thảo Uyên', '1999-08-13', 0, '123456121', '0971234008', 'thaouyen99@gmail.com', 'Đà Nẵng'),
	  (3, 1, 'Hồ Văn Chung', '2000-08-13', 1, '340975611', '0978123087', 'vanchung2000@gmail.com', 'Quảng Trị'),
	  (4, 2, 'Nguyễn Duy Trung', '2003-07-18', 1, '12377889', '0906123671', 'duytrung2003@gmail.com', 'Quảng Nam'),
	  (5, 4, 'Nguyễn Tiến Đạt', '1999-12-12', 1, '123009213', '0912312361', 'tiendat199@gmail.com', 'Quảng Trị');
      
INSERT INTO vi_tri
VALUE (1, 'Lễ Tân'),
	  (2, 'Phục Vụ'),
	  (3, 'Chuyên Viên'),
	  (4, 'Giám Sát'),
	  (5, 'Quản lý'),     
	  (6, 'Giám Đôc');
      
INSERT INTO trinh_do
VALUE (1, 'Trung Cấp'),
	  (2, 'Cao Đẳng'),
	  (3, 'Đại Học'),
	  (4, 'Sau Đại Học');
      
INSERT INTO bo_phan
VALUE (1, 'Sale - Marketing'),
	  (2, 'Hành Chính'),
	  (3, 'Phục Vụ'),
	  (4, 'Quản Lý');
      
INSERT INTO nhan_vien
VALUE (1, 'Nguyễn Trung Kiên', '1999-04-04', 90234113, 400, '0976709502', 'trungkien1990@gmail.com', 'Tam Kỳ', 3, 3, 2),
	  (2, 'Trần Mạnh Cường', '1996-08-13', 123123076,800, '0971234008', 'manhcuong1996@gmail.com', 'Quảng Bình', 4, 4, 5),
	  (3, 'Trần Hồ Quốc Trung', '1999-07-07', 78900456, 500, '0978123087', 'quoctrung1999@gmail.com', 'Đà Nẵng', 1, 2, 3);
      
INSERT INTO dich_vu_dinh_kem
VALUE (1, 'Karaoke', 20, 'Sao Mai Karaoke', 'Open'),
	  (2, 'Massage', 15, 'Trung Tâm Masage Người Mù', 'Open'),
	  (3, 'Xe Du Lịch', 30, 'Mai Linh', 'Open');
      
INSERT INTO hop_dong
VALUE (1, '2022-05-14 00:00:00', '2022-05-20 00:00:00', 300, 1, 1, 1),
	  (2, '2022-05-18 00:00:00', '2022-06-20 00:00:00', 200, 2, 2, 2),
	  (3, '2022-05-16 00:00:00', '2023-05-16 00:00:00', 500, 3, 3, 3),
	  (4, '2022-05-16 00:00:00', '2023-05-16 00:00:00', 500, 1, 1, 3),
	  (5, '2022-05-16 00:00:00', '2023-05-16 00:00:00', 500, 2, 3, 2),
	  (6, '2022-05-16 00:00:00', '2023-05-16 00:00:00', 500, 3, 3, 1);
      
INSERT INTO hop_dong_chi_tiet
VALUE (1, 1, 1, 10),
	  (2, 2, 2, 30),
	  (3, 3, 3, 25);
      
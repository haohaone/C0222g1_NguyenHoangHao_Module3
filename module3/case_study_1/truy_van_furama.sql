USE quan_ly_furama;

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
 
SELECT * FROM khach_hang 
WHERE khach_hang.ngay_sinh HAVING (timestampdiff(year, khach_hang.ngay_sinh, current_date()) BETWEEN 18 AND 50)
AND (khach_hang.dia_chi = 'Đà Nẵng' OR khach_hang.dia_chi = 'Quảng Trị');

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT * FROM khach_hang
WHERE length(khach_hang.ho_ten) > 15
HAVING (reverse(substring(reverse(khach_hang.ho_ten), 1, instr(reverse(khach_hang.ho_ten),' '))) LIKE ' H%'
 OR reverse(substring(reverse(khach_hang.ho_ten), 1, instr(reverse(khach_hang.ho_ten),' '))) LIKE ' T%'
 OR reverse(substring(reverse(khach_hang.ho_ten), 1, instr(reverse(khach_hang.ho_ten),' '))) LIKE ' U%');

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu
-- lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
-- khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là
-- “Diamond”.

SELECT `khach_hang`.ma_khach_hang, `loai_khach`.loai_khach_hang, `khach_hang`.ho_ten, `khach_hang`.ngay_sinh, count(`khach_hang`.ma_khach_hang) AS so_lan_da_thue 
FROM khach_hang
JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach ON `loai_khach`.ma_loai_khach = `khach_hang`.ma_loai_khach
WHERE `loai_khach`.loai_khach_hang = 'Diamonmd'
GROUP BY `khach_hang`.ma_khach_hang ORDER BY so_lan_da_thue;

-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
-- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với
-- tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng *
-- Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những
-- khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT kh.ma_khach_hang,
 kh.ho_ten,
 lk.loai_khach_hang,
 hd.ma_hop_dong,
 dv.ten_dich_vu,
 hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc,
 dv.chi_phi_thue + (hdct.so_luong * dvdk.gia) as tong_tien FROM hop_dong_chi_tiet AS hdct
 JOIN dich_vu_dinh_kem AS dvdk ON dvdk.ma_dich_vu_dinh_kem = hdct.ma_dich_vu_dinh_kem
 JOIN hop_dong AS hd ON hdct.ma_hop_dong = hd.ma_hop_dong
 JOIN dich_vu AS dv ON dv.ma_dich_vu = hd.ma_dich_vu
 RIGHT JOIN khach_hang AS kh ON kh.ma_khach_hang = hd.ma_hop_dong
 JOIN loai_khach AS lk ON lk.ma_loai_khach = kh.ma_khach_hang;
 
-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue FROM dich_vu AS dv
WHERE dv.ma_dich_vu NOT IN 
(SELECT hop_dong.ma_dich_vu FROM hop_dong WHERE year(hop_dong.ngay_lam_hop_dong) = 2021 AND quarter(hop_dong.ngay_lam_hop_dong) = 1);

-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich,
-- so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại
-- dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng
-- chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT * FROM dich_vu AS dv
WHERE (dv.ma_dich_vu IN (SELECT hd.ma_dich_vu FROM hop_dong AS hd WHERE year(hd.ngay_lam_hop_dong) = 2020)) 
AND (dv.ma_dich_vu NOT IN (SELECT hd.ma_dich_vu FROM hop_dong AS hd WHERE year(hd.ngay_lam_hop_dong) = 2021));

-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu
-- ho_ten không trùng nhau.

SELECT * FROM khach_hang 
GROUP BY khach_hang.ho_ten;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi
-- tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt
-- phòng.

SELECT quarter(hd.ngay_lam_hop_dong) AS quy,
hd.ngay_lam_hop_dong,
count(hd.ma_khach_hang) AS so_lan_thue,
sum(dv.chi_phi_thue) AS doanh_thu 
FROM hop_dong AS hd
JOIN khach_hang AS kh ON kh.ma_khach_hang = hd.ma_hop_dong
JOIN dich_vu AS dv ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY hd.ma_khach_hang
ORDER BY hd.ngay_lam_hop_dong;

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
-- dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem).

SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, count(dvdk.ma_dich_vu_dinh_kem) AS so_luong FROM hop_dong hd
JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
JOIN dich_vu_dinh_kem dvdk ON dvdk.ma_dich_vu_dinh_kem = hdct.ma_dich_vu_dinh_kem
GROUP BY dvdk.ma_dich_vu_dinh_kem;

-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách
-- hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc
-- “Quảng Ngãi”.

SELECT dvdk.ma_dich_vu_dinh_kem, dvdk.ten_dich_vu_dinh_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai, kh.ho_ten, lk.loai_khach_hang, kh.dia_chi FROM dich_vu_dinh_kem dvdk
JOIN hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_dinh_kem = dvdk.ma_dich_vu_dinh_kem
JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
JOIN khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach 
WHERE lk.loai_khach_hang = 'Diamonmd' AND (kh.dia_chi = 'Đà Nẵng' OR kh.dia_chi = 'Quảng Trị');
-- uyenngu.com

-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách
-- hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được
-- khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được
-- khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT hd.ma_hop_dong, nv.ho_ten AS ho_vien_nhan_vien, kh.ho_ten AS ho_ten_khach_hang, kh.so_dien_thoai, dv.ten_dich_vu, count(hdct.ma_dich_vu_dinh_kem) AS so_luong_dvdk, hd.tien_dat_coc
FROM hop_dong_chi_tiet hdct 
JOIN dich_vu_dinh_kem AS dvdk ON dvdk.ma_dich_vu_dinh_kem = hdct.ma_dich_vu_dinh_kem
JOIN hop_dong AS hd ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu AS dv ON dv.ma_dich_vu = hd.ma_hop_dong
JOIN khach_hang AS kh ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN nhan_vien AS nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE hd.ma_dich_vu NOT IN (SELECT ma_dich_vu FROM hop_dong WHERE year(ngay_lam_hop_dong) = 2020 AND quarter(ngay_lam_hop_dong) = 4)
AND hd.ma_dich_vu NOT IN (SELECT ma_dich_vu FROM hop_dong WHERE year(ngay_lam_hop_dong) = 2021 AND quarter(ngay_lam_hop_dong) in (1,2))
GROUP BY hdct.ma_dich_vu_dinh_kem;

-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử
-- dụng nhiều như nhau).

SELECT dvdk.ma_dich_vu_dinh_kem, dvdk.ten_dich_vu_dinh_kem, dvdk.gia, sum(hdct.so_luong)AS so_luong_su_dung_nhieu_nhat, hd.ma_hop_dong 
FROM hop_dong_chi_tiet hdct 
JOIN dich_vu_dinh_kem AS dvdk ON dvdk.ma_dich_vu_dinh_kem = hdct.ma_dich_vu_dinh_kem
JOIN hop_dong AS hd ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY dvdk.ma_dich_vu_dinh_kem
HAVING so_luong_su_dung_nhieu_nhat = (SELECT sum(hdct.so_luong) AS so_luong FROM hop_dong_chi_tiet AS hdct GROUP BY ma_dich_vu_dinh_kem ORDER BY so_luong DESC LIMIT 1);

-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một
-- lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính
-- dựa trên việc count các ma_dich_vu_di_kem).

SELECT hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_dinh_kem, dvdk.gia, count(dvdk.ma_dich_vu_dinh_kem)AS so_luong_su_dung_nhieu_nhat 
FROM hop_dong_chi_tiet hdct 
JOIN dich_vu_dinh_kem AS dvdk ON dvdk.ma_dich_vu_dinh_kem = hdct.ma_dich_vu_dinh_kem
JOIN hop_dong AS hd ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu AS dv ON dv.ma_dich_vu = hd.ma_hop_dong
JOIN loai_dich_vu AS ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
GROUP BY dvdk.ma_dich_vu_dinh_kem HAVING count(dvdk.ma_dich_vu_dinh_kem) = 1;

-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được
-- tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(nv.ma_nhan_vien) AS so_lan_lap_hop_dong FROM hop_dong hd
JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
JOIN bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
WHERE year(hd.ngay_lam_hop_dong) IN (2020, 2021)
GROUP BY hd.ma_nhan_vien 
HAVING so_lan_lap_hop_dong <= 3;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019
-- đến năm 2021. 

SET SQL_SAFE_UPDATES = 0;
DELETE FROM nhan_vien 
WHERE nhan_vien.ma_nhan_vien NOT IN  (SELECT ma_nhan_vien FROM hop_dong WHERE year(ngay_lam_hop_dong) BETWEEN 2019 AND 2021 );

-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum
-- lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ

UPDATE khach_hang 
SET ma_loai_khach = 1 
WHERE ma_loai_khach = 2 
AND ma_khach_hang IN 
(SELECT hd.ma_khach_hang FROM hop_dong  AS hd
 JOIN hop_dong_chi_tiet AS hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
 JOIN dich_vu_dinh_kem AS dvdk ON dvdk.ma_dich_vu_dinh_kem = hdct.ma_dich_vu_dinh_kem
 JOIN dich_vu AS dv ON dv.ma_dich_vu = hd.ma_dich_vu
 WHERE year(ngay_lam_hop_dong) = 2021
 GROUP BY hd.ma_khach_hang
 HAVING sum(dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) > 3500);
 
-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc
-- giữa các bảng).
 
CREATE VIEW khach_hang_truoc_nam_2021 AS
SELECT ma_khach_hang FROM hop_dong 
WHERE year(ngay_lam_hop_dong) < 2021  GROUP BY ma_khach_hang;

UPDATE hop_dong_chi_tiet
SET ma_hop_dong = NULL
WHERE ma_hop_dong IN (SELECT ma_hop_dong FROM hop_dong WHERE ma_khach_hang IN (SELECT * FROM khach_hang_truoc_nam_2021));
 
UPDATE hop_dong
SET ma_khach_hang = NULL
WHERE ma_khach_hang IN (SELECT * FROM khach_hang_truoc_nam_2021);

DELETE FROM khach_hang
WHERE ma_khach_hang IN (SELECT * FROM khach_hang_truoc_nam_2021);

-- 19. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong
-- năm 2020 lên gấp đôi.

UPDATE dich_vu_dinh_kem
SET gia = gia * 2
WHERE ma_dich_vu_dinh_kem IN 
(SELECT ma_dich_vu_dinh_kem FROM hop_dong_chi_tiet
GROUP BY ma_dich_vu_dinh_kem HAVING count(ma_hop_dong_chi_tiet) >= 3);

-- 20. Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ
-- thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang),
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT ma_nhan_vien AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi FROM nhan_vien
UNION
SELECT ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi FROM khach_hang;

-- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả
-- các nhân viên có địa chỉ là “Quảng Bình” và đã từng lập hợp đồng cho một
-- hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “2020”.

CREATE VIEW task_21 AS
SELECT * FROM nhan_vien 
WHERE dia_chi = 'Quảng Bình' AND ma_nhan_vien IN 
(SELECT ma_nhan_vien FROM hop_dong WHERE year(ngay_lam_hop_dong) = 2020);

SELECT * FROM task_21;

-- 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành
-- “Đà Nẵng” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn
-- này.

UPDATE task_21
SET dia_chi = 'Đà Nẵng'

-- 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của
-- một khách hàng nào đó với ma_khach_hang được truyền vào như là 1
-- tham số của sp_xoa_khach_hang.

DELIMITER \\
CREATE PROCEDURE delete_khach_hang_by_id(IN set_id INT)
BEGIN
	UPDATE hop_dong_chi_tiet
	SET ma_hop_dong = NULL
	WHERE ma_hop_dong IN 
    (SELECT ma_hop_dong FROM hop_dong 
    WHERE ma_khach_hang = set_id
    );
 
	UPDATE hop_dong
	SET ma_khach_hang = NULL
	WHERE ma_khach_hang = set_id;

	DELETE FROM khach_hang
	WHERE ma_khach_hang = set_id;
END\\
DELIMITER ;

CALL delete_khach_hang_by_id(1);

-- 24. Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào
-- bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện
-- kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được
-- trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên
-- quan.

CREATE PROCEDURE delete_khach_hang_by_id(IN set_id INT)
BEGIN
	INSERT INTO hop_dong
END\\
DELIMITER ;
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

SELECT kh.ma_khach_hang, lk.ma_loai_khach, kh.ho_ten, kh.ngay_sinh, kh.dia_chi FROM khach_hang kh
JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE kh.dia_chi = 'Quảng Nam' OR kh.dia_chi = 'Quảng Trị'
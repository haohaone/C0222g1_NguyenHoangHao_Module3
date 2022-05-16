USE quan_ly_furama;

SELECT * FROM khach_hang 
WHERE khach_hang.ngay_sinh HAVING (timestampdiff(year, khach_hang.ngay_sinh, current_date()) BETWEEN 18 AND 50)
AND (khach_hang.dia_chi = 'Đà Nẵng' OR khach_hang.dia_chi = 'Quảng Trị');

-- SELECT ma_khach_hang, ngay_sinh, reverse(substring(reverse(khach_hang.ho_ten), 1, instr(reverse(khach_hang.ho_ten),' '))) AS ten
-- FROM khach_hang
-- HAVING ten LIKE 'H%';

-- SELECT * FROM khach_hang
-- WHERE reverse(substring(reverse(khach_hang.ho_ten), 1, instr(reverse(khach_hang.ho_ten),' '))) LIKE 'h%';

-- CREATE FUNCTION dem_chuoi(chuoi VARCHAR(50)) RETURNS INT 
-- BEGIN
-- 	DECLARE so_ky_tu INT;
--     SET so_ky_tu = char_length(chuoi)
--     RETURN so_ky_tu
-- END;
-- count(hop_dong.ma_hop_dong) AS so_lan_thue 

SELECT * FROM khach_hang 
WHERE ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%' AND length(ho_ten) > 20;

SELECT `khach_hang`.ma_khach_hang, `loai_khach`.loai_khach_hang, `khach_hang`.ho_ten, `khach_hang`.ngay_sinh, count(`khach_hang`.ma_khach_hang) AS so_lan_da_thue 
FROM khach_hang
JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach ON `loai_khach`.ma_loai_khach = `khach_hang`.ma_loai_khach
WHERE `loai_khach`.loai_khach_hang = 'Diamonmd'
GROUP BY `khach_hang`.ma_khach_hang ORDER BY so_lan_da_thue


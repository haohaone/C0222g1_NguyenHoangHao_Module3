CREATE DATABASE quan_ly_furama;

USE quan_ly_furama;

CREATE TABLE loai_dich_vu(
	ma_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50)
);

CREATE TABLE kieu_thue(
	ma_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(50)
);

CREATE TABLE dich_vu(
	ma_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    so_tang INT,
    dien_tich_ho_boi DOUBLE,
    CONSTRAINT fk_ma_kieu_thue_dv FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    CONSTRAINT fk_ma_loai_dich_vu FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE loai_khach(
	ma_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    loai_khach_hang VARCHAR(50)
);

CREATE TABLE khach_hang(
	ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ma_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    CONSTRAINT fk_ma_loai_khach FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE vi_tri(
	ma_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do(
	ma_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan(
	ma_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhan_vien(
	ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
	so_dien_thoai VARCHAR(45),
	email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_bo_phan INT,
    ma_trinh_do INT,
    ma_vi_tri INT,
    CONSTRAINT fk_ma_bo_phan FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan),
    CONSTRAINT fk_ma_trinh_do FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    CONSTRAINT fk_ma_vi_tri FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri)
);

CREATE TABLE dich_vu_dinh_kem(
	ma_dich_vu_dinh_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_dinh_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(45),
    trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong(
	ma_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    CONSTRAINT fk_ma_nhan_vien FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    CONSTRAINT fk_ma_khach_hang FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    CONSTRAINT fk_ma_dich_vu FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    ma_hop_dong INT,
    ma_dich_vu_dinh_kem INT,
    so_luong INT,
	CONSTRAINT fk_ma_hop_dong FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    CONSTRAINT fk_ma_dich_vu_dinh_kem FOREIGN KEY (ma_dich_vu_dinh_kem) REFERENCES dich_vu_dinh_kem(ma_dich_vu_dinh_kem)
);
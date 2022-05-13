CREATE DATABASE quan_ly_xuat_nhap_khau;

USE quan_ly_xuat_nhap_khau;

CREATE TABLE quan_ly_ncc (
    ma_ncc VARCHAR(20) PRIMARY KEY,
    ten_ncc VARCHAR(50) NOT NULL,
    dia_chi_ncc VARCHAR(100) NOT NULL
);

CREATE TABLE sdt_ncc(
	sdt_ban VARCHAR(20),
    sdt_dt VARCHAR(20),
    ma_ncc VARCHAR(20) PRIMARY KEY,
    CONSTRAINT fk_ma_ncc_sdt FOREIGN KEY (ma_ncc) REFERENCES quan_ly_ncc (ma_ncc)
);

CREATE TABLE vat_tu(
	ma_vat_tu VARCHAR(20) PRIMARY KEY,
    ten_vat_tu VARCHAR(50) NOT NULL
);

CREATE TABLE chi_tiet_don_dh(
	so_dh INT AUTO_INCREMENT PRIMARY KEY,
    ngay_dh DATE NOT NULL,
    ma_ncc VARCHAR(50),
	CONSTRAINT fk_ma_ncc FOREIGN KEY (ma_ncc) REFERENCES quan_ly_ncc (ma_ncc)
);

CREATE TABLE don_dat_hang_vat_tu(
	so_don_dh_vt INT AUTO_INCREMENT PRIMARY KEY,
    so_dh INT,
    ma_vat_tu VARCHAR(20),
    CONSTRAINT fk_don_dh FOREIGN KEY (so_dh) REFERENCES chi_tiet_don_dh (so_dh),
    CONSTRAINT fk_don_vt FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_xuat(
	so_px INT AUTO_INCREMENT PRIMARY KEY,
    ngay_xuat DATE
);

CREATE TABLE chi_tiet_xk(
	dg_xuat INT,
    sl_xuat INT,
    so_px INT,
    ma_vat_tu VARCHAR(20),
    PRIMARY KEY (so_px, ma_vat_tu),
    CONSTRAINT fk_so_px FOREIGN KEY (so_px) REFERENCES phieu_xuat (so_px),
    CONSTRAINT fk_ma_vat_tu_xk FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap(
	so_pn INT AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_nk(
	dg_nhap INT,
    sl_nhap INT,
    so_pn INT,
    ma_vat_tu VARCHAR(20),
    PRIMARY KEY (so_pn, ma_vat_tu),
    CONSTRAINT fk_so_pn FOREIGN KEY (so_pn) REFERENCES phieu_nhap (so_pn),
    CONSTRAINT fk_ma_vat_tu_nk FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);
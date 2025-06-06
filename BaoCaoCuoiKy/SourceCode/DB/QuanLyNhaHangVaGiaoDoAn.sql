CREATE DATABASE IF NOT EXISTS QuanLyNhaHang;
USE QuanLyNhaHang;

-- Tài khoản người dùng
CREATE TABLE TaiKhoanNguoiDung (
    ma_tai_khoan INT AUTO_INCREMENT PRIMARY KEY,
    ten_dang_nhap VARCHAR(50) NOT NULL UNIQUE,
    mat_khau VARCHAR(255) NOT NULL,
    vai_tro ENUM('quan_tri', 'nhan_vien', 'khach_hang') NOT NULL DEFAULT 'nhan_vien'
);

-- Nhân viên
CREATE TABLE NhanVien (
    ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ma_tai_khoan INT NOT NULL,
    ho_ten VARCHAR(100) NOT NULL,
    chuc_vu VARCHAR(50),
    ngay_vao_lam DATE,
    luong DECIMAL(12,2),
    FOREIGN KEY (ma_tai_khoan) REFERENCES TaiKhoanNguoiDung(ma_tai_khoan)
);

-- Khách hàng
CREATE TABLE KhachHang (
    ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ma_tai_khoan INT NOT NULL,
    ho_ten VARCHAR(100) NOT NULL,
    so_dien_thoai VARCHAR(20),
    dia_chi VARCHAR(255),
    FOREIGN KEY (ma_tai_khoan) REFERENCES TaiKhoanNguoiDung(ma_tai_khoan)
);

-- Nhà cung cấp
CREATE TABLE NhaCungCap (
    ma_ncc INT AUTO_INCREMENT PRIMARY KEY,
    ten_ncc VARCHAR(100) NOT NULL,
    dia_chi VARCHAR(255),
    so_dien_thoai VARCHAR(20)
);

-- Kho hàng
CREATE TABLE KhoHang (
    ma_hang INT AUTO_INCREMENT PRIMARY KEY,
    ten_hang VARCHAR(100) NOT NULL,
    so_luong INT NOT NULL,
    don_vi VARCHAR(20)
);

-- Phiếu nhập hàng
CREATE TABLE PhieuNhap (
    ma_phieu_nhap INT AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE NOT NULL,
    ma_nhan_vien INT NOT NULL,
    ma_ncc INT NOT NULL,
    tong_tien DECIMAL(14,2),
    FOREIGN KEY (ma_nhan_vien) REFERENCES NhanVien(ma_nhan_vien),
    FOREIGN KEY (ma_ncc) REFERENCES NhaCungCap(ma_ncc)
);

-- Chi tiết phiếu nhập
CREATE TABLE ChiTietPhieuNhap (
    ma_ctpn INT AUTO_INCREMENT PRIMARY KEY,
    ma_phieu_nhap INT NOT NULL,
    ma_hang INT NOT NULL,
    so_luong INT NOT NULL,
    don_gia DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (ma_phieu_nhap) REFERENCES PhieuNhap(ma_phieu_nhap),
    FOREIGN KEY (ma_hang) REFERENCES KhoHang(ma_hang)
);

-- Thu chi
CREATE TABLE ThuChi (
    ma_thu_chi INT AUTO_INCREMENT PRIMARY KEY,
    ngay DATE NOT NULL,
    loai ENUM('thu', 'chi') NOT NULL,
    so_tien DECIMAL(14,2) NOT NULL,
    mo_ta VARCHAR(255)
);
-- 1. Tài khoản người dùng
INSERT INTO TaiKhoanNguoiDung (ten_dang_nhap, mat_khau, vai_tro)
VALUES 
('admin1', 'matkhau_admin', 'quan_tri'),
('nhanvien1', 'matkhau_nv1', 'nhan_vien'),
('nhanvien2', 'matkhau_nv2', 'nhan_vien'),
('khachhang1', 'matkhau_kh1', 'khach_hang'),
('khachhang2', 'matkhau_kh2', 'khach_hang');

-- 2. Nhân viên
INSERT INTO NhanVien (ma_tai_khoan, ho_ten, chuc_vu, ngay_vao_lam, luong)
VALUES
(1, 'Nguyễn Văn A', 'Thu ngân', '2022-01-10', 8000000),
(2, 'Trần Thị B', 'Quản lý kho', '2021-12-01', 9500000);

-- 3. Khách hàng
INSERT INTO KhachHang (ma_tai_khoan, ho_ten, so_dien_thoai, dia_chi)
VALUES
(1, 'Phạm Văn C', '0912345678', '123 Đường ABC, Hà Nội'),
(2, 'Lê Thị D', '0987654321', '456 Đường XYZ, Hà Nội');

-- 4. Nhà cung cấp
INSERT INTO NhaCungCap (ten_ncc, dia_chi, so_dien_thoai)
VALUES
('NCC A', 'KCN Thăng Long, Hà Nội', '0901122334'),
('NCC B', 'Đông Anh, Hà Nội', '0911223344');

-- 5. Kho hàng
INSERT INTO KhoHang (ten_hang, so_luong, don_vi)
VALUES
('Thịt heo', 100, 'kg'),
('Rau cải xanh', 50, 'kg'),
('Gạo ST25', 200, 'kg');

-- 6. Phiếu nhập
INSERT INTO PhieuNhap (ngay_nhap, ma_nhan_vien, ma_ncc, tong_tien)
VALUES
('2024-06-01', 1, 1, 500000),
('2024-06-02', 2, 2, 300000);

-- 7. Chi tiết phiếu nhập
INSERT INTO ChiTietPhieuNhap (ma_phieu_nhap, ma_hang, so_luong, don_gia)
VALUES
(1, 1, 50, 80000),     -- 50kg thịt heo x 80.000 = 4.000.000
(1, 2, 100, 10000),    -- 100kg gạo ST25 x 10.000 = 1.000.000
(2, 2, 50, 6000);      -- 50kg rau cải xanh x 6.000 = 300.000

-- 8. Thu chi
INSERT INTO ThuChi (ngay, loai, so_tien, mo_ta)
VALUES
('2024-06-01', 'chi', 500000, 'Nhập hàng từ NCC A'),
('2024-06-02', 'chi', 300000, 'Nhập rau từ NCC B'),
('2024-06-03', 'thu', 1200000, 'Khách thanh toán hóa đơn'),
('2024-06-04', 'chi', 8000000, 'Trả lương tháng 5 cho Nguyễn Văn A');

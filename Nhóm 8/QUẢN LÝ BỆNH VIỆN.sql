CREATE DATABASE QLBV
GO
USE QLBV
-- TẠO BẢNG NHÂN VIÊN 
CREATE TABLE NHANVIEN (
MaNV INT PRIMARY KEY,
TenNhanVien NVARCHAR(100))
-- TẠO BẢNG KHU CHỮA TRỊ 
CREATE TABLE KHUCHUATRI (
    SoKhuChuaTri INT PRIMARY KEY,
    TenKhuChuaTri NVARCHAR(100),
    MaYTaTruong INT,
    CONSTRAINT FK_KhuChuaTri_YTaTruong FOREIGN KEY (MaYTaTruong) REFERENCES NHANVIEN(MaNV))
-- TẠO BẢNG NHÂN VIÊN - KHU CHỮA TRỊ 
CREATE TABLE NHANVIEN_KHUCHUATRI (
    SoKhuChuaTri INT,
    MaNV INT,
    SoGioLamViec INT,
    PRIMARY KEY (SoKhuChuaTri, MaNV),
    CONSTRAINT FK_NVKCT_KhuChuaTri FOREIGN KEY (SoKhuChuaTri) REFERENCES KHUCHUATRI(SoKhuChuaTri),
    CONSTRAINT FK_NVKCT_NhanVien FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV))
-- TẠO BẢNG BÁC SĨ 
CREATE TABLE BACSI (
MaBacSi INT PRIMARY KEY,
TenBacSi NVARCHAR(100))
-- TẠO BẢNG KHU CHỮA TRỊ - BÁC SĨ 
CREATE TABLE KHUCHUATRI_BACSI (
    SoKhuChuaTri INT,
    MaBacSi INT,
    PRIMARY KEY (SoKhuChuaTri, MaBacSi),
    CONSTRAINT FK_KCTBS_KhuChuaTri FOREIGN KEY (SoKhuChuaTri) REFERENCES KHUCHUATRI(SoKhuChuaTri),
    CONSTRAINT FK_KCTBS_BacSi FOREIGN KEY (MaBacSi) REFERENCES BACSI(MaBacSi))
-- TẠO BẢNG GIƯỜNG 
CREATE TABLE GIUONG (
    SoGiuong INT PRIMARY KEY,
    SoPhong INT,
    SoKhuChuaTri INT,
    CONSTRAINT FK_Giuong_KhuChuaTri FOREIGN KEY (SoKhuChuaTri) REFERENCES KHUCHUATRI(SoKhuChuaTri))
-- TẠO BẢNG BỆNH NHÂN 
CREATE TABLE BENHNHAN (
    MaBenhNhan INT PRIMARY KEY,
    TenBenhNhan NVARCHAR(100),
    NgaySinh DATE,
    SoGiuong INT,
    LoaiBenhNhan NVARCHAR(50),
    CONSTRAINT FK_BenhNhan_Giuong FOREIGN KEY (SoGiuong) REFERENCES GIUONG(SoGiuong))
-- TẠO BẢNG SỰ CHỮA TRỊ 
CREATE TABLE SUCHUATRI (
    MaSoChuaTri INT PRIMARY KEY,
    NgayChuaTri DATE,
    ThoiGianChuaTri TIME,
    KetQua NVARCHAR(200),
    MaBacSi INT,
    MaBenhNhan INT,
    CONSTRAINT FK_SuChuaTri_BacSi FOREIGN KEY (MaBacSi) REFERENCES BACSI(MaBacSi),
    CONSTRAINT FK_SuChuaTri_BenhNhan FOREIGN KEY (MaBenhNhan) REFERENCES BENHNHAN(MaBenhNhan))
-- TẠO BẢNG VẬT TƯ 
CREATE TABLE VATTU (
MaVatTu INT PRIMARY KEY,
TenVatTu NVARCHAR(100),
DonGia DECIMAL(10,2),
DacTa NVARCHAR(200))
-- TẠO BẢNG VẬT TƯ SỬ DỤNG
CREATE TABLE VATTU_SU_DUNG (
    MaVatTu INT,
    MaBenhNhan INT,
    SoLuong INT,
    ThoiGianSuDung DATETIME,
    TongTien MONEY,
    PRIMARY KEY (MaVatTu, MaBenhNhan),
    CONSTRAINT FK_VatTuSuDung_VatTu FOREIGN KEY (MaVatTu) REFERENCES VATTU(MaVatTu),
   CONSTRAINT FK_VatTuSuDung_BenhNhan FOREIGN KEY (MaBenhNhan) REFERENCES BENHNHAN(MaBenhNhan))

-- TẠO DỮ LIỆU BẢNG 
INSERT INTO NHANVIEN VALUES
(101, 'Nguyễn Văn A'),
(102, 'Trần Thị B'),
(103, 'Lê Văn C'),
(104, 'Phạm Thị D'),
(105, 'Vũ Văn E')

INSERT INTO KHUCHUATRI VALUES
(1, 'Khu A', 101),
(2, 'Khu B', 102),
(3, 'Khu C', 103),
(4, 'Khu D', 104),
(5, 'Khu E', 105)

INSERT INTO NHANVIEN_KHUCHUATRI VALUES
(1, 101, 8),
(1, 102, 6),
(2, 103, 10),
(3, 104, 7),
(4, 105, 9);

INSERT INTO BACSI VALUES
(201, 'BS. Trần A'),
(202, 'BS. Lê B'),
(203, 'BS. Nguyễn C'),
(204, 'BS. Phan D'),
(205, 'BS. Vũ E')

INSERT INTO KHUCHUATRI_BACSI VALUES
(1, 201),
(1, 202),
(2, 203),
(3, 204),
(4, 205)

INSERT INTO GIUONG VALUES
(301, 101, 1),
(302, 101, 1),
(303, 102, 2),
(304, 102, 2),
(305, 103, 3)

INSERT INTO BENHNHAN VALUES
(401, 'Phạm Văn Mạnh', '1985-05-01', 301, 'Nội trú'),
(402, 'Nguyễn Thị Hoa', '1990-03-15', 302, 'Nội trú'),
(403, 'Trần Văn Nam', '1988-07-20', 303, 'Nội trú'),
(404, 'Lê Thị Lan', '1995-12-01', 304, 'Nội trú'),
(405, 'Đỗ Văn Hưng', '1975-01-10', 305, 'Nội trú')

INSERT INTO SUCHUATRI VALUES
(501, '2025-05-01', '08:30:00', 'Khỏi', 201, 401),
(502, '2025-05-02', '09:00:00', 'Ổn định', 202, 402),
(503, '2025-05-03', '10:15:00', 'Đang theo dõi', 203, 403),
(504, '2025-05-04', '11:00:00', 'Cần theo dõi thêm', 204, 404),
(505, '2025-05-05', '12:00:00', 'Tốt', 205, 405)

INSERT INTO VATTU VALUES
(601, 'Găng tay y tế', 2000, 'Dùng 1 lần'),
(602, 'Khẩu trang y tế', 1500, 'Dùng 1 lần'),
(603, 'Ống nghe', 50000, 'Dụng cụ y tế'),
(604, 'Máy đo huyết áp', 30000, 'Thiết bị y tế'),
(605, 'Bộ truyền dịch', 1000000, 'Truyền dịch')

INSERT INTO VATTU_SU_DUNG (MaVatTu, MaBenhNhan, SoLuong, ThoiGianSuDung, TongTien) VALUES
(601, 401, 2, '2025-05-01 08:30:00', 4000),
(602, 402, 1, '2025-05-02 09:15:00', 1500),
(603, 403, 3, '2025-05-03 10:45:00', 150000),
(604, 404, 2, '2025-05-04 11:30:00', 60000),
(605, 405, 1, '2025-05-05 12:00:00', 1000000)
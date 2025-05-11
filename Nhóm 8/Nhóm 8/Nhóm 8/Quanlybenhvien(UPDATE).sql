-- TẠO DATABASE QLBV
CREATE DATABASE QLBV
GO
USE QLBV

-- NHANVIEN
CREATE TABLE NHANVIEN (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien NVARCHAR(100))

-- BACSI
CREATE TABLE BACSI (
    MaBacSi INT PRIMARY KEY,
    TenBacSi NVARCHAR(100))

-- BENHNHAN
CREATE TABLE BENHNHAN (
    MaBenhNhan INT PRIMARY KEY,
    TenBenhNhan NVARCHAR(100),
    NgaySinh DATE,
    LoaiBenhNhan NVARCHAR(50))

-- VATTU
CREATE TABLE VATTU (
    MaVatTu INT PRIMARY KEY,
    TenVatTu NVARCHAR(100),
    DacTa NVARCHAR(200),
    DonGia MONEY)

-- KHUCHUATRI
CREATE TABLE KHUCHUATRI (
    SoKhuChuaTri INT PRIMARY KEY,
    TenKhuChuaTri NVARCHAR(100),
    MaYTaTruong INT,
    CONSTRAINT FK_KHUCHUATRI_NHANVIEN 
        FOREIGN KEY (MaYTaTruong) REFERENCES NHANVIEN(MaNhanVien))

-- GIUONG
CREATE TABLE GIUONG (
    SoGiuong INT PRIMARY KEY,
    SoPhong INT,
    SoKhuChuaTri INT,
    CONSTRAINT FK_GIUONG_KHUCHUATRI 
        FOREIGN KEY (SoKhuChuaTri) REFERENCES KHUCHUATRI(SoKhuChuaTri))

-- LAMVIEC
CREATE TABLE LAMVIEC (
    MaNhanVien INT,
    SoKhuChuaTri INT,
    SoGioLamViec INT,
    PRIMARY KEY (MaNhanVien, SoKhuChuaTri),
    CONSTRAINT FK_LAMVIEC_NHANVIEN 
        FOREIGN KEY (MaNhanVien) REFERENCES NHANVIEN(MaNhanVien),
    CONSTRAINT FK_LAMVIEC_KHUCHUATRI 
        FOREIGN KEY (SoKhuChuaTri) REFERENCES KHUCHUATRI(SoKhuChuaTri))

-- CHUATRI
CREATE TABLE CHUATRI (
    MaSoChuaTri INT,
    MaBenhNhan INT,
    MaBacSi INT,
    TenChuaTri NVARCHAR(100),
    NgayChuaTri DATE,
    ThoiGianChuaTri TIME, 
    KetQua NVARCHAR(200),
    PRIMARY KEY (MaSoChuaTri, MaBenhNhan, MaBacSi),
    CONSTRAINT FK_CHUATRI_BENHNHAN FOREIGN KEY (MaBenhNhan) REFERENCES BENHNHAN(MaBenhNhan),
    CONSTRAINT FK_CHUATRI_BACSI FOREIGN KEY (MaBacSi) REFERENCES BACSI(MaBacSi))

-- THEODOI
CREATE TABLE THEODOI (
    MaBenhNhan INT,
    MaBacSi INT,
    PRIMARY KEY (MaBenhNhan, MaBacSi),
    CONSTRAINT FK_THEODOI_BENHNHAN FOREIGN KEY (MaBenhNhan) REFERENCES BENHNHAN(MaBenhNhan),
    CONSTRAINT FK_THEODOI_BACSI FOREIGN KEY (MaBacSi) REFERENCES BACSI(MaBacSi))

-- SUDUNG
CREATE TABLE SUDUNG (
    MaBenhNhan INT,
    MaVatTu INT,
    Ngay DATE,
    SoLuong INT,
    TongTien MONEY,
    ThoiGianSuDung NVARCHAR(50),
    PRIMARY KEY (MaBenhNhan, MaVatTu, Ngay),
    CONSTRAINT FK_SUDUNG_BENHNHAN 
        FOREIGN KEY (MaBenhNhan) REFERENCES BENHNHAN(MaBenhNhan),
    CONSTRAINT FK_SUDUNG_VATTU 
        FOREIGN KEY (MaVatTu) REFERENCES VATTU(MaVatTu))

-- NHANVIEN
INSERT INTO NHANVIEN VALUES (1, N'Nguyễn Văn A'), (2, N'Trần Thị B'), (3, N'Lê Văn C'), (4, N'Phạm Thị D'), (5, N'Đỗ Văn E')

-- BACSI
INSERT INTO BACSI VALUES 
(201, N'BS. Nguyễn Khánh'),
(202, N'BS. Trần Hải'),
(203, N'BS. Lê Minh'),
(204, N'BS. Đặng Quân'),
(205, N'BS. Vũ Thắng')

-- BENHNHAN
INSERT INTO BENHNHAN VALUES 
(101, N'Nguyễn Văn A', '1990-01-01', N'Nội trú'),
(102, N'Lê Thị B', '1985-02-15', N'Ngoại trú'),
(103, N'Trần Văn C', '1992-03-20', N'Nội trú'),
(104, N'Phạm Thị D', '1978-04-10', N'Nội trú'),
(105, N'Hoàng Thị E', '1995-07-22', N'Ngoại trú')

-- VATTU
INSERT INTO VATTU VALUES 
(1, N'Thẻ bảo hiểm', N'Thẻ dùng trong điều trị', 100000),
(2, N'Ống tiêm', N'Ống tiêm y tế', 5000),
(3, N'Máy X-quang', N'Máy chụp X-quang', 20000000),
(4, N'Thuốc kháng sinh', N'Thuốc dùng trong điều trị bệnh', 30000),
(5, N'Kính mắt', N'Kính dùng cho bệnh nhân thị lực yếu', 150000)


-- KHUCHUATRI
INSERT INTO KHUCHUATRI VALUES (401, N'Khu A', 1), (402, N'Khu B', 2), (403, N'Khu C', 3), (404, N'Khu D', 4), (405, N'Khu E', 5)

-- GIUONG
INSERT INTO GIUONG VALUES (501, 101, 401), (502, 102, 402), (503, 103, 403), (504, 104, 404), (505, 105, 405)

-- LAMVIEC
INSERT INTO LAMVIEC VALUES (1, 401, 40), (2, 402, 36), (3, 403, 30), (4, 404, 45), (5, 405, 50)

-- CHUATRI
INSERT INTO CHUATRI VALUES  
(1, 101, 201, 'Chữa cảm cúm', '2025-05-01', '08:30:00', 'Khỏi'),
(2, 102, 202, 'Truyền dịch', '2025-05-02', '09:15:00', 'Cải thiện'),
(3, 103, 201, 'Khám nội tổng quát', '2025-05-03', '10:45:00', 'Đang theo dõi'),
(4, 104, 202, 'Khám tái bệnh', '2025-05-05', '14:00:00', 'Tốt'),
(5, 105, 203, 'Chữa viêm họng', '2025-05-06', '15:30:00', 'Đã khỏi')

-- THEODOI
INSERT INTO THEODOI VALUES 
(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105, 205)

-- SUDUNG
INSERT INTO SUDUNG VALUES 
(101, 1, '2025-05-01', 2, 500000, '08:30:00'),
(102, 2, '2025-05-02', 1, 150000, '09:15:00'),
(103, 3, '2025-05-03', 3, 450000, '10:45:00'),
(104, 4, '2025-05-04', 1, 30000, '14:00:00'),
(105, 5, '2025-05-05', 4, 600000, '15:30:00')

-- NHÓM 
--2 CÂU KẾT NỐI NHIỀU BẢNG
--Liệt kê tên bệnh nhân, bác sĩ điều trị, khu chữa trị và kết quả điều trị của bệnh nhân đã điều trị trong ngày 2025-05-01.
SELECT BN.TenBenhNhan, BS.TenBacSi,KCT.TenKhuChuaTri, CT.KetQua
FROM CHUATRI CT
JOIN BENHNHAN BN ON CT.MaBenhNhan = BN.MaBenhNhan
JOIN BACSI BS ON CT.MaBacSi = BS.MaBacSi
JOIN GIUONG G ON BN.MaBenhNhan = G.SoGiuong - 400 -- mapping giả định
JOIN KHUCHUATRI KCT ON G.SoKhuChuaTri = KCT.SoKhuChuaTri
WHERE CT.NgayChuaTri = '2025-05-01'

--Liệt kê nhân viên và số giờ làm việc của họ ở mỗi khu chữa trị, kèm tên khu và y tá trưởng.
SELECT NV.TenNhanVien, LV.SoGioLamViec, KC.TenKhuChuaTri, NV2.TenNhanVien AS YTaTruong
FROM LAMVIEC LV
JOIN NHANVIEN NV ON LV.MaNhanVien = NV.MaNhanVien
JOIN KHUCHUATRI KC ON LV.SoKhuChuaTri = KC.SoKhuChuaTri
JOIN NHANVIEN NV2 ON KC.MaYTaTruong = NV2.MaNhanVien

--UPDATE  Cập nhật tên của các nhân viên là y tá trưởng (MaYTaTruong) của các khu chữa trị có số khu (SoKhuChuaTri) lớn hơn 3 thành "Nguyễn Văn X".
UPDATE NHANVIEN
SET TenNhanVien = N'Nguyễn Văn X'
WHERE MaNhanVien IN (
    SELECT MaYTaTruong
    FROM KHUCHUATRI
    WHERE SoKhuChuaTri > 3)

--UPDATE  Cập nhật TenVatTu thành 'Nhiệt kế điện tử' cho vật tư có MaVatTu = 3
UPDATE VATTU
SET TenVatTu = N'Nhiệt kế điện tử'
WHERE MaVatTu = 3

--(DELETE) Xóa tất cả bệnh nhân ngoại trú đã được chữa trị và có kết quả là “Đã khỏi”.
DELETE FROM CHUATRI
WHERE MaBenhNhan IN (
    SELECT MaBenhNhan 
    FROM BENHNHAN 
    WHERE LoaiBenhNhan = N'Ngoại trú')
AND KetQua = N'Đã khỏi'

--(DELETE) Xoá vật tư có đơn giá dưới 5.000 và chưa từng được sử dụng
DELETE FROM VATTU
WHERE DonGia < 5000
AND MaVatTu NOT IN (
    SELECT MaVatTu FROM SUDUNG)

--(GROUPBY) Tính chi phí trung bình vật tư sử dụng theo từng loại bệnh nhân (nội trú/ngoại trú), chỉ xét những bệnh nhân có tổng chi phí sử dụng > 20,000.
SELECT BN.LoaiBenhNhan, AVG(SD.TongTien) AS TB_ChiPhi
FROM BENHNHAN BN
JOIN SUDUNG SD ON BN.MaBenhNhan = SD.MaBenhNhan
GROUP BY BN.LoaiBenhNhan
HAVING SUM(SD.TongTien) > 20000

--(GROUPBY) Liệt kê các khu chữa trị có tổng số giờ làm việc > 40
SELECT KC.TenKhuChuaTri, SUM(LV.SoGioLamViec) AS TongGio
FROM KHUCHUATRI KC
JOIN LAMVIEC LV ON KC.SoKhuChuaTri = LV.SoKhuChuaTri
GROUP BY KC.TenKhuChuaTri
HAVING SUM(LV.SoGioLamViec) > 40

--2 câu sub query 
--Câu hỏi 1: Tìm tên bác sĩ có số lần chữa trị nhiều nhất.
SELECT TenBacSi
FROM BACSI
WHERE MaBacSi = (
    SELECT TOP 1 MaBacSi
    FROM CHUATRI
    GROUP BY MaBacSi
    ORDER BY COUNT(*) DESC)
--Câu hỏi 2: Liệt kê tên bệnh nhân đã sử dụng vật tư có đơn giá trên 100,000.
SELECT TenBenhNhan
FROM BENHNHAN
WHERE MaBenhNhan IN (
    SELECT DISTINCT MaBenhNhan
    FROM SUDUNG SD
    JOIN VATTU VT ON SD.MaVatTu = VT.MaVatTu
    WHERE VT.DonGia > 100000)

--1 câu bất kì:
 --Câu hỏi: Cho biết tổng tiền vật tư mà mỗi bệnh nhân đã sử dụng.
SELECT 
    BN.TenBenhNhan, 
    SUM(SD.TongTien) AS TongTienVatTu
FROM SUDUNG SD
JOIN BENHNHAN BN ON SD.MaBenhNhan = BN.MaBenhNhan
GROUP BY BN.TenBenhNhan

-- BẤT KỲ: Liệt kê tên các bác sĩ, tên bệnh nhân và số lượng vật tư đã sử dụng trong quá trình điều trị
SELECT BACSI.TenBacSi, BENHNHAN.TenBenhNhan, SUM(SUDUNG.SoLuong) AS TongSoLuongVatTu
FROM SUDUNG
JOIN BENHNHAN ON SUDUNG.MaBenhNhan = BENHNHAN.MaBenhNhan
JOIN CHUATRI ON BENHNHAN.MaBenhNhan = CHUATRI.MaBenhNhan
JOIN BACSI ON CHUATRI.MaBacSi = BACSI.MaBacSi
GROUP BY BACSI.TenBacSi, BENHNHAN.TenBenhNhan

-- CÁ NHÂN
-- NGUYỄN ĐÌNH NGỌC ÁNH
--Câu 1: Câu UPDATE:
--Câu hỏi: Tăng 10% đơn giá cho tất cả các vật tư đã từng được sử dụng bởi bệnh nhân nội trú.
UPDATE VATTU
SET DonGia = DonGia * 1.1
WHERE MaVatTu IN (
    SELECT DISTINCT SD.MaVatTu
    FROM SUDUNG SD
    JOIN BENHNHAN BN ON SD.MaBenhNhan = BN.MaBenhNhan
    WHERE BN.LoaiBenhNhan = N'Nội trú'
)
--Câu 2: Câu DELETE:
--Câu hỏi: Xóa các bản ghi trong bảng THEODOI mà bác sĩ chưa từng điều trị cho bất kỳ bệnh nhân nào (không có trong bảng CHUATRI).
DELETE FROM THEODOI
WHERE MaBacSi NOT IN (
    SELECT DISTINCT MaBacSi
    FROM CHUATRI
)

--Câu 3: Câu SUBQUERY:
--Câu hỏi: Liệt kê tên các bệnh nhân có tổng tiền sử dụng vật tư lớn hơn mức trung bình của tất cả bệnh nhân.
SELECT BN.TenBenhNhan
FROM BENHNHAN BN
JOIN (
    SELECT MaBenhNhan, SUM(TongTien) AS TongTien
    FROM SUDUNG
    GROUP BY MaBenhNhan
) AS T ON BN.MaBenhNhan = T.MaBenhNhan
WHERE T.TongTien > (
    SELECT AVG(TongTien)
    FROM (
        SELECT SUM(TongTien) AS TongTien
        FROM SUDUNG
        GROUP BY MaBenhNhan
    ) AS Sub
)

-- NGUYỄN LÊ HỒNG KIỀU
--(TRUY VẤN) Liệt kê danh sách bệnh nhân, bác sĩ điều trị, tên phương pháp chữa trị, thời gian, kết quả, và khu chữa trị của họ.
SELECT 
    BN.TenBenhNhan,
    BS.TenBacSi,
    CT.TenChuaTri,
    CT.NgayChuaTri,
    CT.KetQua,
    KCT.TenKhuChuaTri
FROM CHUATRI CT
JOIN BENHNHAN BN ON CT.MaBenhNhan = BN.MaBenhNhan
JOIN BACSI BS ON CT.MaBacSi = BS.MaBacSi
JOIN GIUONG G ON BN.MaBenhNhan = G.SoGiuong - 400 
JOIN KHUCHUATRI KCT ON G.SoKhuChuaTri = KCT.SoKhuChuaTri

--(GROUPBY) Liệt kê các nhân viên làm việc ở tối đa 1 khu chữa trị, kèm theo số khu đã làm và tổng số giờ làm việc.
SELECT 
    NV.TenNhanVien,
    COUNT(DISTINCT LV.SoKhuChuaTri) AS SoKhuThamGia,
    SUM(LV.SoGioLamViec) AS TongGioLam
FROM LAMVIEC LV
JOIN NHANVIEN NV ON LV.MaNhanVien = NV.MaNhanVien
GROUP BY NV.TenNhanVien
HAVING COUNT(DISTINCT LV.SoKhuChuaTri) > 1

-- (BẤT KÌ) Hãy liệt kê tên các bệnh nhân, tên bác sĩ đang theo dõi họ (dựa vào bảng THEODOI), đồng thời cho biết:
--Tổng số vật tư y tế mà mỗi bệnh nhân đã sử dụng (từ bảng SUDUNG)
--Tổng số tiền mà bệnh nhân đó đã chi cho vật tư y tế
SELECT 
    BN.TenBenhNhan,
    BS.TenBacSi AS BacSiTheoDoi,
		(SELECT COUNT(*) 
        FROM SUDUNG SD 
        WHERE SD.MaBenhNhan = BN.MaBenhNhan)
		AS SoVatTuSuDung,
		(SELECT SUM(SD.TongTien) 
        FROM SUDUNG SD 
        WHERE SD.MaBenhNhan = BN.MaBenhNhan)
		AS TongTienSuDung
FROM BENHNHAN BN
JOIN THEODOI TD ON BN.MaBenhNhan = TD.MaBenhNhan
JOIN BACSI BS ON TD.MaBacSi = BS.MaBacSi

-- NGÔ THỊ NGỌC TRÂM (NT)
--Hiển thị thông tin bệnh nhân cùng các vật tư y tế đã sử dụng trong một ngày cụ thể:
SELECT BENHNHAN.TenBenhNhan, VATTU.TenVatTu, SUDUNG.Ngay, SUDUNG.SoLuong, SUDUNG.TongTien
FROM SUDUNG
JOIN BENHNHAN ON SUDUNG.MaBenhNhan = BENHNHAN.MaBenhNhan
JOIN VATTU ON SUDUNG.MaVatTu = VATTU.MaVatTu
WHERE SUDUNG.Ngay = '2025-05-01';

--Liệt kê tên các nhân viên thuộc khu chữa trị có số khu là số chẵn
SELECT NHANVIEN.TenNhanVien, KHUCHUATRI.SoKhuChuaTri
FROM NHANVIEN
JOIN KHUCHUATRI ON NHANVIEN.MaNhanVien = KHUCHUATRI.MaYTaTruong
WHERE KHUCHUATRI.SoKhuChuaTri % 2 = 0;
---Tính tổng số tiền mà mỗi bệnh nhân đã sử dụng cho vật tư y tế

SELECT BENHNHAN.TenBenhNhan, SUM(SUDUNG.TongTien) AS TongTienSuDung
FROM SUDUNG
JOIN BENHNHAN ON SUDUNG.MaBenhNhan = BENHNHAN.MaBenhNhan
GROUP BY BENHNHAN.TenBenhNhan;

-- Ngô Thị Ngọc Trâm-23677821
--Liệt kê các vật tư đã được sử dụng bởi bệnh nhân, kèm theo thông tin bệnh nhân và tên bác sĩ theo dõi họ.
SELECT BN.TenBenhNhan, VT.TenVatTu, SD.SoLuong, SD.TongTien, BS.TenBacSi
FROM SUDUNG SD
JOIN BENHNHAN BN ON SD.MaBenhNhan = BN.MaBenhNhan
JOIN VATTU VT ON SD.MaVatTu = VT.MaVatTu
JOIN THEODOI TD ON BN.MaBenhNhan = TD.MaBenhNhan
JOIN BACSI BS ON TD.MaBacSi = BS.MaBacSi

--Liệt kê tên bệnh nhân, loại bệnh nhân và tổng chi phí sử dụng vật tư nếu tổng chi phí lớn hơn 100,000.
SELECT  BN.TenBenhNhan, BN.LoaiBenhNhan,SUM(SD.TongTien) AS TongChiPhi
FROM SUDUNG SD
JOIN BENHNHAN BN ON SD.MaBenhNhan = BN.MaBenhNhan
GROUP BY BN.TenBenhNhan, BN.LoaiBenhNhan
HAVING SUM(SD.TongTien) > 100000

--Liệt kê tên các bác sĩ đã chữa trị cho ít nhất một bệnh nhân nội trú.
SELECT DISTINCT BS.TenBacSi
FROM BACSI BS
WHERE BS.MaBacSi IN (
    SELECT CT.MaBacSi
    FROM CHUATRI CT
    JOIN BENHNHAN BN ON CT.MaBenhNhan = BN.MaBenhNhan
    WHERE BN.LoaiBenhNhan = N'Nội trú'
)
--Cập nhật đơn giá của vật tư "Ống tiêm" thành 6000 và bổ sung thông tin cho vật tư "Máy X-quang" nếu tổng chi phí của bệnh nhân sử dụng vật tư này trên 500,000.
UPDATE VATTU
SET DonGia = CASE
                 WHEN TenVatTu = N'Ống tiêm' THEN 6000
                 WHEN TenVatTu = N'Máy X-quang' THEN 22000000
             END
WHERE MaVatTu IN (
    SELECT SD.MaVatTu
    FROM SUDUNG SD
    JOIN BENHNHAN BN ON SD.MaBenhNhan = BN.MaBenhNhan
    GROUP BY SD.MaVatTu
    HAVING SUM(SD.TongTien) > 500000)

-- VŨ THỊ QUỲNH TRANG
--(GROUP BY) Tính tổng tiền vật tư từng loại vật tư
SELECT VT.TenVatTu, SUM(SD.TongTien) AS TongTienSuDung
FROM VATTU VT
JOIN SUDUNG SD ON VT.MaVatTu = SD.MaVatTu
GROUP BY VT.TenVatTu

--(SUBQUERY) Liệt kê bác sĩ điều trị bệnh nhân sử dụng vật tư có đơn giá cao hơn trung bình
SELECT DISTINCT BS.TenBacSi
FROM CHUATRI CT
JOIN BACSI BS ON CT.MaBacSi = BS.MaBacSi
JOIN SUDUNG SD ON CT.MaBenhNhan = SD.MaBenhNhan
JOIN VATTU VT ON SD.MaVatTu = VT.MaVatTu
WHERE VT.DonGia > (SELECT AVG(DonGia) 
                                         FROM VATTU)

--Liệt kê tên bác sĩ và tên bệnh nhân mà họ đã điều trị, bao gồm ngày điều trị
SELECT 
    BS.TenBacSi,
    B.TenBenhNhan,
    CT.NgayChuaTri
FROM 
    CHUATRI CT
JOIN 
    BACSI BS ON CT.MaBacSi = BS.MaBacSi
JOIN 
    BENHNHAN B ON CT.MaBenhNhan = B.MaBenhNhan
ORDER BY 
    BS.TenBacSi, CT.NgayChuaTri











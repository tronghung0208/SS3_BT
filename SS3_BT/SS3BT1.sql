Create Database QuanLyDiemSV;
use QuanLyDiemSV;
/*=============DANH MUC KHOA==============*/
Create table khoahoc
(
    MaKhoa    char(2) primary key,
    TenKhoa   varchar(30) not null,
    startDate DATETIME
);
/*==============DANH MUC SINH VIEN============*/
Create table student
(
    MaSV     char(3)      not null primary key,
    HoSV     nvarchar(15) not null,
    TenSV    nvarchar(7)  not null,
    Phai     nchar(7),
    NgaySinh datetime     not null,
    NoiSinh  nvarchar(20),
    MaKhoa   char(2),
    HocBong  float
);
/*===================MON HOC========================*/
create table subject
(
    MaMH   char(2)      not null,
    TenMH  nvarchar(25) not null,
    SoTiet tinyint,
    Constraint DMMH_MaMH_pk primary key (MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
    MaSV   char(3) not null,
    MaMH   char(2) not null,
    LanThi tinyint,
    Diem   decimal(4, 2),
    Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV, MaMH, LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table student
    add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
        References khoahoc (MaKhoa);
Alter table KetQua
    add constraint KetQua_MaSV_fk foreign key (MaSV) references student (MaSV);
Alter table KetQua
    add constraint DMMH_MaMH_fk foreign key (MaMH) references subject (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into subject(MaMH, TenMH, SoTiet)
values ('01', 'Cơ Sở Dữ Liệu', 30);
Insert into subject(MaMH, TenMH, SoTiet)
values ('02', 'Trí Tuệ Nhân Tạo', 45);
Insert into subject(MaMH, TenMH, SoTiet)
values ('03', 'Truyền Tin', 45);
Insert into subject(MaMH, TenMH, SoTiet)
values ('04', 'Đồ Họa', 50);
Insert into subject(MaMH, TenMH, SoTiet)
values ('05', 'Văn Phạm', 60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into khoahoc(MaKhoa, TenKhoa, startDate)
values ('AV', 'Anh Văn', '2023-08-02 00:00:00');
Insert into khoahoc(MaKhoa, TenKhoa, startDate)
values ('TH', 'Tin Học', '2023-11-02 00:00:00');
Insert into khoahoc(MaKhoa, TenKhoa, startDate)
values ('TR', 'Triết', '2023-12-02 00:00:00');
Insert into khoahoc(MaKhoa, TenKhoa, startDate)
values ('VL', 'Vật Lý', '2023-02-02 00:00:00');
/*==============NHAP DU LIEU DMSV=============*/
Insert into student
values ('A01', 'Nguyễn Thị', 'Hải', 'Nữ', '1990-03-20', 'Hà Nội', 'TH', 130000);
Insert into student(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A02', 'Trần Văn', 'Chính', 'Nam', '1992-12-24', 'Bình Định', 'VL', 150000);
Insert into student(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A03', 'Lê Thu Bạch', 'Yến', 'Nữ', '1990-02-21', 'TP Hồ Chí Minh', 'TH', 170000);
Insert into student(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A04', 'Trần Anh', 'Tuấn', 'Nam', '1990-12-20', 'Hà Nội', 'AV', 80000);
Insert into student(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B01', 'Trần Thanh', 'Mai', 'Nữ', '1991-08-12', 'Hải Phòng', 'TR', 0);
Insert into student(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B02', 'Trần Thị Thu', 'Thủy', 'Nữ', '1991-01-02', 'TP Hồ Chí Minh', 'AV', 0);
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 1, 3);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '02', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '03', 1, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 1, 4.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 2, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '03', 1, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '05', 1, 9);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 1, 2);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 2, 4);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A04', '05', 2, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '01', 1, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '02', 1, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '04', 1, 10);


-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT *
FROM student
WHERE TenSV LIKE '%h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT *
FROM khoahoc
WHERE MONTH(startDate) = 8;

-- Hiển thị tất cả các thông tin môn học có số tiết trong khoảng từ 3-5.
SELECT *
FROM subject
WHERE SoTiet >= 40
  AND SoTiet <= 50;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên  là 2.
SELECT *
FROM student;
UPDATE student
SET MaKhoa ='VL'
WHERE TenSV = 'Tuấn';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark)
-- giảm dần. nếu trùng sắp theo tên tăng dần.

/*
select s.StudentName, SubName, Mark from student s
join btap1.mark m on s.StudentId = m.StudentId
join btap1.subject s2 on s2.SubId = m.SubId
order by Mark DESC, s.StudentName;
 */


SELECT s.HoSV AS 'Họ', s.TenSV AS 'Tên Sinh Viên', sb.TenMH AS 'Tên môn học', kq.Diem AS 'Điểm', s.Phai AS 'Giới tính'
FROM student s
         JOIN KetQua kq ON s.MaSV = kq.MaSV
         JOIN subject sb ON kq.MaMH = sb.MaMH
ORDER BY kq.Diem DESC, s.HoSV ASC, sb.TenMH ASC;

-- Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
SELECT s.HoSV AS 'Họ', s.TenSV AS 'Tên Sinh Viên', sb.TenMH AS 'Tên môn học', kq.Diem AS 'Điểm', s.Phai AS 'Giới tính'
FROM student s
         JOIN KetQua kq ON s.MaSV = kq.MaSV
         JOIN subject sb ON kq.MaMH = sb.MaMH
ORDER BY s.Phai ASC;


SELECT*FROM student WHERE HocBong>150000;
SELECT * FROM student s JOIN khoahoc k on s.MaKhoa = k.MaKhoa;
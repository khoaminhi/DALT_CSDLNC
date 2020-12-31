/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     12/31/2020 10:30:24 AM                       */
/*==============================================================*/

USE master
GO

CREATE DATABASE QLTVKHTN
GO
USE QLTVKHTN
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANBO') and o.name = 'FK_CANBO_REFERENCE_DOCGIA')
alter table CANBO
   drop constraint FK_CANBO_REFERENCE_DOCGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DOCGIA') and o.name = 'FK_DOCGIA_REFERENCE_THETHUVI')
alter table DOCGIA
   drop constraint FK_DOCGIA_REFERENCE_THETHUVI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHUNGPHANLOAI') and o.name = 'FK_KHUNGPHA_REFERENCE_NHOMSACH')
alter table KHUNGPHANLOAI
   drop constraint FK_KHUNGPHA_REFERENCE_NHOMSACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUMAT') and o.name = 'FK_PHIEUMAT_REFERENCE_DOCGIA')
alter table PHIEUMAT
   drop constraint FK_PHIEUMAT_REFERENCE_DOCGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUMAT') and o.name = 'FK_PHIEUMAT_REFERENCE_SACH')
alter table PHIEUMAT
   drop constraint FK_PHIEUMAT_REFERENCE_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUMUON') and o.name = 'FK_PHIEUMUO_REFERENCE_DOCGIA')
alter table PHIEUMUON
   drop constraint FK_PHIEUMUO_REFERENCE_DOCGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUTRA') and o.name = 'FK_PHIEUTRA_REFERENCE_PHIEUMUO')
alter table PHIEUTRA
   drop constraint FK_PHIEUTRA_REFERENCE_PHIEUMUO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH') and o.name = 'FK_SACH_REFERENCE_PHIEUMUO')
alter table SACH
   drop constraint FK_SACH_REFERENCE_PHIEUMUO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH') and o.name = 'FK_SACH_REFERENCE_PHIEUTRA')
alter table SACH
   drop constraint FK_SACH_REFERENCE_PHIEUTRA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH') and o.name = 'FK_SACH_REFERENCE_KHUNGPHA')
alter table SACH
   drop constraint FK_SACH_REFERENCE_KHUNGPHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SINHVIEN') and o.name = 'FK_SINHVIEN_REFERENCE_DOCGIA')
alter table SINHVIEN
   drop constraint FK_SINHVIEN_REFERENCE_DOCGIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANBO')
            and   type = 'U')
   drop table CANBO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOCGIA')
            and   type = 'U')
   drop table DOCGIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHUNGPHANLOAI')
            and   type = 'U')
   drop table KHUNGPHANLOAI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHOMSACH')
            and   type = 'U')
   drop table NHOMSACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUMAT')
            and   type = 'U')
   drop table PHIEUMAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUMUON')
            and   type = 'U')
   drop table PHIEUMUON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUTRA')
            and   type = 'U')
   drop table PHIEUTRA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SACH')
            and   type = 'U')
   drop table SACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SINHVIEN')
            and   type = 'U')
   drop table SINHVIEN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THETHUVIEN')
            and   type = 'U')
   drop table THETHUVIEN
go

/*==============================================================*/
/* Table: CANBO                                                 */
/*==============================================================*/
create table CANBO (
   IDDG                 int                  not null,
   MACB                 int                  not null,
   LOAIHINHDT           nvarchar(100)        not null,
   TRUONGCT             nvarchar(200)        not null,
   constraint PK_CANBO primary key (IDDG)
)
go

/*==============================================================*/
/* Table: DOCGIA                                                */
/*==============================================================*/
create table DOCGIA (
   IDDG		           int                  not null IDENTITY(1,1),
   IDTHE                int                  not null,
   TENDG                nvarchar(50)         not null,
   SDTDG                int                  not null,
   EMAILDG              nvarchar(50)         not null,
   THAMGIALOP           bit                  not null,
   constraint PK_DOCGIA primary key (IDDG)
)
go

/*==============================================================*/
/* Table: KHUNGPHANLOAI                                         */
/*==============================================================*/
create table KHUNGPHANLOAI (
   IDKHUNGPL            int                  not NULL IDENTITY(1,1),
   IDNHOMSACH           smallint             not null,
   TENKHUNGPL           nvarchar(100)        not null,
   constraint PK_KHUNGPHANLOAI primary key (IDKHUNGPL)
)
go

/*==============================================================*/
/* Table: NHOMSACH                                              */
/*==============================================================*/
create table NHOMSACH (
   IDNHOMSACH           smallint             not NULL IDENTITY(1,1),
   TENNHOMSACH          nvarchar(100)        not null,
   constraint PK_NHOMSACH primary key (IDNHOMSACH)
)
go

/*==============================================================*/
/* Table: PHIEUMAT                                              */
/*==============================================================*/
create table PHIEUMAT (
   IDDG                 int                  not null,
   IDSACH               int                  not null,
   CUONTHU              smallint             not null,
   NGAYGHINHAN          date                 not null,
   TIENPHAT             money                not null,
   NGUOIGHINHAN         nvarchar(50)         not null,
   constraint PK_PHIEUMAT primary key (IDDG, IDSACH, CUONTHU)
)
go

/*==============================================================*/
/* Table: PHIEUMUON                                             */
/*==============================================================*/
create table PHIEUMUON (
   IDPHIEUMUON          int                  not NULL IDENTITY(1,1),
   IDDG                 int                  not null,
   NGAYMUON             date                 not null,
   GIAHAN               bit                  not null,
   HETHAN               date                 null,
   constraint PK_PHIEUMUON primary key (IDPHIEUMUON)
)
go

/*==============================================================*/
/* Table: PHIEUTRA                                              */
/*==============================================================*/
create table PHIEUTRA (
   IDPHIEUTRA           int                  not NULL IDENTITY(1,1),
   IDPHIEUMUON          int                  not null,
   NGAYTRA              date                 null,
   constraint PK_PHIEUTRA primary key (IDPHIEUTRA)
)
go

/*==============================================================*/
/* Table: SACH                                                  */
/*==============================================================*/
create table SACH (
   IDSACH               int                  not NULL IDENTITY(1,1),
   CUONTHU              smallint             not null,
   IDKHUNGPL            int                  not null,
   IDPHIEUMUON          int                  null,
   IDPHIEUTRA           int                  null,
   TENSACH              nvarchar(150)        not null,
   TINHTRANGSACH        NVARCHAR(500)        null,
   TAP                  smallint             not null,
   TACGIA               nvarchar(50)         not null,
   NGAYXUATBAN          date                 null,
   NHAXUATBAN           nvarchar(50)         null,
   CAPPHEPMUON          bit                  not null,
   constraint PK_SACH primary key (IDSACH, CUONTHU)
)
go

/*==============================================================*/
/* Table: SINHVIEN                                              */
/*==============================================================*/
create table SINHVIEN (
   IDDG                 int                  not null,
   MSSV                 int                  not null,
   constraint PK_SINHVIEN primary key (IDDG)
)
go

/*==============================================================*/
/* Table: THETHUVIEN                                            */
/*==============================================================*/
create table THETHUVIEN (
   IDTHE                int                  not NULL IDENTITY(1,1),
   NGAYHETHAN           date                 null,
   constraint PK_THETHUVIEN primary key (IDTHE)
)
go

alter table CANBO
   add constraint FK_CANBO_REFERENCE_DOCGIA foreign key (IDDG)
      references DOCGIA (IDDG)
go

alter table DOCGIA
   add constraint FK_DOCGIA_REFERENCE_THETHUVI foreign key (IDTHE)
      references THETHUVIEN (IDTHE)
go

alter table KHUNGPHANLOAI
   add constraint FK_KHUNGPHA_REFERENCE_NHOMSACH foreign key (IDNHOMSACH)
      references NHOMSACH (IDNHOMSACH)
go

alter table PHIEUMAT
   add constraint FK_PHIEUMAT_REFERENCE_DOCGIA foreign key (IDDG)
      references DOCGIA (IDDG)
go

alter table PHIEUMAT
   add constraint FK_PHIEUMAT_REFERENCE_SACH foreign key (IDSACH, CUONTHU)
      references SACH (IDSACH, CUONTHU)
go

alter table PHIEUMUON
   add constraint FK_PHIEUMUO_REFERENCE_DOCGIA foreign key (IDDG)
      references DOCGIA (IDDG)
go

alter table PHIEUTRA
   add constraint FK_PHIEUTRA_REFERENCE_PHIEUMUO foreign key (IDPHIEUMUON)
      references PHIEUMUON (IDPHIEUMUON)
go

alter table SACH
   add constraint FK_SACH_REFERENCE_PHIEUMUO foreign key (IDPHIEUMUON)
      references PHIEUMUON (IDPHIEUMUON)
go

alter table SACH
   add constraint FK_SACH_REFERENCE_PHIEUTRA foreign key (IDPHIEUTRA)
      references PHIEUTRA (IDPHIEUTRA)
go

alter table SACH
   add constraint FK_SACH_REFERENCE_KHUNGPHA foreign key (IDKHUNGPL)
      references KHUNGPHANLOAI (IDKHUNGPL)
go

alter table SINHVIEN
   add constraint FK_SINHVIEN_REFERENCE_DOCGIA foreign key (IDDG)
      references DOCGIA (IDDG)
go

--################ Nhap lieu ##################--
INSERT dbo.NHOMSACH
(
    IDNHOMSACH,
    TENNHOMSACH
)
VALUES
(   000,  -- IDNHOMSACH - smallint
    N'Tin học ở Việt Nam' -- TENNHOMSACH - nvarchar(100)
    ),
(209, N'Tôn giáo Việt Nam thế kỉ 10'),
(211, N'Tôn giáo Mỹ thế ki 20'),
(401, N'Tiếng việt của Việt Nam'),
(427, N'Tiếng Anh trên thế giới'),
(603, N'Công nghệ tương lai trên thế giới'),
(691, N'Công nghê Trung Quốc hiện nay'),
(901, N'Lịch sử Việt Nam thế kỉ đầu'),
(803, N'Những thành tựu của Văn học Việt Nam')
GO

--KHUNGPHANLOAI
INSERT dbo.KHUNGPHANLOAI
(
    IDKHUNGPL,
    IDNHOMSACH,
    TENKHUNGPL
)
VALUES
(   1234,  -- IDKHUNGPL - int
    000,  -- IDNHOMSACH - smallint
    N'Tin học cơ bản' -- TENKHUNGPL - nvarchar(100)
    ),
	(2346, 000, N'Môn cơ sở ngành công nghệ thông tin'),
	(254, 209, N'Ngoài Bắc'),
	(24673, 211, N'Thiên chúa giáo những năm đầu 1910'),
	(4782, 401, N'Tiếng Việt ở Quảng Ngãi'),
	(684, 603, N'Công nghệ ở Việt Nam'),
	(62345, 691, N'Chế tạo tàu vũ trụ'),
	(93453, 901, N'Thời Hai bà Trưng'),
	(878, 803, N'Những nhà văn lớn'),
	(835, 803, N'Những bài thơ hay nhất')

GO


--THETHUVIEN
INSERT dbo.THETHUVIEN
(
    IDTHE,
    NGAYHETHAN
)
VALUES
(   1,        -- IDTHE - int
    DATEADD(YEAR, 4, GETDATE()) -- NGAYHETHAN - date
    ),
	(2, DATEADD(YEAR, 4, GETDATE())),
	(3, DATEADD(YEAR, 3, GETDATE())),
	(4, DATEADD(YEAR, 4, GETDATE())),
	(5, DATEADD(YEAR, 4, GETDATE())),
	(6, DATEADD(YEAR, 4, GETDATE())),
	(7, DATEADD(YEAR, 4, GETDATE())),
	(8, DATEADD(YEAR, 4, GETDATE())),
	(9, DATEADD(YEAR, 2, GETDATE())),
	(10, DATEADD(YEAR, 4, GETDATE())),
	(11, DATEADD(YEAR, 4, GETDATE()))
GO

--DOCGIA
INSERT dbo.DOCGIA
(
    IDDG,
    IDTHE,
    TENDG,
    SDTDG,
    EMAILDG,
    THAMGIALOP
)
VALUES
(   1,   -- IDDG - int
    18120418,   -- IDTHE - int
    N'Phạm Minh Khoa', -- TENDG - nvarchar(50)
    0336069400,   -- SDTDG - int
    N'minhkhoa031099@gmail.com', -- EMAILDG - nvarchar(50)
    1 -- THAMGIALOP - bit
    ),
	(2, 2, N'Nguyễn Văn Hảo', 0123456789, N'18120385@student.hcmus.edu.vn', 1),
	(3, 3, N'Huỳnh Hòa', 0123456788, N'18120338@student.hcmus.edu.vn', 1),
	(4, 4, N'Nguyễn Đức Minh', 0123456787, N'18120385@student.hcmus.edu.vn', 1),
	(5, 5, N'Phan Long Hiếu', 0123456786, N'18120385@student.hcmus.edu.vn', 0),
	(6, 6, N'Nguyễn Ngọc Ngạn', 0123456783, N'18120385@student.hcmus.edu.vn', 0),
	(7, 6, N'An Dương Đức', 0123456785, N'18120385@student.hcmus.edu.vn', 1),
	(8, 7, N'Chí Cẩm Hào', 0123456784, N'18120385@student.hcmus.edu.vn', 1),
	(9, 9, N'Trần Đức Lương', 0123453789, N'tdluong@fit.hcmus.edu.vn', 1),
	(10, 10, N'Hà Huy', 0123457789, N'hhuy@fit.hcmus.edu.vn', 1),
	(11, 11, N'Đỗ Ngọc', 0123456719, N'dngoc@kt.hcmute.edu.vn', 1)
GO

--CANBO
INSERT dbo.CANBO
(
    IDDG,
    MACB,
    LOAIHINHDT,
    TRUONGCT
)
VALUES
(   9,   -- IDDG - int
    19612223,   -- MACB - int
    N'Công nhệ thông tin', -- LOAIHINHDT - nvarchar(100)
    N'Đại học Khoa Học Tự Nhiên ĐHQG Tp HCM'  -- TRUONGCT - nvarchar(200)
    ),
	(10, 19812239, N'Công nhệ thông tin',  N'Đại học Khoa Học Tự Nhiên ĐHQG Tp HCM'),
	(11, 29908113, N'Môi trường',  N'Đại học Bách khoa Tp HCM')
GO

--SINHVIEN
INSERT dbo.SINHVIEN
(
    IDDG,
    MSSV
)
VALUES
(   1, -- IDDG - int
    18120418  -- MSSV - int
    ),
	(2, 18120385),
	(3, 18120338),
	(4, 18120356),
	(5, 18120685),
	(6, 18120325),
	(7, 18120945),
	(8, 18120195)
GO 

--PHIEUMUON
INSERT dbo.PHIEUMUON
(
    IDPHIEUMUON,
    IDDG,
    NGAYMUON,
    GIAHAN,
    HETHAN
)
VALUES
(   1,         -- IDPHIEUMUON - int
    1,         -- IDDG - int
    GETDATE(), -- NGAYMUON - date
    0,      -- GIAHAN - bit
    DATEADD(WEEK, 2, GETDATE()) -- HETHAN - date
    ),
	(2, 2, DATEADD(WEEK, -10, GETDATE()), 0, DATEADD(WEEK, -8, GETDATE())),
	(3, 2, DATEADD(WEEK, -9, GETDATE()), 0,DATEADD(WEEK, -7, GETDATE())), --Tiep tục mượn thêm cuốn nữa sau 1 tuần
	(4, 3, DATEADD(YEAR, -1, GETDATE()), 0, DATEADD(WEEK, 2, DATEADD(YEAR, -1, GETDATE()))),
	(5, 4, GETDATE(), 0,DATEADD(WEEK, 2, GETDATE())),
	(6, 5, DATEADD(WEEK, -5, GETDATE()), 0,DATEADD(WEEK, -3, GETDATE())), --Làm mất sách
	(7, 6, GETDATE(), 0,DATEADD(WEEK, 2, GETDATE())),
	(8, 11, GETDATE(), 1,DATEADD(WEEK, 3, GETDATE())),
	(9, 9, DATEADD(YEAR, -2, GETDATE()), 0, DATEADD(WEEK, 2, DATEADD(YEAR, -2, GETDATE())))
GO

--PHIEUTRA
INSERT dbo.PHIEUTRA
(
    IDPHIEUTRA,
    IDPHIEUMUON,
    NGAYTRA
)
VALUES
(   1,        -- IDPHIEUTRA - int
    3,        -- IDPHIEUMUON - int
    DATEADD(DAY, -12, GETDATE()) -- NGAYTRA - date
    ),
	(2, 2, DATEADD(DAY, -12, GETDATE())),
	(5, 4, DATEADD(DAY, 4, DATEADD(YEAR, -1, GETDATE()))),
	(3, 9, DATEADD(DAY, 9, DATEADD(YEAR, -2, GETDATE()))),
	(4, 1, NULL),					
	(6, 5, NULL),
	(7, 7, NULL),
	(8, 8, NULL)
GO

--SACH
insert dbo.SACH
(
    IDSACH,
    CUONTHU,
    IDKHUNGPL,
    IDPHIEUMUON,
    IDPHIEUTRA,
    TENSACH,
    TINHTRANGSACH,
    TAP,
    TACGIA,
    NGAYXUATBAN,
    NHAXUATBAN,
    CAPPHEPMUON
)
VALUES
(   12378,         -- IDSACH - int
    1,         -- CUONTHU - smallint
    1234,         -- IDKHUNGPL - int
    NULL,         -- IDPHIEUMUON - int
    1,         -- IDPHIEUTRA - int
    N'Word căn bản',       -- TENSACH - nvarchar(150)
    NULL,      -- TINHTRANGSACH - nvarchar(500)
    1,         -- TAP - smallint
    N'Nguyễn Viết',       -- TACGIA - nvarchar(50)
    DATEADD(YEAR, -5, GETDATE()), -- NGAYXUATBAN - date
    N'ĐHQG Tp HCM',       -- NHAXUATBAN - nvarchar(50)
    1       -- CAPPHEPMUON - bit
    ),
	(12378, 2, 1234, NULL, 2, N'Word căn bản',NULL,1, N'Nguyễn Viết', DATEADD(YEAR, -5, GETDATE()), N'ĐHQG Tp HCM',1),
	(2245, 1, 254, NULL, 3, N'Những điều bạn chưa biêt về phật giáo thế kỉ 10 ở nước ta',NULL,1, N'Nguyễn Văn Sáng', DATEADD(YEAR, -10, GETDATE()), N'Tuổi Trẻ',1),
	(32436, 1, 24673, NULL, 5, N'Thiên chúa giáo phát triển ở Mỹ như thế nào đầu những năm 1910',NULL,1, N'Henry Atona', DATEADD(DAY, -800, GETDATE()), N'Tuổi Trẻ',1),
	(421345, 1, 4782, 8, NULL, N'Tiếng Việt Quảng Ngãi phong phú',NULL,1, N'Ngô Kiệt', DATEADD(DAY, -400, GETDATE()), N'Hồng Ân',1),
	(52673, 1, 684, 7, NULL, N'Công nghệ ô tô Việt Nam hiện nay',NULL,1, N'Trần Tuấn', DATEADD(DAY, -100, GETDATE()), N'Tuổi Trẻ',1),
	(6554864, 1, 62345, NULL, NULL, N'Tàu Thần Châu 2 của Trung Quốc',NULL,1, N'Lâm Quách', DATEADD(YEAR, -4, GETDATE()), N'Tuổi Trẻ',1),
	(723453, 1, 93453, 1, NULL, N'Quá trình thuần phục và huấn luyện voi chiến của Hai bà Trưng',NULL,1, N'Phạm Nguyên', DATEADD(WEEK, -300, GETDATE()), N'Tuổi Trẻ',1),
	(8245, 1, 878, 5, NULL, N'Những nhà văn lớn trong phong trào thơ mới ở Việt Nam',NULL,1, N'Hồ Nguyên Định', DATEADD(WEEK, -76, GETDATE()), N'Tuổi Trẻ',1),
	(92, 1, 835, NULL, NULL, N'Tuyển tập những bài thơ hay nhất của thơ Việt Nam',NULL,1, N'Đào Huy', DATEADD(DAY, -683, GETDATE()), N'Tuổi Trẻ',1),
	(10254, 1, 2346, NULL, NULL, N'Lập trình C căn bản',NULL,1, N'Bùi Đức', DATEADD(YEAR, -6, GETDATE()), N'ĐHQG Tp HCM',1),
	(10254, 2, 2346, NULL, NULL, N'Lập trình c căn bản',NULL,1, N'Bùi Đức', DATEADD(YEAR, -6, GETDATE()), N'ĐHQG Tp HCM',1)
GO

--PHIEUMAT
INSERT dbo.PHIEUMAT
(
    IDDG,
    IDSACH,
    CUONTHU,
    NGAYGHINHAN,
    TIENPHAT,
    NGUOIGHINHAN
)
VALUES
(   5,         -- IDDG - int
    32436,         -- IDSACH - int
    1,         -- CUONTHU - smallint
    DATEADD(WEEK, -4, GETDATE()), -- NGAYGHINHAN - date
    100000,      -- TIENPHAT - money
    N'Trần Thị Ánh Nhi'        -- NGUOIGHINHAN - nvarchar(50)
    )
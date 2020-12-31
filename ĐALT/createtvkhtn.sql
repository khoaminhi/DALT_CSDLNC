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
   IDDG                 int                  not null,
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
   IDKHUNGPL            int                  not null,
   IDNHOMSACH           smallint             not null,
   TENKHUNGPL           nvarchar(100)        not null,
   constraint PK_KHUNGPHANLOAI primary key (IDKHUNGPL)
)
go

/*==============================================================*/
/* Table: NHOMSACH                                              */
/*==============================================================*/
create table NHOMSACH (
   IDNHOMSACH           smallint             not null,
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
   IDPHIEUMUON          int                  not null,
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
   IDPHIEUTRA           int                  not null,
   IDPHIEUMUON          int                  not null,
   NGAYTRA              date                 null,
   constraint PK_PHIEUTRA primary key (IDPHIEUTRA)
)
go

/*==============================================================*/
/* Table: SACH                                                  */
/*==============================================================*/
create table SACH (
   IDSACH               int                  not null,
   CUONTHU              smallint             not null,
   IDKHUNGPL            int                  not null,
   IDPHIEUMUON          int                  null,
   IDPHIEUTRA           int                  null,
   TENSACH              nvarchar(150)        not null,
   TINHTRANGSACH        bit                  not null,
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
   IDTHE                int                  not null,
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


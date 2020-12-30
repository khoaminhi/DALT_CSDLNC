/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     12/30/2020 4:53:44 PM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANBO') and o.name = 'FK_CANBO_REFERENCE_DOCGIA')
alter table CANBO
   drop constraint FK_CANBO_REFERENCE_DOCGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HINHPHAT') and o.name = 'FK_HINHPHAT_REFERENCE_PHIEUMUO')
alter table HINHPHAT
   drop constraint FK_HINHPHAT_REFERENCE_PHIEUMUO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHUNGPHANLOAI') and o.name = 'FK_KHUNGPHA_REFERENCE_NHOMSACH')
alter table KHUNGPHANLOAI
   drop constraint FK_KHUNGPHA_REFERENCE_NHOMSACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUMUON') and o.name = 'FK_PHIEUMUO_REFERENCE_DOCGIA')
alter table PHIEUMUON
   drop constraint FK_PHIEUMUO_REFERENCE_DOCGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PMSACH') and o.name = 'FK_PMSACH_REFERENCE_PHIEUMUO')
alter table PMSACH
   drop constraint FK_PMSACH_REFERENCE_PHIEUMUO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PMSACH') and o.name = 'FK_PMSACH_REFERENCE_SACH')
alter table PMSACH
   drop constraint FK_PMSACH_REFERENCE_SACH
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
           where  id = object_id('HINHPHAT')
            and   type = 'U')
   drop table HINHPHAT
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
           where  id = object_id('PHIEUMUON')
            and   type = 'U')
   drop table PHIEUMUON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PMSACH')
            and   type = 'U')
   drop table PMSACH
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

/*==============================================================*/
/* Table: CANBO                                                 */
/*==============================================================*/
create table CANBO (
   IDDG                 int                  not null,
   MACB                 int                  not null,
   LOAIHINHDT           varchar(100)         not null,
   TRUONGCT             varchar(200)         not null,
   constraint PK_CANBO primary key (IDDG)
)
go

/*==============================================================*/
/* Table: DOCGIA                                                */
/*==============================================================*/
create table DOCGIA (
   IDDG                 int                  not null,
   TENDG                varchar(50)          not null,
   SDTDG                int                  not null,
   EMAILDG              varchar(50)          not null,
   THAMGIALOP           bit                  not null,
   NGAYHETHAN           datetime             not null,
   constraint PK_DOCGIA primary key (IDDG)
)
go

/*==============================================================*/
/* Table: HINHPHAT                                              */
/*==============================================================*/
create table HINHPHAT (
   IDPHIEU              int                  not null,
   LOAIPHAT             tinyint              not null,
   constraint PK_HINHPHAT primary key (IDPHIEU, LOAIPHAT)
)
go

/*==============================================================*/
/* Table: KHUNGPHANLOAI                                         */
/*==============================================================*/
create table KHUNGPHANLOAI (
   IDKHUNGPL            int                  not null,
   IDNHOMSACH           smallint             null,
   TENKHUNGPL           varchar(100)         not null,
   constraint PK_KHUNGPHANLOAI primary key (IDKHUNGPL)
)
go

/*==============================================================*/
/* Table: NHOMSACH                                              */
/*==============================================================*/
create table NHOMSACH (
   IDNHOMSACH           smallint             not null,
   TENNHOMSACH          varchar(100)         not null,
   constraint PK_NHOMSACH primary key (IDNHOMSACH)
)
go

/*==============================================================*/
/* Table: PHIEUMUON                                             */
/*==============================================================*/
create table PHIEUMUON (
   IDPHIEU              int                  not null,
   NGAYMUON             datetime             not null,
   GIAHAN               bit                  not null,
   NGAYTRA              datetime             null,
   IDDG                 int                  not null,
   constraint PK_PHIEUMUON primary key (IDPHIEU)
)
go

/*==============================================================*/
/* Table: PMSACH                                                */
/*==============================================================*/
create table PMSACH (
   IDSACH               int                  not null,
   IDPHIEU              int                  not null,
   constraint PK_PMSACH primary key (IDSACH, IDPHIEU)
)
go

/*==============================================================*/
/* Table: SACH                                                  */
/*==============================================================*/
create table SACH (
   IDSACH               int                  not null,
   TENSACH              varchar(150)         not null,
   TINHTRANGSACH        bit                  not null,
   TAP                  smallint             not null,
   CUONTHU              smallint             not null,
   TACGIA               varchar(50)          not null,
   NGAYXUATBAN          date                 null,
   NHAXUATBAN           varchar(50)          null,
   CAPPHEPMUON          bit                  not null,
   IDKHUNGPL            int                  not null,
   constraint PK_SACH primary key (IDSACH)
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

alter table CANBO
   add constraint FK_CANBO_REFERENCE_DOCGIA foreign key (IDDG)
      references DOCGIA (IDDG)
go

alter table HINHPHAT
   add constraint FK_HINHPHAT_REFERENCE_PHIEUMUO foreign key (IDPHIEU)
      references PHIEUMUON (IDPHIEU)
go

alter table KHUNGPHANLOAI
   add constraint FK_KHUNGPHA_REFERENCE_NHOMSACH foreign key (IDNHOMSACH)
      references NHOMSACH (IDNHOMSACH)
go

alter table PHIEUMUON
   add constraint FK_PHIEUMUO_REFERENCE_DOCGIA foreign key (IDDG)
      references DOCGIA (IDDG)
go

alter table PMSACH
   add constraint FK_PMSACH_REFERENCE_PHIEUMUO foreign key (IDPHIEU)
      references PHIEUMUON (IDPHIEU)
go

alter table PMSACH
   add constraint FK_PMSACH_REFERENCE_SACH foreign key (IDSACH)
      references SACH (IDSACH)
go

alter table SACH
   add constraint FK_SACH_REFERENCE_KHUNGPHA foreign key (IDKHUNGPL)
      references KHUNGPHANLOAI (IDKHUNGPL)
go

alter table SINHVIEN
   add constraint FK_SINHVIEN_REFERENCE_DOCGIA foreign key (IDDG)
      references DOCGIA (IDDG)
go


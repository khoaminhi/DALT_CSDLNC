use QLTVKHTN
go

--thêm 1 sách mới
create proc sp_ThemSach @idSach int,@CuonThu smallint,@idKhungPL int,@idPhieuMuon int,@idPhieuTra int,@TenSach nvarchar(50),@TinhTrangSach nvarchar(500),@Tap smallint,@TacGia nvarchar(50),@NgayXuatBan date,@NhaXuatBan nvarchar(50),@CapPhepMuon bit
as
begin
	insert into SACH values (@idSach,@CuonThu,@idKhungPL,@idPhieuMuon,@idPhieuTra,@TenSach,@TinhTrangSach,@Tap,@TacGia,@NgayXuatBan,@NhaXuatBan,@CapPhepMuon)
end
go

--Thêm 1 nhóm sách mới
create proc sp_ThemNhomSach @idNhomSach smallint,@TenNhomSach nvarchar(50)
as
begin
	insert into NHOMSACH values(@idNhomSach,@TenNhomSach)
end
go

--Thêm 1 khung sách mới
create proc sp_ThemKhungSach @idKhungPL int,@idNhomSach smallint,@TenKhungPL nvarchar(50)
as
begin
	insert into KHUNGPHANLOAI values(@idKhungPL,@idNhomSach,@TenKhungPL)
end
go

--Xem thông tin mượn sách của đọc giả
create proc sp_XemThongTinMuonSach @idDocGia int
as
begin
	select DG.TENDG,DG.SDTDG,TTV.NGAYHETHAN,PM.*,S.*
	from THETHUVIEN as TTV join (select IDDG,TENDG,SDTDG,IDTHE from DOCGIA) as DG
							on TTV.IDTHE = DG.IDTHE 
							join PHIEUMUON as PM
							on DG.IDDG = PM.IDDG
							join PHIEUTRA as PT
							on PM.IDPHIEUMUON = PT.IDPHIEUMUON
							join SACH as S
							on PM.IDPHIEUMUON = S.IDPHIEUMUON
	where DG.IDDG = @idDocGia
	order by PM.HETHAN desc
end



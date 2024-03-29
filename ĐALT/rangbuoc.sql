--rang buoc
use QLTVKHTN
go

--mỗi đọc giả chỉ được mượn 2 cuốn sách
create trigger update_sach on SACH for update
as
begin
	if (select COUNT(IDPHIEUMUON)
		from inserted
		group by IDPHIEUMUON) > 2
	begin
		rollback tran
	end
end
go

--Thời gian mượn tối đa 2 tuần(thời gian gia hạn 1 tuần) 
create trigger insert_PhieuMuon on PHIEUMUON for insert
as
begin
	--nếu ngày hết hạn nhỏ hơn ngày mượn thì rollback
	if (select HETHAN from inserted) < (select NGAYMUON from inserted)
	begin
		rollback tran
	end
	--nếu không có gia hạn mà thời gian mượn quá 14 ngày thì rollback
	if (select GIAHAN
		from inserted) = 0
	begin
		if ((select HETHAN from inserted) - (select NGAYMUON from inserted)) > 14
		begin
			rollback tran
		end	
	end
	--nếu có gia hạn mà thời gian mượn quá 21 ngày thì rollback 
	else
	begin
		if ((select HETHAN from inserted) - (select NGAYMUON from inserted)) > 21
		begin
			rollback tran
		end	
	end
end
go


create trigger update_PhieuMuon on PHIEUMUON for update
as
begin
	--nếu ngày hết hạn nhỏ hơn ngày mượn thì rollback
	if (select HETHAN from inserted) < (select NGAYMUON from inserted)
	begin
		rollback tran
	end
	--nếu không có gia hạn mà thời gian mượn quá 14 ngày thì rollback
	if (select GIAHAN
		from inserted) = 0
	begin
		if ((select HETHAN from inserted) - (select NGAYMUON from inserted)) > 14
		begin
			rollback tran
		end	
	end
	--nếu có gia hạn mà thời gian mượn quá 21 ngày thì rollback 
	else
	begin
		if ((select HETHAN from inserted) - (select NGAYMUON from inserted)) > 21
		begin
			rollback tran
		end	
	end
end
go

--Mỗi sinh viên có 1 MSSV duy nhất
alter table SINHVIEN add constraint unq_mssv unique(MSSV)

--Mỗi cán bộ có 1 mã cán bộ duy nhất
alter table CANBO add constraint unq_MaCanBo unique(MACB)

--Mỗi đọc giả có 1 email và sdt duy nhất
alter table DOCGIA add constraint unq_std unique(SDTDG)
alter table DOCGIA add constraint unq_email unique(EMAILDG)


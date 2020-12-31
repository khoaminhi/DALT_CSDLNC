USE QLTVKHTN
GO

--Cập nhật gia hạn ngày hết hạn mượn sách 
CREATE  PROCEDURE sp_capnhatGiaHan @idPhieuMuon INT = NULL
AS
BEGIN TRAN
	UPDATE dbo.PHIEUMUON
	SET HETHAN = DATEADD(WEEK, 3, NGAYMUON), GIAHAN = 1
	WHERE IDPHIEUMUON = @idPhieuMuon

	IF @@ERROR <> 0
		ROLLBACK TRAN
COMMIT TRAN
GO 

--EXEC dbo.sp_capnhatGiaHan @idPhieuMuon = 1 -- int

--Tính số tiền phạt
CREATE FUNCTION f_tinhTienPhat(@ngayHetHan date)
RETURNS int
AS 
BEGIN
	DECLARE @soNgayQuaHan INT = 0
	SET @soNgayQuaHan = DATEDIFF(DAY, @ngayHetHan, GETDATE())
	IF(@soNgayQuaHan > 0 AND @soNgayQuaHan <= 30)
	BEGIN 
		RETURN @soNgayQuaHan * 1000
	END
	ELSE IF(@soNgayQuaHan > 30)
	BEGIN
		RETURN (@soNgayQuaHan - 30) * 2000 + 30000
    END 

	RETURN 0
END
GO 

--SELECT dbo.f_tinhTienPhat('2020-11-30')
--GO


CREATE PROCEDURE sp_tinhTienPhat @idPhieuMuon INT = NULL
AS
BEGIN TRAN
	
	SELECT dbo.f_tinhTienPhat((SELECT HETHAN FROM dbo.PHIEUMUON WHERE @idPhieuMuon = IDPHIEUMUON))
	IF @@ERROR <> 0
		ROLLBACK TRAN
COMMIT TRAN
GO

--EXEC dbo.sp_tinhTienPhat @idPhieuMuon = 7 -- int
--GO


--Cập nhật ngày trả sách 
CREATE PROCEDURE sp_capnhatNgayTraSach @idPhieuTra DATE = NULL
AS
BEGIN TRAN
	UPDATE dbo.PHIEUTRA
	SET NGAYTRA = GETDATE()
	WHERE @idPhieuTra = IDPHIEUTRA

	IF @@ERROR <> 0
		ROLLBACK TRAN
COMMIT TRAN 
GO

--EXEC dbo.sp_capnhatNgayTraSach @idPhieuTra = 7 -- date 7 tra tre han nen bi phat tien
--GO


--Đọc thông tin sách(dựa vào ID sách và tập, cuốn thứ) 
CREATE PROCEDURE sp_docThongTinSach @idSach INT = NULL, @cuonThu SMALLINT = NULL
AS
BEGIN TRAN 
	SELECT IDSACH AS ISBN, CUONTHU AS 'Ban sao thu', TAP, TACGIA, NHAXUATBAN, NGAYXUATBAN 
	FROM dbo.SACH 
	WHERE  CAPPHEPMUON  = 1 AND IDSACH = @idSach AND CUONTHU = @cuonThu
	IF @@ERROR <> 0
		ROLLBACK TRAN
COMMIT TRAN
GO 

EXEC dbo.sp_docThongTinSach @idSach = 32436, -- int
                            @cuonThu = 1 -- smallint
GO


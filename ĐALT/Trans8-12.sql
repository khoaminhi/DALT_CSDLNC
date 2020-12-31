------------------Tao moi doc gia----------------------------
CREATE PROC sp_createReader @idthe INT,@tendg NVARCHAR(50),@sdt INT,@email NVARCHAR(50),@thamgia bit
AS	
BEGIN
    INSERT INTO dbo.DOCGIA
    (
        IDTHE,
        TENDG,
        SDTDG,
        EMAILDG,
        THAMGIALOP
    )
    VALUES
    (   @idthe,   -- IDTHE - int
        @tendg, -- TENDG - nvarchar(50)
        @sdt,   -- SDTDG - int
        @email, -- EMAILDG - nvarchar(50)
        @thamgia -- THAMGIALOP - bit
        )
END
-------------- Tao moi the thu vien --------------------
CREATE PROC sp_createCard @iddg INT
AS
BEGIN
	DECLARE @id INT
	SET @id = (SELECT MACB FROM dbo.CANBO WHERE IDDG=@iddg)
	IF(NOT EXISTS (SELECT * FROM dbo.CANBO WHERE IDDG=@iddg))
		INSERT INTO dbo.THETHUVIEN
		(
			NGAYHETHAN
		)
		VALUES
		(DATEADD(year,4,GETDATE())  -- NGAYHETHAN - date
			)
	ELSE
		INSERT INTO dbo.THETHUVIEN
		(
			IDTHE,
		    NGAYHETHAN
		)
		VALUES
		(@id,DATEADD(year,4,GETDATE()) -- NGAYHETHAN - date
		    )
END
----------------- Cap nhat tham gia lop hoc-------------------
CREATE PROC sp_active @iddg INT
AS
BEGIN
    UPDATE dbo.DOCGIA
	SET THAMGIALOP=1
	WHERE IDDG = @iddg

	EXEC sp_createCard @iddg
END
------------------ Tao phieu muon----------------------------
CREATE PROC sp_createBill @idsach1 int, @idsach2 INT, @iddg int
AS
BEGIN
    INSERT INTO dbo.PHIEUMUON
    (
        IDDG,
        NGAYMUON,
        GIAHAN,
        HETHAN
    )
    VALUES
    (   @iddg,         -- IDDG - int
        GETDATE(), -- NGAYMUON - date
        0,      -- GIAHAN - bit
        DATEADD(DAY,14,GETDATE())  -- HETHAN - date
        )
	DECLARE @iddm INT
	SET @iddm=(SELECT IDPHIEUMUON FROM dbo.PHIEUMUON WHERE IDDG=@iddg)
	UPDATE dbo.SACH
	SET IDPHIEUMUON=@iddm
	WHERE IDSACH=@idsach1
	UPDATE dbo.SACH
	SET IDPHIEUMUON=@iddm
	WHERE IDSACH=@idsach2
END
---------------Tao phieu tra-----------------
CREATE PROC sp_createBillBack @iddm INT 
AS
BEGIN
    INSERT INTO dbo.PHIEUTRA
    (
        IDPHIEUMUON,
        NGAYTRA
    )
    VALUES
    (   @iddm,        -- IDPHIEUMUON - int
        GETDATE() -- NGAYTRA - date
        )
	DECLARE @idpt INT
	SET @idpt =(SELECT IDPHIEUTRA FROM dbo.PHIEUTRA WHERE IDPHIEUMUON=@iddm)
	UPDATE dbo.SACH
	SET IDPHIEUTRA=@idpt
	WHERE IDPHIEUMUON=@iddm 
END

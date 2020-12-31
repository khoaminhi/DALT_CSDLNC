
CREATE PROC sp_updatedate @iddg int
AS
	UPDATE phieumuon
	SET GIAHAN=1
	WHERE IDDG=@iddg

UPDATE phieutra 
SET 
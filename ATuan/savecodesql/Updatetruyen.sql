Insert into truyen values(
	'16',
	N'Đa Số Đàn Ông Đều Là Trộm Cắp',
	'5',
	'2023-05-06',
	'4',
	N'',
	'1',
	N'Full',
	''
)
UPDATE truyen
SET anh_truyen = (SELECT BulkColumn FROM OPENROWSET(BULK N'F:\webdoctruyen\images\truyencuoi\dasodanongdeulatromcap.jpg', SINGLE_BLOB) AS ImageSource)
WHERE id_truyen = 16;

SELECT truyen.ten_truyen, nguoi_dung.nghe_danh, truyen.so_chuong
FROM truyen
INNER JOIN nguoi_dung ON truyen.id_nguoi_dung = nguoi_dung.id_nguoi_dung
WHERE ten_truyen LIKE '%<từ khóa tìm kiếm>%' OR nghe_danh LIKE '%<từ khóa tìm kiếm>%'


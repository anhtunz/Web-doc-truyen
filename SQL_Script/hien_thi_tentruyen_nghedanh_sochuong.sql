
/* Kết hợp 2 bảng truyen va nguoi dung de hien thi ra thong tin*/
SELECT truyen.ten_truyen, nguoi_dung.nghe_danh, truyen.so_chuong 
FROM truyen INNER JOIN nguoi_dung 
ON truyen.id_nguoi_dung = nguoi_dung.id_nguoi_dung
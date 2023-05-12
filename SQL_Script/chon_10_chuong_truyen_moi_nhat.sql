SELECT TOP 10 truyen.id_truyen, truyen.ten_truyen, chuong.ten_chuong
FROM truyen INNER JOIN chuong ON truyen.id_truyen = chuong.id_truyen
ORDER BY truyen.id_truyen DESC
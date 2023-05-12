ALTER TABLE chuong
ADD CONSTRAINT fk_chuong_id_truyen
 FOREIGN KEY (id_truyen)
 REFERENCES truyen (id_truyen);
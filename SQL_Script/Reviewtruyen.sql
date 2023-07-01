CREATE TABLE reviewtruyen (
    id_review INT PRIMARY KEY,
    id_the_loai INT,
    tieude NVARCHAR(255),
    FOREIGN KEY (id_the_loai) REFERENCES the_loai (id_the_loai)
);
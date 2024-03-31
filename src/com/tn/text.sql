CREATE TABLE giao_vien (
                           ma_gv int PRIMARY KEY AUTO_INCREMENT,
                           ho_ten VARCHAR(255),
                           luong DOUBLE,
                           gioi_tinh VARCHAR(25),
                           dia_chi VARCHAR(255)
);

CREATE TABLE tham_gia_de_tai (
                                 ma_gv INT,
                                 ma_dt INT,
                                 stt INT,
                                 ket_qua VARCHAR(255)
);

INSERT INTO giao_vien (ho_ten, luong, gioi_tinh, dia_chi)
VALUES
    ("Nguyễn Văn Ngọc", 10 , "Nam" , "HN"),
    ("Phạm Văn Nam", 12 , "Nam" , "DN"),
    ("Trần Văn Hải", 15 , "Nu" , "HP");

INSERT INTO tham_gia_de_tai (ma_gv, ma_dt, stt, ket_qua)
values
    (1, 1, 1, "OK"),
    (3, 1, 2, "OK"),
    (3, 1, 3, "OK"),
    (1, 1, 4, "OK"),
    (3, 1, 5, "OK");

-- câu 1:
SELECT ho_ten
FROM giao_vien
         LEFT JOIN tham_gia_de_tai ON giao_vien.ma_gv = tham_gia_de_tai.ma_gv
WHERE tham_gia_de_tai.ma_gv IS NULL;


--câu 2:
CREATE TABLE giao_vien (
                           id INT PRIMARY KEY AUTO_INCREMENT,
                           ho_ten VARCHAR(50),
                           luong FLOAT,
                           gioi_tinh VARCHAR(50)
);

CREATE TABLE bo_mon (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        ten_bo_mon VARCHAR(50),
                        dien_thoai VARCHAR(50),
                        truong_bo_mon INT,

                        FOREIGN KEY (truong_bo_mon) REFERENCES giao_vien(id)
);

-- Sử dụng JOIN
SELECT giao_vien.ho_ten
FROM giao_vien
         JOIN bo_mon ON giao_vien.id = bo_mon.truong_bo_mon;

-- Sử dụng truy vấn lồng
SELECT ho_ten
FROM giao_vien
WHERE id IN (SELECT truong_bo_mon FROM bo_mon);
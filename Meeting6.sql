USE db_meeting_6_office;
SHOW TABLES;
DESC jabatan;
DESC karyawan;

SELECT * FROM jabatan;

INSERT INTO jabatan VALUES
(null,"CEO"),
(null,"CTO"),
(null,"Product Manager"),
(null,"UI/UX Designer"),
(null,"Front End Dev"),
(null,"Back End Dev");

SELECT * FROM karyawan;
INSERT INTO karyawan VALUES
(null, "Jaelani", 32, "jaejae@mail.com", "Depok",2020, 80, 6),
(null, "Ambroise", 34, "broisebroise@mail.com", "Bintaro",2018, 80, 1),
(null, "Melinda", 26, "melmel@mail.com", "Jaksel",2019, 50, 2),
(null, "Gupi", 30, "gupi@mail.com", "Bintaro",2020, 100, 3),
(null, "Fadhli", 24, "dli@mail.com", "Bekasi",2019, 80, 4),
(null, "Nadhif", 24, "nadhif@mail.com", "Bintaro",2018, 90, 5),
(null, "Rafi", 22, "rafi@mail.com", "Jaksel",2018, 90, 5),
(null, "Adip", 25, "dipdip@mail.com", "Bintaro",2020, 80, 6);

INSERT INTO karyawan VALUES
(null, "Gery", 21, "jaejae@mail.com", "Bali",2020, 80, null);


SELECT * FROM karyawan
INNER JOIN jabatan ON karyawan.id_jabatan = jabatan.id_jabatan;

SELECT karyawan.nama as nama_karyawan, jabatan.nama as nama_jabatan FROM karyawan
INNER JOIN jabatan ON karyawan.id_jabatan = jabatan.id_jabatan;

SELECT * FROM karyawan
LEFT JOIN jabatan ON karyawan.id_jabatan = jabatan.id_jabatan;

SELECT * FROM tugas;
INSERT INTO tugas VALUES
(null, 6, "Membuat tampilan menggunakan React", "23/03/28"),
(null, 6, "Membuat tampilan menggunakan Vue", "23/03/28"),
(null, 5, "Membuat design project 1", "23/03/28");

SELECT * FROM karyawan
INNER JOIN jabatan ON karyawan.id_jabatan = jabatan.id_jabatan
INNER JOIN tugas ON karyawan.id_karyawan = tugas.id_karyawan;

SELECT k.nama as nama_karyawan, j.nama as nama_jabatan, t.nama as nama_tugas FROM karyawan k
INNER JOIN jabatan j ON k.id_jabatan = j.id_jabatan
INNER JOIN tugas t ON k.id_karyawan = t.id_karyawan;

SELECT * FROM inventaris;
INSERT INTO inventaris VALUES
(null, "Laptop"),
(null, "Printer"),
(null,"iPad");

SELECT * FROM tugas;
SELECT * FROM tugas_inventaris;

INSERT INTO tugas_inventaris VALUES
(null, 1, 1),
(null, 2, 1),
(null, 3, 1),
(null, 3, 2),
(null, 3, 3);

SELECT * FROM karyawan 
INNER JOIN jabatan ON karyawan.id_jabatan = jabatan.id_jabatan
INNER JOIN tugas ON karyawan.id_karyawan = tugas.id_karyawan
INNER JOIN tugas_inventaris ON tugas.id_tugas = tugas_inventaris.id_tugas
INNER JOIN inventaris ON tugas_inventaris.id_inventaris = inventaris.id_inventaris;

SELECT * FROM tugas
INNER JOIN tugas_inventaris ON tugas.id_tugas = tugas_inventaris.id_tugas
INNER JOIN inventaris ON tugas_inventaris.id_inventaris = inventaris.id_inventaris
INNER JOIN karyawan ON tugas.id_karyawan = karyawan.id_karyawan;

SELECT * FROM inventaris 
INNER JOIN tugas_inventaris ON inventaris.id_inventaris = tugas_inventaris.id_inventaris
INNER JOIN tugas ON tugas_inventaris.id_tugas = tugas.id_tugas;


SELECT * FROM karyawan;
SELECT AVG(umur) from karyawan;
SELECT count(alamat), alamat FROM karyawan GROUP BY alamat;
SELECT MIN(umur) from karyawan;
SELECT MAX(umur) from karyawan;
SELECT * FROM karyawan ORDER BY umur ASC;


SELECT * FROM karyawan WHERE umur > (SELECT AVG(umur) from karyawan);

SELECT * FROM karyawan WHERE umur > avg(umur);
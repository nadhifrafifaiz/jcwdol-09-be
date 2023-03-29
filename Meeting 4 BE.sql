USE db_test_office;
DESC pegawai;
DESC posisi;
INSERT INTO posisi VALUE 
(null, "CEO"),
(null, "CTO"),
(null, "Product Manager"),
(null, "UI/UX Designer"),
(null, "Front End Developer"),
(null, "Back End Developer");
SELECT * FROM posisi;

INSERT INTO pegawai VALUE
(null, "Edwin", 24, "winwin@mail.com", 90,"Surabaya", 2020, null);
-- (null, "Dhiya", 25, "dhiya@mail.com", 50,"Tangsel", 2021, 2),
-- (null, "Franka", 21, "franfran@mail.com", 60,"Tangsel", 2022, 3),
-- (null, "Fadhli", 24, "laylay@mail.com", 80,"Cikarang", 2020, 4),
-- (null, "Farhan", 24, "sulhan@mail.com", 90,"Depok", 2021, 5),
-- (null, "Ayyas", 21, "yasyas@mail.com", 70,"Cibiru", 2020, 6);

SELECT * FROM pegawai;

-- INNER JOIN
SELECT pegawai.nama, posisi.name FROM pegawai INNER JOIN posisi ON pegawai.idposisi = posisi.id;
SELECT peg.nama, pos.name FROM pegawai peg INNER JOIN posisi pos ON peg.idposisi = pos.id;


DESC task;
INSERT INTO task VALUES
(null, 1,"Cuci Piring", "2023/03/25"),
(null, 5,"Cuci Komputer", "2023/03/25"),
(null, 5,"Buat Komputer", "2023/03/25");
SELECT * FROM task;


SELECT * FROM pegawai 
JOIN posisi on pegawai.idposisi  = posisi.idposisi
JOIN task on pegawai.idpegawai = task.idpegawai;

-- ONE TO ONE  = Pegawait to posisi
-- ONE TO MANY = Pegawai to task
-- MANY TO MANY = task to inventory
DESC inventory;
INSERT INTO inventory VALUES
(null, "Laptop",10),
(null,"Printer",10),
(null,"Tablet",5);
DESC task_inventaris;
INSERT INTO task_inventaris VALUES
(null, 1,1),
(null, 2,1),
(null, 2,2),
(null, 3,3),
(null, 3,1),
(null, 3,2);

SELECT pegawai.nama,posisi.name, count(task.task),inventaris.name FROM pegawai 
JOIN posisi on pegawai.idposisi  = posisi.idposisi
JOIN task on pegawai.idpegawai = task.idpegawai
JOIN task_inventaris on task.idtask = task_inventaris.idtask
JOIN inventaris on inventaris.idinventaris = task_inventaris.idinventaris GROUP BY task.task; 

SELECT pegawai.nama,posisi.name, task.task,inventaris.name FROM pegawai 
JOIN posisi on pegawai.idposisi  = posisi.idposisi
JOIN task on pegawai.idpegawai = task.idpegawai
JOIN task_inventaris on task.idtask = task_inventaris.idtask
JOIN inventaris on inventaris.idinventaris = task_inventaris.idinventaris;

-- SUBQUERY
SELECT * FROM pegawai where kota="Tangsel" and usia>(SELECT avg(usia) from pegawai where kota="Tangsel");
SELECT * FROM pegawai;
SELECT avg(usia) from pegawai where kota="Tangsel";

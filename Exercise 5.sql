SHOW DATABASES;
USE purwadhika_student;
SHOW TABLES;

ALTER TABLE student ADD (gender VARCHAR(45) NOT NULL,
batch_code VARCHAR(45) NOT NULL,
phone_number VARCHAR(45),
alternative_phone_number VARCHAR(45)
);

SELECT * FROM student;

ALTER TABLE student CHANGE alternative_phone_number description VARCHAR(45);
ALTER TABLE student DROP COLUMN gender;

-----------------
USE purwadhika_branch;
SHOW tables;
select * from branches;

CREATE TABLE branches (
	id int NOT NULL,
    branch_name varchar(255) NOT NULL,
    pic varchar(255),
    address varchar(255),
    city varchar(255),
    province varchar(255),
    PRIMARY KEY (id)
);

alter table branches change id  id int not null auto_increment;

INSERT INTO branches VALUES(
null,"BTM","ANGEL","Nongsa","BATAM", "Kep. Riau"
),
(
null,"JKT","BUDI","MSIG Tower","Jakarta Selatan", "Jakarta"
);

UPDATE branches SET pic="Dono" WHERE branch_name = "BSD";
INSERT INTO branches VALUES(null,"BLI","Tono","Gianyar","Gianyar","Bali");

   

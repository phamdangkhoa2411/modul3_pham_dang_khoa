create database student_manager;
use student_manager;
create table class(
	id int not null auto_increment,
    name_student varchar(50) not null,
    primary key(id)
);
create table teacher(
	id int not null auto_increment,
    name_teacher varchar(50) not null,
    age int null,
    country varchar(255) null,
    primary key(id)
);
insert into class(name_student) values ("truong"), ("Khoa");
insert into teacher(name_teacher, age, country) values ("chientm", 24, "DN"),
("HaiTT", 24, "DN");
create database roujin;

use roujin;

CREATE TABLE tbl_user(

username varchar(10) primary key,
password varchar(125) not null,
picture varchar(255),
enabled boolean
);


select * from tbl_user;
select * from authorities;

delete from tbl_user where username = 'con';

delete from authorities where username = 'user';

delete from authorities where authority = 'admin2';

commit;

drop table authorities;

CREATE TABLE authorities(

	username varchar(10) not null,
	authority varchar(50)
);


INSERT INTO tbl_user(username,password) VALUES('user','0');
INSERT INTO authorities(username,authority) VALUES('user','admin');
INSERT INTO authorities(username,authority) VALUES('user','admin2');


ALTER TABLE authorities ADD CONSTRAINT FK_USERNAME FOREIGN KEY(username) REFERENCES tbl_user(username) ON DELETE CASCADE;


use roujin;



CREATE TABLE tbl_salutarium(

sequence bigint primary key auto_increment,
username varchar(10) not null,
name varchar(50) not null unique,
address varchar(100) not null unique,
fee int not null,
feature varchar(255),
description varchar(2000),
view bigint

);


select * from tbl_salutarium;
select * from tbl_file;

delete from tbl_salutarium where sequence = 1;
delete from tbl_salutarium;
delete from tbl_file;

drop table tbl_file;

use roujin;

CREATE TABLE tbl_file(

sequence bigint not null,
file_code varchar(10) not null unique,
file_origin_name varchar(255),
file_upload_name varchar(255)
);

ALTER table tbl_file add constraint FK_FILE_SEQ foreign key(sequence) REFERENCES tbl_salutarium(sequence) ON delete cascade;
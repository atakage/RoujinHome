create database roujin;

use roujin;

CREATE TABLE tbl_user(

username varchar(10) primary key,
password varchar(125) not null,
picture varchar(255),
grade varchar(10)
);


select * from tbl_user;

delete from tbl_user where id = 'admin';

commit;


CREATE TABLE authorities(

	username varchar(10) PRIMARY KEY,
	authority varchar(50)
);
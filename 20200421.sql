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

delete from tbl_user where username = 'user';

delete from authorities where username = 'user';

delete from authorities where authority = 'admin2';

commit;

drop table authorities;

CREATE TABLE authorities(

	username varchar(10) not null,
	authority varchar(50) unique
);


INSERT INTO tbl_user(username,password) VALUES('user','0');
INSERT INTO authorities(username,authority) VALUES('user','admin');
INSERT INTO authorities(username,authority) VALUES('user','admin2');


ALTER TABLE authorities ADD CONSTRAINT FK_USERNAME FOREIGN KEY(username) REFERENCES tbl_user(username) ON DELETE CASCADE;
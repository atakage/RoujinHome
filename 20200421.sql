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

SELECT tbl_user.username, authorities.authority from tbl_user inner join authorities
on tbl_user.username = authorities.username;


delete from tbl_user where username = 'con';

delete from authorities where username = 'user';

delete from authorities where authority = 'admin2';

commit;

drop table authorities;

CREATE TABLE authorities(

	username varchar(10) not null,
	authority varchar(50)
);

update authorities set authority = 'ROLE_admin' where username='admin';

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



use roujin;

CREATE TABLE tbl_file(

sequence bigint not null,
file_code varchar(10) not null unique,
file_origin_name varchar(255),
file_upload_name varchar(255),
main_image int
);

ALTER table tbl_file add constraint FK_FILE_SEQ foreign key(sequence) REFERENCES tbl_salutarium(sequence) ON delete cascade;

ALTER TABLE tbl_file ADD main_image int;

use roujin;

SELECT * FROM tbl_qa;
SELECT * FROM hibernate_sequence;

delete from tbl_qa;




with recursive CTE AS(
	SELECT id,p_id,complete,content,name,picture,sal_sequence,username FROM tbl_qa
    
    UNION
    
    SELECT t.id,t.p_id,t.complete,t.content,t.name,t.picture,t.sal_sequence,t.username FROM tbl_qa t
    INNER JOIN CTE c ON c.id = t.p_id
)
SELECT * FROM CTE;


SELECT * FROM tbl_qa WHERE complete = true order by p_id desc, groupId asc;
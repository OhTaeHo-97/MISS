create table member(
    member_id varchar2(30) primary KEY,
    member_pw varchar2(30) not null,
    auth CHAR(1) default 'N' not null CONSTRAINT check_auth CHECK(auth in('Y','N'))
);

drop table member;
insert into member(member_id, member_pw) values('test2', '1234');
insert into member values('admin', '1234', 'Y');
select * from member;
delete from member where member_id = 'test2';
delete from member where member_id = 'test3';
delete from member where member_id = 'test4';

create table admin(
    member_id varchar2(30),
    CONSTRAINT adminfk_1 FOREIGN KEY(member_id)
    REFERENCES member(member_id) on DELETE CASCADE
);

insert into admin values('admin');
select * from admin;
drop table admin;

create table consumer(
    member_id varchar2(20)not null UNIQUE,
    nickname varchar2(20) not null UNIQUE,
    address varchar2(100) not null,
    phoneNumber varchar2(15) not null unique,
    email varchar(40),
    CONSTRAINT consumerfk FOREIGN KEY(member_id)
    REFERENCES member(member_id) on DELETE CASCADE
);
ALTER table consumer modify (address varchar2(200));
ALTER table consumer add (postcode number(10));
ALTER table consumer add (better_address varchar(300));
ALTER table consumer add (reference varchar(100));

insert into consumer(member_id, nickname, address, phoneNumber, email) values('test2', 'test2', 'korea', '01012341234', 'test2@test.com');
select * from member;
drop table consumer;
select * from consumer;

create table board(
    board_id int primary key,
    title VARCHAR2(100),
    board_content VARCHAR2(400),
    writedate date default SYSDATE
);

drop table board;
select * from board;

insert into board(board_id, title, board_content) values(1, '2022/01/01 배송관련 공지', '2022/01/01 배송이 지연될 예정입니다.');
insert into board(board_id, title, board_content) values(2, '블랙 프라이데이 이벤트 기간안내', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(4, '1', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(5, '2', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(6, '3', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(7, '4', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(8, '5', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(9, '6', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(10, '7', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(11, '8', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(12, '9', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(13, '10', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(14, '11', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(15, '12', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(16, '13', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(17, '14', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(18, '15', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(19, '16', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(20, '17', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(21, '8', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(22, '9', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(23, '10', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(24, '11', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(25, '12', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(26, '13', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(27, '14', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(28, '15', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(29, '16', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(30, '17', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(31, '8', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(32, '9', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(33, '10', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(34, '11', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(35, '12', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(36, '13', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(37, '14', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(38, '15', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(39, '16', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(40, '17', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(41, '41', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(42, '42', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(43, '43', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(44, '44', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(45, '45', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(46, '46', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(47, '47', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(48, '48', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(49, '49', '2022/01/01 ~ 2022/01/14');
insert into board(board_id, title, board_content) values(50, '50', '2022/01/01 ~ 2022/01/14');


create table product(
    product_id int primary key,
    product_name varchar2(150) not null,
    price int not null,
    product_regdate date default SYSDATE,
    product_comment varchar(300) DEFAULT 'No Comments',
    product_pictureurl varchar(200) DEFAULT 'No images',
    product_category varchar(20),
    music_singer varchar(50),
    music_genre varchar(10),
    favorite_count int default 0,
    stock int default 0
);

select * from product;
drop table product;
drop table review;


create table review(
    review_id int primary key,
    product_id int,
    nickname varchar2(20),
    review_content varchar2(100) not null,
    review_date date default sysdate,
    CONSTRAINT reviewfk_1 FOREIGN KEY(product_id)
    REFERENCES product(product_id) on DELETE CASCADE,
    CONSTRAINT reviewfk_2 FOREIGN KEY(nickname)
    REFERENCES consumer(nickname) on DELETE CASCADE
);
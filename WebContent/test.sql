create table member(
    member_id varchar2(30) primary KEY,
    member_pw varchar2(30) not null,
    auth CHAR(1) default 'N' not null CONSTRAINT check_auth CHECK(auth in('Y','N'))
);

drop table member;
insert into member(member_id, member_pw) values('test', '1234');
insert into member values('admin', '1234', 'Y');
select * from member;
delete from member where member_id = 'test2';
delete from member where member_id = 'test3';

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

insert into consumer values('test', 'nick', 'korea', '01012345678', 'test@test.com');
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

create table product(
    product_id int primary key,
    product_name varchar2(100) not null,
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
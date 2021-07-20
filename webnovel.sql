--------- table drop ----------
drop table comment_board;
drop SEQUENCE seq_comment_board;

drop table web_novel_attach;
drop table web_novel_board;
drop SEQUENCE seq_novel_board;

drop table w_member_auth;
drop table w_member;
--------유미란-----------------------------
create table w_member(
    id VARCHAR2(50) not null primary key,
    password VARCHAR2(100) not null,
    name VARCHAR2(30),
    gender VARCHAR2(30),
    birthyy varchar2(50),
    birthmm varchar2(50),
    birthdd varchar2(50),
    mail1 varchar2(100),
    mail2 varchar2(100),
    phone VARCHAR2(30),
    address varchar2(200),
    regDate date default sysdate,
    updateDate date default sysdate,
    enabled char(1) default '1'
);

--SELECT wmem.id, password, name, enabled, regDate, updateDate, auth
--FROM w_member wmem LEFT OUTER JOIN w_member_auth auth on wmem.id = auth.id 
--WHERE wmem.id = 'aa';

create table w_member_auth(
    id VARCHAR2(50) not null,
    auth VARCHAR2(50) not null,
    constraint fk_member_auth foreign key(id) references w_member(id)
);

-- 회원 탈퇴 기능
-- update w_member set enabled = 0 where id = 'bb';

select * from w_member;
select * from w_member_auth;

commit;

--------------권지민----------------------------------------
CREATE TABLE web_novel_board (
   articleNO     number(10)     NOT NULL primary key, -- 글 번호
   parentNO      number(10)     NULL,     -- 부모글 번호
   title         varchar2(100)  not NULL, -- 글 제목
   genre        varchar2(100)   not NULL, -- 장르
   content       varchar2(4000) NULL,     -- 글 내용
   writeDate     date           default sysdate not NULL, -- 작성일
   modifyDate     date           default sysdate not NULL, -- 수정일
   ID            varchar2(10)   NULL      -- 아이디
);

create sequence seq_novel_board;

--insert into web_novel_board (articleNO, title, genre, content, fileName, writeDate, ID )
--VALUES(seq_novel_board.nextval, '별 헤는 밤', 'romance','별 하나에 추억과 별 하나에 사랑과 별 하나에 쓸쓸함', 'romance_2.png', '21/06/20', 'member1' );

----------웹에서 작품 생성 후 해당작품 articleNO를 parentNO로 해서 같은 id로 수정해서 insert 하고 commit
--insert into web_novel_board (articleNO, parentNO, title, genre, content, writeDate, ID )
--VALUES(seq_novel_board.nextval, 28, '1화 ttttttttt', 'thriller','ttttttttttttttttttttttttttttt', '21/07/15', 'tt' );
--insert into web_novel_board (articleNO, parentNO, title, genre, content, writeDate, ID )
--VALUES(seq_novel_board.nextval, 28, '2화 qwfttttt', 'thriller','qwftttttttasdfasdttttttttt', '21/07/16', 'tt' );

--select * from web_novel_board
--WHERE parentNO = 28;

--SELECT articleNO, parentNO, title, genre, content, imageFileName, id, writeDate, modifyDate from web_novel_board where rownum <= 5;

create table web_novel_attach ( 
      uuid varchar2(100) not null,
      uploadPath varchar2(200) not null,
      fileName varchar2(100) not null, 
      filetype char(1) default 'I',
      articleNO number(10,0)
);

alter table web_novel_attach add constraint pk_attach primary key (uuid); 

alter table web_novel_attach add constraint fk_board_attach foreign key (articleNO) references web_novel_board(articleNO);

select * from web_novel_attach;

--SELECT articleNO, parentNO, title, genre, content, id, writeDate, modifyDate
--			from web_novel_board
--			where genre = 'romance'
--			and rowNum <= 5
--			and parentNO is null;

commit;

--------------노재승----------------------------------------
create table comment_board(
    commentNO number(10),
    commenter varchar2(50) not null,
    commentText varchar2(1000) not null,
    commentDate date default sysdate,
    comment_update_Date date default sysdate,
    articleNO number(10) not null
);

create sequence seq_comment_board;

alter table comment_board add constraint pk_commentNO primary key(commentNO);
alter table comment_board add constraint fk_articleNO foreign key(articleNO) 
references web_novel_board(articleNO);

--insert into comment_board (commentNO, commenter, comment, commentDate, articleNO)
--values(01, '홍길동', '재미있습니다.', '21/06/29', 01);

select * from comment_board;
commit;
select
		commentNO, commenter, commentText, commentDate, comment_update_Date, articleNO
		from comment_board;

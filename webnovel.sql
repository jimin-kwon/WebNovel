--------- table drop ----------
drop table comment_board;
drop SEQUENCE seq_comment_board;

drop table web_novel_attach;
drop table web_novel_board;
drop SEQUENCE seq_novel_board;

drop table w_member_auth;
drop table w_member;
--------���̶�-----------------------------
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

-- ȸ�� Ż�� ���
-- update w_member set enabled = 0 where id = 'bb';

select * from w_member;
select * from w_member_auth;

commit;

--------------������----------------------------------------
CREATE TABLE web_novel_board (
   articleNO     number(10)     NOT NULL primary key, -- �� ��ȣ
   parentNO      number(10)     NULL,     -- �θ�� ��ȣ
   title         varchar2(100)  not NULL, -- �� ����
   genre        varchar2(100)   not NULL, -- �帣
   content       varchar2(4000) NULL,     -- �� ����
   writeDate     date           default sysdate not NULL, -- �ۼ���
   modifyDate     date           default sysdate not NULL, -- ������
   ID            varchar2(10)   NULL      -- ���̵�
);

create sequence seq_novel_board;

--insert into web_novel_board (articleNO, title, genre, content, fileName, writeDate, ID )
--VALUES(seq_novel_board.nextval, '�� ��� ��', 'romance','�� �ϳ��� �߾�� �� �ϳ��� ����� �� �ϳ��� ������', 'romance_2.png', '21/06/20', 'member1' );

----------������ ��ǰ ���� �� �ش���ǰ articleNO�� parentNO�� �ؼ� ���� id�� �����ؼ� insert �ϰ� commit
--insert into web_novel_board (articleNO, parentNO, title, genre, content, writeDate, ID )
--VALUES(seq_novel_board.nextval, 28, '1ȭ ttttttttt', 'thriller','ttttttttttttttttttttttttttttt', '21/07/15', 'tt' );
--insert into web_novel_board (articleNO, parentNO, title, genre, content, writeDate, ID )
--VALUES(seq_novel_board.nextval, 28, '2ȭ qwfttttt', 'thriller','qwftttttttasdfasdttttttttt', '21/07/16', 'tt' );

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

--------------�����----------------------------------------
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
--values(01, 'ȫ�浿', '����ֽ��ϴ�.', '21/06/29', 01);

select * from comment_board;
commit;
select
		commentNO, commenter, commentText, commentDate, comment_update_Date, articleNO
		from comment_board;

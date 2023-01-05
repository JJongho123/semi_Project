create table fresh_user (
	user_id	     	varchar2(20)	NOT NULL,
	user_pw		    varchar2(20)	NOT NULL,
	user_pw2		varchar2(20),	
	user_name		varchar2(20)	NOT NULL,
	user_phone1		varchar2(5)		NOT	NULL,
	user_phone2		varchar2(10)	NOT	NULL,
	user_zip_code	varchar2(10)	NOT	NULL,
	user_addr		varchar2(30)	NOT	NULL,
	user_year		number,
	user_month		number,
	user_day		number,
	user_gender		varchar2(10),
	user_email_f 	varchar2(15),
	user_email_b    varchar2(15),
	user_email_s    varchar2(15),
	PRIMARY KEY (user_id));
	
	select * from fresh_user;

	
	//drop table fresh_user purge;

----------------------------------------------------------
CREATE TABLE fresh_product (
   user_id           varchar2(20)   NOT NULL,
   pro_num   number ,
   pro_name   varchar2(30)      ,
   pro_price   number      ,
   pro_content   varchar2(2000)      ,
   pro_image   varchar2(50)      ,
   pro_temp		number	default 1,
   pro_weight	number  default 1,
   pro_time     number default 1,
   cart_quantity number default 1,
   pro_seq   number    default 0
);

select * from fresh_product WHERE ROWNUM <= 8;

select  * from (select * from fresh_product order by PRO_NUM desc) WHERE ROWNUM <= 8;

select * from fresh_product where PRO_NUM = 1;

select * from fresh_product;

drop table fresh_product purge;


--------------------------------------------------------------
PK 설정

alter table fresh_review add constraint pk_review_id foreign key(review_id)
references fresh_user(user_id) ON DELETE CASCADE;

alter table fresh_cart add constraint pk_cart_id2 foreign key(user_id)
references fresh_user(user_id) ON DELETE CASCADE;

alter table fresh_cart add constraint pk_cart_id2 foreign key(user_id)
references fresh_user(user_id) ON DELETE CASCADE;

alter table fresh_qna add constraint pk_cart_id3 foreign key(QNA_ID)
references fresh_user(user_id) ON DELETE CASCADE;





--------------------------------------------------------------
CREATE TABLE fresh_review (
   review_num   number   NOT NULL,
   review_id   varchar2(15)   NOT NULL,
   review_subject   varchar2(50),
   review_content   varchar2(2000),
   review_image   varchar2(100),
   readcount   number,
   review_date   date null
);



---------------------------------------------------------------
create table fresh_cart (
   user_id           varchar2(20)   NOT NULL,
   cart_num number,
   cart_quantity number default 1,
   cart_price number,
   cart_seq number,
   pro_num number,
   pro_name   varchar2(30)      ,
    pro_kind   varchar2(15)      ,
    pro_price   number      ,
    pro_content   varchar2(2000)      ,
    pro_image   varchar2(50)      ,
    pro_seq   number    default 0
);

select * from FRESH_CART;

drop table fresh_cart purge;





-------------------------------------------------------------

CREATE TABLE fresh_qna (

   QNA_NUM      number,
   QNA_ID      varchar2(15),
   QNA_SUBJECT      varchar2(30),
   QNA_CONTENT      varchar2(2000),
   QNA_FILE      varchar2(50),
   QNA_RE_REF      number,
   QNA_RE_LEV      number,
   QNA_RE_SEQ       number,
   QNA_READCOUNT    number,
   QNA_DATE      date
);

select * from fresh_qna;

---------------------------------------------------------------











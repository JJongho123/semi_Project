create table fresh_user (
	user_id	     	varchar2(20)	NOT NULL,
	user_pw		    varchar2(20)	NOT NULL,
	user_name		varchar2(20)	NOT NULL,
	user_phone_1	varchar2(5)		NOT	NULL,
	user_phone_2	varchar2(5)		NOT	NULL,
	user_phone_3	varchar2(5)		NOT	NULL,
	user_zip_code	varchar2(10)	NOT	NULL,
	user_addr_1		varchar2(30)	NOT	NULL,
	user_addr_2		varchar2(20)	NOT	NULL,
	user_year		number,
	user_month		number,
	user_day		number,
	user_gender		varchar2(10),
	user_email_f 	varchar2(15),
	user_email_b    varchar2(15),
	user_email_s    varchar2(15),
	PRIMARY KEY (user_id));
	
	select * from fresh_user;
	
	drop table fresh_user purge;
	
	select * from fresh_user where user_id = 'jongho1234';

----------------------------------------------------------
CREATE TABLE fresh_product (
   user_id	     	varchar2(20)	NOT NULL,
   pro_num   number ,
   pro_name   varchar2(30)      ,
   pro_kind   varchar2(15)      ,
   pro_price   number      ,
   pro_content   varchar2(2000)      ,
   pro_image   varchar2(50)      ,
   cart_quantity number default 1,
   pro_seq   number    default 0
);

select * from fresh_product where PRO_NUM = 1;

select * from fresh_product;

--------------------------------------------------------------
create table fresh_cart (
	user_id	     	varchar2(20)	NOT NULL,
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

select * from fresh_cart where USER_ID='admin1234';

select * from FRESH_CART;

drop table fresh_cart purge;

-------------------------------------------------------------
	create table FRESH_BOARD (
	board_num 	number ,
	board_id	varchar2(20) ,
	board_subject 	varchar2(50) ,
	board_content	varchar2(2000) ,
	board_file		varchar2(50) ,
	board_readcount number ,
	board_date		date ,
	PRIMARY KEY (board_num )
);


---------------------------------------------------------------

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
drop table fresh_qna;

---------------------------------------------------------
	
	
	





ALTER TABLE `fresh_orders` ADD CONSTRAINT `PK_FRESH_ORDERS` PRIMARY KEY (
	`order_num`,
	`pro_num`,
	`user_id`
);

ALTER TABLE `fresh_qna` ADD CONSTRAINT `PK_FRESH_QNA` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `fresh_cart` ADD CONSTRAINT `PK_FRESH_CART` PRIMARY KEY (
	`cart_num`,
	`pro_num`,
	`admin_id`
);

ALTER TABLE `fresh_user` ADD CONSTRAINT `PK_FRESH_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `fresh_product` ADD CONSTRAINT `PK_FRESH_PRODUCT` PRIMARY KEY (
	`pro_num`,
	`admin_id`
);

ALTER TABLE `fresh_orders_detail` ADD CONSTRAINT `PK_FRESH_ORDERS_DETAIL` PRIMARY KEY (
	`order_num`,
	`pro_num`,
	`user_id`
);

ALTER TABLE `fresh_admin` ADD CONSTRAINT `PK_FRESH_ADMIN` PRIMARY KEY (
	`admin_id`
);

ALTER TABLE `fresh_orders` ADD CONSTRAINT `FK_fresh_product_TO_fresh_orders_1` FOREIGN KEY (
	`pro_num`
)
REFERENCES `fresh_product` (
	`pro_num`
);

ALTER TABLE `fresh_orders` ADD CONSTRAINT `FK_fresh_user_TO_fresh_orders_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `fresh_user` (
	`user_id`
);

ALTER TABLE `fresh_qna` ADD CONSTRAINT `FK_fresh_user_TO_fresh_qna_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `fresh_user` (
	`user_id`
);

ALTER TABLE `fresh_cart` ADD CONSTRAINT `FK_fresh_product_TO_fresh_cart_1` FOREIGN KEY (
	`pro_num`
)
REFERENCES `fresh_product` (
	`pro_num`
);

ALTER TABLE `fresh_cart` ADD CONSTRAINT `FK_fresh_product_TO_fresh_cart_2` FOREIGN KEY (
	`admin_id`
)
REFERENCES `fresh_product` (
	`admin_id`
);

ALTER TABLE `fresh_product` ADD CONSTRAINT `FK_fresh_admin_TO_fresh_product_1` FOREIGN KEY (
	`admin_id`
)
REFERENCES `fresh_admin` (
	`admin_id`
);

ALTER TABLE `fresh_orders_detail` ADD CONSTRAINT `FK_fresh_orders_TO_fresh_orders_detail_1` FOREIGN KEY (
	`order_num`
)
REFERENCES `fresh_orders` (
	`order_num`
);

ALTER TABLE `fresh_orders_detail` ADD CONSTRAINT `FK_fresh_orders_TO_fresh_orders_detail_2` FOREIGN KEY (
	`pro_num`
)
REFERENCES `fresh_orders` (
	`pro_num`
);

ALTER TABLE `fresh_orders_detail` ADD CONSTRAINT `FK_fresh_orders_TO_fresh_orders_detail_3` FOREIGN KEY (
	`user_id`
)
REFERENCES `fresh_orders` (
	`user_id`
);


/* accountテーブル用シーケンス */
CREATE SEQUENCE account_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9999999999
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE account_seq
  OWNER TO postgres;
/* account_roleテーブル用シーケンス */
CREATE SEQUENCE account_role_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9999999999
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE account_role_seq
  OWNER TO postgres;
/* itemテーブル用シーケンス */
CREATE SEQUENCE item_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9999999
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE item_seq
  OWNER TO postgres;
/* item_categoryテーブル用シーケンス */
CREATE SEQUENCE item_category_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9999999
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE item_category_seq
  OWNER TO postgres;
/* paginationテーブル用シーケンス */
CREATE SEQUENCE pagination_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 99999999
  START 1
  CACHE 1;
ALTER TABLE pagination_seq
  OWNER TO postgres;

/* account_roleテーブル */
CREATE TABLE account_role
(
  role_id integer NOT NULL,
  role_name character varying(20),
  CONSTRAINT account_role_pk PRIMARY KEY (role_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE account_role
  OWNER TO postgres;

/* accountテーブル */
CREATE TABLE account
(
  user_id integer NOT NULL,
  user_name character varying(20),
  password character varying(100),
  display_name character varying(20),
  enabled boolean,
  role_id integer,
  CONSTRAINT account_pk PRIMARY KEY (user_id),
  CONSTRAINT account_role_fk FOREIGN KEY (role_id)
      REFERENCES account_role (role_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE account
  OWNER TO postgres;

/* item_categoryテーブル */
CREATE TABLE item_category
(
  id integer NOT NULL,
  name character varying(20),
  CONSTRAINT item_category_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE item_category
  OWNER TO postgres;

/* itemテーブル */
CREATE TABLE item
(
  id integer NOT NULL,
  name character varying(30),
  price integer,
  category_id integer,
  CONSTRAINT item_pk PRIMARY KEY (id),
  CONSTRAINT item_category_fk FOREIGN KEY (category_id)
      REFERENCES item_category (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE item
  OWNER TO postgres;

/* paginationテーブル */
CREATE TABLE pagination
(
  id integer NOT NULL,
  name character varying(30),
  "timestamp" timestamp without time zone,
  CONSTRAINT pagination_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE pagination
  OWNER TO postgres;

/* ユーザロール */
INSERT INTO account_role VALUES(nextVal('account_role_seq'),'ADMIN');
INSERT INTO account_role VALUES(nextVal('account_role_seq'),'USER');
INSERT INTO account_role VALUES(nextVal('account_role_seq'),'GUEST');
/* ユーザ */
/* user1 パスワード:pass1 */
INSERT INTO account VALUES(
	nextVAL('account_seq'),
	'user1',
	'$2a$10$VOcGBVvnCRHyNP01Uqg9k.Ip2MuBXvsXiHq5D.JiSH1QhqDt.rIrO', /*pass1*/
	'USER1',
	'TRUE',
	1);
/* user2 パスワード:pass2 */
INSERT INTO account VALUES(
	nextVAL('account_seq'),
	'user2',
	'$2a$10$hCv0bbGvdy10k6m2fpY6ouzFobwAObw/t0sfylHgbElla8BA1Tq4u', /*pass2*/
	'USER2',
	'TRUE',
	2);
/* user3 パスワード:pass3 */
INSERT INTO account VALUES(
	nextVAL('account_seq'),
	'user3',
	'$2a$10$AZrGU5nzQho8EOtiNj5HkuJywQgDUIvrgn.Id3anpWKCmEdC.PB3e', /*pass3*/
	'USER3',
	'TRUE',
	3);

/* 商品カテゴリ */
insert into item_category values(nextVal('item_category_seq'),'文房具');
insert into item_category values(nextVal('item_category_seq'),'雑貨');
insert into item_category values(nextVal('item_category_seq'),'パソコン周辺機器');

/* 商品 */
insert into item values(nextVal('item_seq'),'水性ボールペン(黒)',120,1);
insert into item values(nextVal('item_seq'),'水性ボールペン(赤)',120,1);
insert into item values(nextVal('item_seq'),'水性ボールペン(青)',120,1);
insert into item values(nextVal('item_seq'),'油性ボールペン(黒)',100,1);
insert into item values(nextVal('item_seq'),'油性ボールペン(赤)',100,1);
insert into item values(nextVal('item_seq'),'油性ボールペン(青)',100,1);
insert into item values(nextVal('item_seq'),'蛍光ペン(黄)',130,1);
insert into item values(nextVal('item_seq'),'蛍光ペン(赤)',130,1);
insert into item values(nextVal('item_seq'),'蛍光ペン(青)',130,1);
insert into item values(nextVal('item_seq'),'蛍光ペン(緑)',130,1);
insert into item values(nextVal('item_seq'),'鉛筆(黒)',100,1);
insert into item values(nextVal('item_seq'),'鉛筆(赤)',100,1);
insert into item values(nextVal('item_seq'),'色鉛筆(12色)',400,1);
insert into item values(nextVal('item_seq'),'色鉛筆(48色)',1300,1);
insert into item values(nextVal('item_seq'),'レザーネックレス',300,2);
insert into item values(nextVal('item_seq'),'ワンタッチ開閉傘',3000,2);
insert into item values(nextVal('item_seq'),'金魚風呂敷',500,2);
insert into item values(nextVal('item_seq'),'折畳トートバッグ',600,2);
insert into item values(nextVal('item_seq'),'アイマスク',900,2);
insert into item values(nextVal('item_seq'),'防水スプレー',500,2);
insert into item values(nextVal('item_seq'),'キーホルダ',800,2);
insert into item values(nextVal('item_seq'),'ワイヤレスマウス',900,3);
insert into item values(nextVal('item_seq'),'ワイヤレストラックボール',1300,3);
insert into item values(nextVal('item_seq'),'有線光学式マウス',500,3);
insert into item values(nextVal('item_seq'),'光学式ゲーミングマウス',4800,3);
insert into item values(nextVal('item_seq'),'有線ゲーミングマウス',3800,3);
insert into item values(nextVal('item_seq'),'USB有線式キーボード',1400,3);
insert into item values(nextVal('item_seq'),'無線式キーボード',1900,3);
/*ページネーション */
insert into pagination values(nextVal('pagination_seq'),'データA1',now());
insert into pagination values(nextVal('pagination_seq'),'データA2',now());
insert into pagination values(nextVal('pagination_seq'),'データA3',now());
insert into pagination values(nextVal('pagination_seq'),'データA4',now());
insert into pagination values(nextVal('pagination_seq'),'データA5',now());
insert into pagination values(nextVal('pagination_seq'),'データA6',now());
insert into pagination values(nextVal('pagination_seq'),'データA7',now());
insert into pagination values(nextVal('pagination_seq'),'データA8',now());
insert into pagination values(nextVal('pagination_seq'),'データA9',now());
insert into pagination values(nextVal('pagination_seq'),'データB1',now());
insert into pagination values(nextVal('pagination_seq'),'データB2',now());
insert into pagination values(nextVal('pagination_seq'),'データB3',now());
insert into pagination values(nextVal('pagination_seq'),'データB4',now());
insert into pagination values(nextVal('pagination_seq'),'データB5',now());
insert into pagination values(nextVal('pagination_seq'),'データB6',now());
insert into pagination values(nextVal('pagination_seq'),'データB7',now());
insert into pagination values(nextVal('pagination_seq'),'データB8',now());
insert into pagination values(nextVal('pagination_seq'),'データB9',now());
insert into pagination values(nextVal('pagination_seq'),'データC1',now());
insert into pagination values(nextVal('pagination_seq'),'データC2',now());
insert into pagination values(nextVal('pagination_seq'),'データC3',now());
insert into pagination values(nextVal('pagination_seq'),'データC4',now());
insert into pagination values(nextVal('pagination_seq'),'データC5',now());
insert into pagination values(nextVal('pagination_seq'),'データC6',now());
insert into pagination values(nextVal('pagination_seq'),'データC7',now());
insert into pagination values(nextVal('pagination_seq'),'データC8',now());
insert into pagination values(nextVal('pagination_seq'),'データC9',now());
insert into pagination values(nextVal('pagination_seq'),'データD1',now());
insert into pagination values(nextVal('pagination_seq'),'データD2',now());
insert into pagination values(nextVal('pagination_seq'),'データD3',now());
insert into pagination values(nextVal('pagination_seq'),'データD4',now());
insert into pagination values(nextVal('pagination_seq'),'データD5',now());
insert into pagination values(nextVal('pagination_seq'),'データD6',now());
insert into pagination values(nextVal('pagination_seq'),'データD7',now());
insert into pagination values(nextVal('pagination_seq'),'データD8',now());
insert into pagination values(nextVal('pagination_seq'),'データD9',now());
insert into pagination values(nextVal('pagination_seq'),'データE1',now());
insert into pagination values(nextVal('pagination_seq'),'データE2',now());
insert into pagination values(nextVal('pagination_seq'),'データE3',now());
insert into pagination values(nextVal('pagination_seq'),'データE4',now());
insert into pagination values(nextVal('pagination_seq'),'データE5',now());
insert into pagination values(nextVal('pagination_seq'),'データE6',now());
insert into pagination values(nextVal('pagination_seq'),'データE7',now());
insert into pagination values(nextVal('pagination_seq'),'データE8',now());
insert into pagination values(nextVal('pagination_seq'),'データE9',now());
insert into pagination values(nextVal('pagination_seq'),'データF1',now());
insert into pagination values(nextVal('pagination_seq'),'データF2',now());
insert into pagination values(nextVal('pagination_seq'),'データF3',now());
insert into pagination values(nextVal('pagination_seq'),'データF4',now());
insert into pagination values(nextVal('pagination_seq'),'データF5',now());
insert into pagination values(nextVal('pagination_seq'),'データF6',now());
insert into pagination values(nextVal('pagination_seq'),'データF7',now());
insert into pagination values(nextVal('pagination_seq'),'データF8',now());
insert into pagination values(nextVal('pagination_seq'),'データF9',now());
insert into pagination values(nextVal('pagination_seq'),'データG1',now());
insert into pagination values(nextVal('pagination_seq'),'データG2',now());
insert into pagination values(nextVal('pagination_seq'),'データG3',now());
insert into pagination values(nextVal('pagination_seq'),'データG4',now());
insert into pagination values(nextVal('pagination_seq'),'データG5',now());
insert into pagination values(nextVal('pagination_seq'),'データG6',now());
insert into pagination values(nextVal('pagination_seq'),'データG7',now());
insert into pagination values(nextVal('pagination_seq'),'データG8',now());
insert into pagination values(nextVal('pagination_seq'),'データG9',now());
insert into pagination values(nextVal('pagination_seq'),'データH1',now());
insert into pagination values(nextVal('pagination_seq'),'データH2',now());
insert into pagination values(nextVal('pagination_seq'),'データH3',now());
insert into pagination values(nextVal('pagination_seq'),'データH4',now());
insert into pagination values(nextVal('pagination_seq'),'データH5',now());
insert into pagination values(nextVal('pagination_seq'),'データH6',now());
insert into pagination values(nextVal('pagination_seq'),'データH7',now());
insert into pagination values(nextVal('pagination_seq'),'データH8',now());
insert into pagination values(nextVal('pagination_seq'),'データH9',now());
insert into pagination values(nextVal('pagination_seq'),'データI1',now());
insert into pagination values(nextVal('pagination_seq'),'データI2',now());
insert into pagination values(nextVal('pagination_seq'),'データI3',now());
insert into pagination values(nextVal('pagination_seq'),'データI4',now());
insert into pagination values(nextVal('pagination_seq'),'データI5',now());
insert into pagination values(nextVal('pagination_seq'),'データI6',now());
insert into pagination values(nextVal('pagination_seq'),'データI7',now());
insert into pagination values(nextVal('pagination_seq'),'データI8',now());
insert into pagination values(nextVal('pagination_seq'),'データI9',now());
insert into pagination values(nextVal('pagination_seq'),'データJ1',now());
insert into pagination values(nextVal('pagination_seq'),'データJ2',now());
insert into pagination values(nextVal('pagination_seq'),'データJ3',now());
insert into pagination values(nextVal('pagination_seq'),'データJ4',now());
insert into pagination values(nextVal('pagination_seq'),'データJ5',now());
insert into pagination values(nextVal('pagination_seq'),'データJ6',now());
insert into pagination values(nextVal('pagination_seq'),'データJ7',now());
insert into pagination values(nextVal('pagination_seq'),'データJ8',now());
insert into pagination values(nextVal('pagination_seq'),'データJ9',now());
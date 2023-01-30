-- 시퀀스 생성
DROP SEQUENCE SEQ_CATEGORY_CODE;
DROP SEQUENCE SEQ_MEMBER_CODE;
DROP SEQUENCE SEQ_CLASS_CODE;
DROP SEQUENCE SEQ_PAYMENT_CODE;

CREATE SEQUENCE SEQ_CATEGORY_CODE;
CREATE SEQUENCE SEQ_MEMBER_CODE;
CREATE SEQUENCE SEQ_CLASS_CODE;
CREATE SEQUENCE SEQ_PAYMENT_CODE;

-- 테이블 생성
DROP TABLE tbl_category CASCADE CONSTRAINTS;
DROP TABLE tbl_member CASCADE CONSTRAINTS;
DROP TABLE tbl_class CASCADE CONSTRAINTS;
DROP TABLE tbl_class_list CASCADE CONSTRAINTS;
DROP TABLE tbl_payment CASCADE CONSTRAINTS;
DROP TABLE tbl_payment_enroll;

-- category 테이블 생성
CREATE TABLE tbl_category
(
    category_code    NUMBER NOT NULL,
    category_name    VARCHAR2(30) NOT NULL,
    ref_category_code    NUMBER
);

COMMENT ON COLUMN tbl_category.category_code IS '카테고리코드';
COMMENT ON COLUMN tbl_category.category_name IS '카테고리명';
COMMENT ON COLUMN tbl_category.ref_category_code IS '상위카테고리코드';
COMMENT ON TABLE tbl_category IS '카테고리';

CREATE UNIQUE INDEX index_category_code ON tbl_category
( category_code );

ALTER TABLE tbl_category
 ADD CONSTRAINT pk_category_code PRIMARY KEY ( category_code )
 USING INDEX index_category_code;

ALTER TABLE tbl_category
 ADD CONSTRAINT fk_ref_category_code FOREIGN KEY ( ref_category_code )
 REFERENCES tbl_category ( category_code);

CREATE TABLE tbl_member
(
    member_code    NUMBER NOT NULL,
    member_name    VARCHAR2(30) NOT NULL,
    class_price    NUMBER NOT NULL,
    category_code    NUMBER NOT NULL,
    enrollment_status    CHAR(1) NOT NULL
);

COMMENT ON COLUMN tbl_member.member_code IS '회원번호';
COMMENT ON COLUMN tbl_member.member_name IS '회원이름';
COMMENT ON COLUMN tbl_member.class_price IS '수업금액';
COMMENT ON COLUMN tbl_member.category_code IS '카테고리코드';
COMMENT ON COLUMN tbl_member.enrollment_status IS '등록가능상태';
COMMENT ON TABLE tbl_member IS '회원';

CREATE UNIQUE INDEX index_member_code ON tbl_member
( member_code );

ALTER TABLE tbl_member
 ADD CONSTRAINT pk_member_code PRIMARY KEY ( member_code )
 USING INDEX index_member_code;

ALTER TABLE member_code
 ADD CONSTRAINT fk_category_code FOREIGN KEY ( category_code )
 REFERENCES tbl_category ( category_code );

CREATE TABLE tbl_class
(
    class_code    NUMBER NOT NULL,
    enroll_date    VARCHAR2(8) NOT NULL,
    enroll_time    VARCHAR2(8) NOT NULL,
    enroll_price    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_class.class_code IS '수업코드';
COMMENT ON COLUMN tbl_class.enroll_date IS '등록일자';
COMMENT ON COLUMN tbl_class.enroll_time IS '등록시간';
COMMENT ON COLUMN tbl_class.enroll_price IS '등록시 금액';
COMMENT ON TABLE tbl_class IS '수업';

CREATE UNIQUE INDEX index_class_code ON tbl_class
( class_code );

ALTER TABLE tbl_class
 ADD CONSTRAINT pk_class_code PRIMARY KEY ( class_code )
 USING INDEX index_class_code;

CREATE TABLE tbl_class_list
(
    class_code NUMBER NOT NULL,
    member_code    NUMBER NOT NULL,
    member_count    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_class_list.class_code IS '수업코드';
COMMENT ON COLUMN tbl_class_list.member_code IS '회원번호';
COMMENT ON COLUMN tbl_class_list.member_count IS '회원수';
COMMENT ON TABLE tbl_class_list IS '수업별 회원 리스트';
CREATE UNIQUE INDEX index_comp_order_class_code ON tbl_class_list
( class_code,member_code );

ALTER TABLE tbl_class_list
 ADD CONSTRAINT pk_comp_enroll_member_code PRIMARY KEY ( class_code, member_code )
 USING INDEX index_comp_enroll_member_code;

ALTER TABLE tbl_class_list
 ADD CONSTRAINT fk_enroll_member_class_code FOREIGN KEY ( class_code )
 REFERENCES tbl_class ( class_code );

ALTER TABLE tbl_class_list
 ADD CONSTRAINT fk_enroll_member_member_code FOREIGN KEY ( member_code )
 REFERENCES tbl_member ( member_code );
 
CREATE TABLE tbl_payment
(
    payment_code    NUMBER NOT NULL,
    payment_date    VARCHAR2(8) NOT NULL,
    payment_time    VARCHAR2(8) NOT NULL,
    payment_price    NUMBER NOT NULL,
    payment_type    VARCHAR2(6) NOT NULL
);

COMMENT ON COLUMN tbl_payment.payment_code IS '결제코드';
COMMENT ON COLUMN tbl_payment.payment_date IS '결제일';
COMMENT ON COLUMN tbl_payment.payment_time IS '결제시간';
COMMENT ON COLUMN tbl_payment.payment_price IS '결제금액';
COMMENT ON COLUMN tbl_payment.payment_type IS '결제구분';
COMMENT ON TABLE tbl_payment IS '결제';

CREATE UNIQUE INDEX index_payment_code ON tbl_payment
( payment_code );

ALTER TABLE tbl_payment
 ADD CONSTRAINT pk_payment_code PRIMARY KEY ( payment_code)
 USING INDEX index_payment_code;

CREATE TABLE tbl_payment_enroll
(
    enroll_code    NUMBER NOT NULL,
    payment_code    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_payment_enroll.class_code IS '등록코드';
COMMENT ON COLUMN tbl_payment_enroll.payment_code IS '결제코드';
COMMENT ON TABLE tbl_payment_enroll IS '결제별 등록';

CREATE UNIQUE INDEX index_comp_payment_enroll_code ON tbl_payment_enroll
( payment_code,enroll_code );

ALTER TABLE tbl_payment_enroll
 ADD CONSTRAINT pk_comp_payment_enroll_code PRIMARY KEY ( payment_code,enroll_code )
 USING INDEX index_comp_payment_enroll_code;

INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '평영', 1);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '배영', 1);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '자유형1(학생)', 2);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '자유형2(직장인)', 2);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '자유형3(일반)', 2);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '접영', 1);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '생존수영1', 3);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '생존수영2', 3);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '아쿠아로빅', 1);

INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '박연진', 120000, 2, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '전재준', 120000, 2, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '이사라', 120000, 2, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '최혜정', 120000, 2, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '손명오', 75000, 2, 'Y');

INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '김석진', 150000, 3, 'N');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '김남준', 150000, 3, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '정호석', 120000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '민윤기', 55000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '박지민', 75000, 2, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '김태형', 75000, 2, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '전정국', 200000, 2, 'Y');

INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '송은이', 80000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '안영미', 80000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '김신영', 80000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '홍현희', 80000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '조세호', 55000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '남창희', 75000, 2, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '이동욱', 75000, 2, 'Y');

INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '김준완', 95000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '안정원', 95000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '양석형', 95000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '채송화', 95000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '장겨울', 95000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '이익준', 95000, 1, 'Y');

INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '장준우', 80000, 1, 'N');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '장한서', 80000, 1, 'N');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '빈센조 까사노', 80000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '홍차영', 80000, 1, 'Y');
INSERT INTO TBL_MEMBER VALUES (SEQ_MEMBER_CODE.NEXTVAL, '최명희', 80000, 1, 'N');

COMMIT;

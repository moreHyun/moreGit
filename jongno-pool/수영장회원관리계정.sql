set feedback off
set define off

DROP TABLE S_CLASS CASCADE CONSTRAINTS;
PROMPT DROPPING S_TEACHER...
DROP TABLE S_TEACHER CASCADE CONSTRAINTS;
PROMPT DROPPING S_CLASS_TEACHER...
DROP TABLE S_CLASS_TEACHER CASCADE CONSTRAINTS;
PROMPT DROPPING S_MEMBER...
DROP TABLE S_MEMBER CASCADE CONSTRAINTS;
PROMPT DROPPING S_GRADE...
DROP TABLE S_GRADE CASCADE CONSTRAINTS;
  

PROMPT CREATING S_CLASS...  
CREATE TABLE "C##SWIM"."S_CLASS"
(
  CLASS_NO VARCHAR2(20) NOT NULL,
  CLASS_NAME VARCHAR2(60) NOT NULL,
  CLASS_TYPE VARCHAR2(20)
)
;

COMMENT ON COLUMN S_CLASS.CLASS_NO IS '수업 번호';
COMMENT ON COLUMN S_CLASS.CLASS_NAME IS '수업 이름';
COMMENT ON COLUMN S_CLASS.CLASS_TYPE IS '수업 구분';

ALTER TABLE CLASS
  ADD CONSTRAINT PK_CLASS PRIMARY KEY (CLASS_NO);
  

PROMPT CREATING S_TEACHER...
CREATE TABLE "C##SWIM"."S_TEACHER"
(  
  TEACHER_ID CHAR(10) NOT NULL,
  TEACHER_NAME VARCHAR2(40) NOT NULL,
  TEACHER_PHONE VARCHAR2(14),
  TEACHER_ADDRESS VARCHAR2(200),
  CLASS_NO VARCHAR2(20)
)
;
COMMENT ON COLUMN S_TEACHER.TEACHER_ID IS '강사 아이디';
COMMENT ON COLUMN S_TEACHER.TEACHER_NAME IS '강사 이름';
COMMENT ON COLUMN S_TEACHER.TEACHER_PHONE IS '강사 전화번호';
COMMENT ON COLUMN S_TEACHER.TEACHER_ADDRESS IS '강사 주소';
COMMENT ON COLUMN S_TEACHER.CLASS_NO IS '수업 번호';

ALTER TABLE S_TEACHER
  ADD CONSTRAINT PK_TEACHER PRIMARY KEY (TEACHER_ID);
ALTER TABLE S_TEACHER
  ADD CONSTRAINT FK_TEACHER_CLASSNO FOREIGN KEY (CLASS_NO)
  REFERENCES S_CLASS (CLASS_NO);
  
  
  
PROMPT CREATING S_CLASS_TEACHER...
CREATE TABLE S_CLASS_TEACHER
(
  CLASS_NO VARCHAR2(10) NOT NULL,
  TEACHER_ID VARCHAR2(10) NOT NULL
)
;
COMMENT ON COLUMN S_CLASS_TEACHER.CLASS_NO IS '수업 번호';
COMMENT ON COLUMN S_CLASS_TEACHER.TEACHER_ID IS '강사 아이디';

ALTER TABLE "C##SWIM"."S_CLASS_TEACHER" ADD CONSTRAINT "CLASS_TEACHER_PK" PRIMARY KEY ("CLASS_NO");
ALTER TABLE "C##SWIM"."S_CLASS_TEACHER" ADD CONSTRAINT "CLASS_TEACHER_PK" PRIMARY KEY ("TEACHER_ID");

PROMPT CREATING S_MEMBER...
CREATE TABLE S_MEMBER
(
  MEMBER_NO VARCHAR2(10) NOT NULL,
  INS_CLASS_NO VARCHAR2(10) NOT NULL,
  MEMBER_NAME VARCHAR2(40) NOT NULL,
  MEMBER_PHONE VARCHAR2(14) NOT NULL,
  MEMBER_ADDRESS VARCHAR2(200),
  CLASS_DATE DATE,
  BREAK_YN CHAR(1),
  COACH_TEACHER_ID VARCHAR2(20)
)
;

COMMENT ON COLUMN S_MEMBER.MEMBER_NO IS '회원 번호';
COMMENT ON COLUMN S_MEMBER.INS_CLASS_NO IS '회원 수업 번호';
COMMENT ON COLUMN S_MEMBER.MEMBER_NAME IS '회원 이름';
COMMENT ON COLUMN S_MEMBER.MEMBER_PHONE IS '회원 전화번호';
COMMENT ON COLUMN S_MEMBER.MEMBER_ADDRESS IS '회원 주소';
COMMENT ON COLUMN S_MEMBER.CLASS_DATE IS '등록 시기';
COMMENT ON COLUMN S_MEMBER.BREAK_YN IS '수업 중단 여부';
COMMENT ON COLUMN S_MEMBER.COACH_TEACHER_ID IS '담당 강사 아이디';

ALTER TABLE S_MEMBER
  ADD CONSTRAINT PK_MEMBER PRIMARY KEY(MEMBER_NO);
ALTER TABLE S_MEMBER
  ADD CONSTRAINT FK_MEMBER_01 FOREIGN KEY (INS_CLASS_NO)
  REFERENCES S_CLASS (CLASS_NO) ON DELETE SET NULL;
ALTER TABLE S_MEMBER
  ADD CONSTRAINT FK_MEMBER_02 FOREIGN KEY (COACH_TEACHER_ID)
  REFERENCES S_TEACHER (TEACHER_ID) ON DELETE SET NULL;
  

PROMPT CREATING S_GRADE...
CREATE TABLE S_GRADE
(
  MEMBER_NO VARCHAR2(10) NOT NULL,
  LEVEL VARCHAR2(10)
)
;

COMMENT ON COLUMN S_GRADE.MEMBER_NO IS '회원 이름';
COMMENT ON COLUMN S_GRADE.LEVEL IS '숙련도';

ALTER TABLE S_GRADE
  ADD CONSTRAINT PK_GRADE PRIMARY KEY(MEMBER_NO);
ALTER TABLE S_GRADE
  ADD CONSTRAINT FK_GRADE FOREIGN KEY(MEMBER_NO)
  REFERENCES S_MEMBER (MEMBER_NO);



PROMPT LOADING S_CLASS...
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('001','새벽 강습1','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('002','오전 강습1','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('003','오전 강습2','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('004','오후 강습','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('005','저녁 강습1','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('006','새벽 강습2','배영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('007','저녁 강습2','배영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('011','직장인을 위한 자유수영','자유형');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('012','직장인을 위한 자유수영','자유형');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('013','모두를 위한 생존 수영','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('014','학생을 위한 생존 수영','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('015','고급 강습','접영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('016','중급 강습','접영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('021','인명 구조 자격증 취득반 1','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('022','인명 구조 자격증 취득반 2','평영');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('031','아쿠아로빅');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('032','자유수영1');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('033','자유수영2');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('034','자유수영3');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('035','자유수영4');
INSERT INTO S_CLASS (CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('036','자유수영5');
COMMIT;

PROMPT LOADING S_TEACHER...
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I001', '서강준', '010-1234-5678', '경기도 군포시 산본동', '021');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I002', '차은우', '010-1234-5679', '경기도 군포시 산본동', '011');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I003', '김석진', '010-1235-4679', '서울특별시 송파구 방이동', '005');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I004', '문동은', '010-1243-5678', '경기도 세명시 세명로 71 에덴빌라 301호', '014');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I005', '김다비', '010-1324-5678', '대구직할시 중구 남산4동', '031');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I006', '진도준', '010-1234-5768', '서울특별시 서초구 방배동 233-1', '016');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I007', '천지훈', '010-1236-5478', '', '012');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I008', '백마리', '010-2134-5678', '서울특별시 종로구 평창동', '013');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I009', '이수혁', '010-4321-5678', '경기도 과천시 코오롱로 53', '007');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I010', '김우빈', '010-5678-1234', '전라북도 전주시 완산구', '022');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I011', '김종국', '010-1234-8765', '서울특별시 강남구 논현동', '015');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I012', '주여정', '010-4123-5867', '경기도 세명시 세명로', '001');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I013', '신하리', '010-8348-9139', '서울특별시 종로구', '002');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I014', '강태무', '010-5347-1325', '서울특별시 서초구 방배동', '006');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I015', '이익준', '010-6524-1344', '서울특별시 강서구', '004');
INSERT INTO S_TEACHER (TEACHER_ID, TEACHER_NAME, TEACHER_PHONE, TEACHER_ADDRESS, CLASS_NO)
VALUES ('I016', '빈센조 까사노', '010-3513-5624', '', '003');
COMMIT;

PROMPT LOADING S_CLASS_TEACHER...
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('001', 'I012');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('002', 'I013');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('003', 'I016');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('004', 'I015');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('005', 'I003');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('006', 'I014');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('007', 'I009');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('011', 'I002');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('012', 'I007');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('013', 'I008');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('014', 'I004');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('015', 'I011');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('016', 'I006');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('021', 'I001');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('022', 'I010');
INSERT INTO S_CLASS_TEACHER (CLASS_NO, TEACHER_ID)
VALUES('031', 'I005');
COMMIT;

PROMPT LOADING S_MEMBER...
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('S001', '014', '박연진', '010-9676-4638', '경기도 세명시 세명로 70', to_date('30-12-2022', 'dd-mm-yyyy'), 'N', 'I004');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('S002', '014', '전재준', '010-8547-7867', '경기도 용인시', to_date('30-12-2022', 'dd-mm-yyyy'), 'N', 'I004');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('S003', '014', '이사라', '010-8998-7668', '경기도 용인시', to_date('30-12-2022', 'dd-mm-yyyy'), 'N', 'I004');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('S004', '014', '최혜정', '010-7665-9090', '서울특별시 강서구 마곡동', to_date('30-12-2022', 'dd-mm-yyyy'), 'N', 'I004');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('S005', '014', '손명오', '010-7425-4958', '서울특별시 종로구 을서로 34-9', to_date('30-12-2022', 'dd-mm-yyyy'), 'Y', 'I004');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J001', '021', '유일', '010-4955-2349', '', to_date('13-08-2022', 'dd-mm-yyyy'), 'N', 'I001');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J002', '021', '공명', '010-3951-3291', '경기도 구리시', to_date('14-08-2022', 'dd-mm-yyyy'), 'N', 'I001');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J003', '021', '강태오', '010-9458-3943', '인천광역시', to_date('13-09-2022', 'dd-mm-yyyy'), 'Y', 'I001');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J004', '021', '이태환', '010-4252-3425', '서울특별시 동대문구', to_date('13-09-2022', 'dd-mm-yyyy'), 'N', 'I001');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F001', '011', '김명준', '010-3351-1351', '경기도 수원시', to_date('09-05-2022', 'dd-mm-yyyy'), 'N', 'I002');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F002', '011', '박진우', '010-4135-3153', '경기도 고양시 일산서구 주엽동', to_date('23-02-2016', 'dd-mm-yyyy'), 'Y', 'I002');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F003', '011', '문빈', '010-0901-3193', '충청북도 청주시 서원구 분평동', to_date('26-01-2023', 'dd-mm-yyyy'), 'N', 'I002');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F004', '011', '윤산하', '010-9626-4584', '서울특별시 노원구 하계동', to_date('21-03-2020', 'dd-mm-yyyy'), 'N', 'I002');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F005', '005', '김남준', '010-3413-6467', '경기도 고양시 일산서구 일산동', to_date('12-09-2020', 'dd-mm-yyyy'), 'N', 'I003');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F006', '005', '민윤기', '010-3415-8468', '대구광역시 북구 태전동', to_date('09-03-2021', 'dd-mm-yyyy'), 'N', 'I003');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F007', '005', '정호석', '010-9459-8290', '광주광역시 북구 일곡동', to_date('18-02-2021', 'dd-mm-yyyy'), 'N', 'I003');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F008', '005', '김태형', '010-5349-5429', '대구광역시 서구 비산동', to_date('31-12-2021', 'dd-mm-yyyy'), 'N', 'I003');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F009', '005', '박지민', '010-3513-3433', '부산광역시 금정구 회동동', to_date('13-10-2020', 'dd-mm-yyyy'), 'N', 'I003');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F010', '005', '전정국', '010-6668-6855', '부산광역시 북구 만덕동', to_date('01-09-2019', 'dd-mm-yyyy'), 'N', 'I003');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F011', '031', '송은이', '010-1535-1416', '서울특별시 양천구 신정동', to_date('11-08-2018', 'dd-mm-yyyy'), 'N', 'I005');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F012', '031', '안영미', '010-2342-4161', '경기도 의정부시 호원동', to_date('10-09-2019', 'dd-mm-yyyy'), 'N', 'I005');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F013', '031', '신봉선', '010-7357-4364', '서울특별시 영등포구 국회대로54길 10', to_date('01-10-2020', 'dd-mm-yyyy'), 'N', 'I005');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F014', '031', '홍현희', '010-9345-1353', '', to_date('01-09-2019', 'dd-mm-yyyy'), 'N', 'I005');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F015', '031', '조세호', '010-1353-1664', '서울특별시 마포구 현석동', to_date('01-07-2021', 'dd-mm-yyyy'), 'N', 'I005');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F016', '016', '진성준', '010-5325-3214', '서울특별시 중구 소공동 250', to_date('18-05-2022', 'dd-mm-yyyy'), 'Y', 'I006');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F017', '016', '진윤기', '010-2344-3121', '서울특별시 서초구 방배동 233-1', to_date('04-07-2022', 'dd-mm-yyyy'), 'N', 'I006');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F018', '016', '진형준', '010-3431-8686', '서울특별시 서초구 방배동 233-1', to_date('04-07-2022', 'dd-mm-yyyy'), 'Y', 'I006');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F019', '016', '레이첼', '010-4665-4624', '미국', to_date('04-05-2021', 'dd-mm-yyyy'), 'N', 'I006');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F020', '016', '모현민', '010-9584-1435', '', to_date('26-11-2021', 'dd-mm-yyyy'), 'Y', 'I006');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F021', '012', '사무장', '010-3517-7694', '서울특별시', to_date('30-01-2016', 'dd-mm-yyyy'), 'Y', 'I007');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F022', '012', '나예진', '010-7556-9134', '서울특별시 강남구', to_date('04-10-2021', 'dd-mm-yyyy'), 'Y', 'I007');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F023', '012', '이주영', '010-5633-0913', '서울특별시 강남구', to_date('16-06-2016', 'dd-mm-yyyy'), 'N', 'I007');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F024', '013', '서민혁', '010-8345-3094', '서울특별시 중구', to_date('16-03-2017', 'dd-mm-yyyy'), 'Y', 'I008');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F025', '013', '오민아', '010-6495-3313', '서울특별시 종로구 평창동', to_date('06-05-2018', 'dd-mm-yyyy'), 'Y', 'I008');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F026', '013', '서영준', '010-2234-1234', '서울특별시 중구', to_date('16-03-2017', 'dd-mm-yyyy'), 'Y', 'I008');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J005', '022', '신민아', '010-3255-6466', '경기도 성남시 분당구', to_date('22-07-2015', 'dd-mm-yyyy'), 'Y', 'I010');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J006', '022', '조인성', '010-5643-4524', '서울특별시 송파구 신천동', to_date('25-10-2020', 'dd-mm-yyyy'), 'Y', 'I010');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J007', '022', '이광수', '010-1234-0596', '경기도 남양주시', to_date('20-07-2018', 'dd-mm-yyyy'), 'Y', 'I010');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('J008', '022', '차태현', '010-4613-3613', '서울특별시 강남구 일원동', to_date('20-05-2018', 'dd-mm-yyyy'), 'Y', 'I010');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F027', '007', '손나은', '010-0103-0344', '서울특별시 강남구 압구정동', to_date('08-04-2022', 'dd-mm-yyyy'), 'Y', 'I009');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F028', '007', '권지용', '010-3355-1945', '서울특별시 용산구 한남동', to_date('18-08-2022', 'dd-mm-yyyy'), 'Y', 'I009');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F029', '007', '김영광', '010-7766-1895', '인천광역시 미추홀구 용현동', to_date('11-01-2023', 'dd-mm-yyyy'), 'Y', 'I009');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F030', '015', '지석진', '010-0492-1045', '서울특별시 서초구 잠원동', to_date('10-02-2022', 'dd-mm-yyyy'), 'Y', 'I011');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F031', '015', '유재석', '010-4235-4290', '서울특별시 강남구 압구정동', to_date('14-08-2017', 'dd-mm-yyyy'), 'Y', 'I011');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F032', '015', '송지효', '010-5867-2986', '서울특별시 마포구', to_date('15-08-2018', 'dd-mm-yyyy'), 'Y', 'I011');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F033', '015', '하동훈', '010-9244-4950', '서울특별시 마포구 서교동', to_date('25-08-2018', 'dd-mm-yyyy'), 'Y', 'I011');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F034', '015', '양세찬', '010-9409-4954', '서울특별시 용산구', to_date('08-12-2022', 'dd-mm-yyyy'), 'Y', 'I011');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F035', '015', '전소민', '010-4514-1433', '서울특별시 용산구', to_date('07-04-2022', 'dd-mm-yyyy'), 'Y', 'I011');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F036', '001', '하도영', '010-6834-3919', '경기도 세명시 세명로 70', to_date('05-01-2023', 'dd-mm-yyyy'), 'N', 'I012');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F037', '001', '안정미', '010-9832-3149', '경기도 세명시 세명로', to_date('03-01-2023', 'dd-mm-yyyy'), 'Y', 'I012');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F038', '001', '김종헌', '010-3444-5353', '', to_date('04-01-2023', 'dd-mm-yyyy'), 'Y', 'I012');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F039', '002', '진영서', '010-1394-0999', '서울특별시 종로구 평창동', to_date('09-07-2018', 'dd-mm-yyyy'), 'Y', 'I013');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F040', '002', '신하민', '010-3411-7646', '경기도 성남시', to_date('30-03-2018', 'dd-mm-yyyy'), 'Y', 'I013');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F041', '002', '이민우', '010-8849-4090', '서울특별시 중구', to_date('11-05-2021', 'dd-mm-yyyy'), 'N', 'I013');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F042', '006', '차성훈', '010-7844-3432', '서울특별시 강서구', to_date('09-07-2018', 'dd-mm-yyyy'), 'Y', 'I014');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F043', '006', '조유정', '010-5433-3902', '서울특별시 용산구 한남동', to_date('09-01-2023', 'dd-mm-yyyy'), 'Y', 'I014');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F044', '006', '계빈', '010-9348-3265', '', to_date('01-12-2023', 'dd-mm-yyyy'), 'Y', 'I014');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F045', '004', '김준완', '010-9318-9682', '서울특별시 강서구', to_date('12-03-2020', 'dd-mm-yyyy'), 'Y', 'I015');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F046', '004', '안정원', '010-5986-2485', '서울특별시 종로구', to_date('28-05-2020', 'dd-mm-yyyy'), 'Y', 'I015');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F047', '004', '양석형', '010-3874-4268', '서울특별시 종로구', to_date('12-03-2020', 'dd-mm-yyyy'), 'Y', 'I015');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F048', '004', '채송화', '010-6477-9485', '서울특별시 강남구', to_date('28-05-2020', 'dd-mm-yyyy'), 'Y', 'I015');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F049', '004', '장겨울', '010-8495-4398', '서울특별시 영등포구', to_date('30-05-2020', 'dd-mm-yyyy'), 'Y', 'I015');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F050', '003', '홍차영', '010-5364-5478', '서울특별시 종로구 청계천로', to_date('02-05-2021', 'dd-mm-yyyy'), 'Y', 'I016');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F051', '003', '남주성', '010-6324-0429', '서울특별시 종로구 청계천로', to_date('20-02-2021', 'dd-mm-yyyy'), 'Y', 'I016');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F052', '003', '장준우', '010-8754-0042', '서울특별시 강남구', to_date('13-05-2021', 'dd-mm-yyyy'), 'N', 'I016');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F053', '003', '장한서', '010-1643-9488', '서울특별시 강남구', to_date('29-05-2021', 'dd-mm-yyyy'), 'N', 'I016');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F054', '003', '안기석', '010-7643-7524', '서울특별시 종로구 청계천로', to_date('19-04-2021', 'dd-mm-yyyy'), 'Y', 'I016');
INSERT INTO S_MEMBER (MEMBER_NO, INS_CLASS_NO, MEMBER_NAME, MEMBER_PHONE, MEMBER_ADDRESS, CLASS_DATE, BREAK_YN, COACH_TEACHER_ID)
VALUES('F055', '003', '최명희', '010-6743-4577', '서울특별시 용산구', to_date('30-08-2022', 'dd-mm-yyyy'), 'N', 'I016');
COMMIT;

INSERT INTO S_GRADE
VALUES('S001', '중');
INSERT INTO S_GRADE
VALUES('S002', '중');
INSERT INTO S_GRADE
VALUES('S003', '하');
INSERT INTO S_GRADE
VALUES('S004', '상');
INSERT INTO S_GRADE
VALUES('S005', '중');
INSERT INTO S_GRADE
VALUES('J001', '상');
INSERT INTO S_GRADE
VALUES('J002', '상');
INSERT INTO S_GRADE
VALUES('J003', '상');
INSERT INTO S_GRADE
VALUES('J004', '상');
INSERT INTO S_GRADE
VALUES('J005', '상');
INSERT INTO S_GRADE
VALUES('J006', '상');
INSERT INTO S_GRADE
VALUES('J007', '상');
INSERT INTO S_GRADE
VALUES('J008', '상');
INSERT INTO S_GRADE
VALUES('F001', '중');
INSERT INTO S_GRADE
VALUES('F002', '중');
INSERT INTO S_GRADE
VALUES('F003', '하');
INSERT INTO S_GRADE
VALUES('F004', '하');
INSERT INTO S_GRADE
VALUES('F005', '하');
INSERT INTO S_GRADE
VALUES('F006', '상');
INSERT INTO S_GRADE
VALUES('F007', '중');
INSERT INTO S_GRADE
VALUES('F008', '하');
INSERT INTO S_GRADE
VALUES('F009', '하');
INSERT INTO S_GRADE
VALUES('F010', '중');
INSERT INTO S_GRADE
VALUES('F011', '상');
INSERT INTO S_GRADE
VALUES('F012', '하');
INSERT INTO S_GRADE
VALUES('F013', '하');
INSERT INTO S_GRADE
VALUES('F014', '중');
INSERT INTO S_GRADE
VALUES('F015', '상');
INSERT INTO S_GRADE
VALUES('F016', '상');
INSERT INTO S_GRADE
VALUES('F017', '중');
INSERT INTO S_GRADE
VALUES('F018', '하');
INSERT INTO S_GRADE
VALUES('F019', '하');
INSERT INTO S_GRADE
VALUES('F020', '중');
INSERT INTO S_GRADE
VALUES('F021', '상');
INSERT INTO S_GRADE
VALUES('F022', '상');
INSERT INTO S_GRADE
VALUES('F023', '중');
INSERT INTO S_GRADE
VALUES('F024', '하');
INSERT INTO S_GRADE
VALUES('F025', '하');
INSERT INTO S_GRADE
VALUES('F026', '하');
INSERT INTO S_GRADE
VALUES('F027', '중');
INSERT INTO S_GRADE
VALUES('F028', '하');
INSERT INTO S_GRADE
VALUES('F029', '하');
INSERT INTO S_GRADE
VALUES('F030', '중');
INSERT INTO S_GRADE
VALUES('F031', '중');
INSERT INTO S_GRADE
VALUES('F032', '중');
INSERT INTO S_GRADE
VALUES('F033', '중');
INSERT INTO S_GRADE
VALUES('F034', '중');
INSERT INTO S_GRADE
VALUES('F035', '상');
INSERT INTO S_GRADE
VALUES('F036', '상');
INSERT INTO S_GRADE
VALUES('F037', '하');
INSERT INTO S_GRADE
VALUES('F038', '중');
INSERT INTO S_GRADE
VALUES('F039', '하');
INSERT INTO S_GRADE
VALUES('F040', '중');
INSERT INTO S_GRADE
VALUES('F041', '상');
INSERT INTO S_GRADE
VALUES('F042', '하');
INSERT INTO S_GRADE
VALUES('F043', '중');
INSERT INTO S_GRADE
VALUES('F044', '상');
INSERT INTO S_GRADE
VALUES('F045', '하');
INSERT INTO S_GRADE
VALUES('F046', '하');
INSERT INTO S_GRADE
VALUES('F047', '하');
INSERT INTO S_GRADE
VALUES('F048', '중');
INSERT INTO S_GRADE
VALUES('F049', '중');
INSERT INTO S_GRADE
VALUES('F050', '중');
INSERT INTO S_GRADE
VALUES('F051', '하');
INSERT INTO S_GRADE
VALUES('F052', '중');
INSERT INTO S_GRADE
VALUES('F053', '중');
INSERT INTO S_GRADE
VALUES('F054', '중');
INSERT INTO S_GRADE
VALUES('F055', '상');
COMMIT;

set feedback on
set define on
prompt 데이터 입력을 완료했습니다.
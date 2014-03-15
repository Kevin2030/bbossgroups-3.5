
create user cmsnew identified by cmsnew default tablespace users temporary tablespace temp;
grant dba to cmsnew;
grant connect to cmsnew;
drop table test;
CREATE TABLE TEST
(
  NAME  VARCHAR2(4000),
  ID    VARCHAR2(100)
);
drop table test1;
CREATE TABLE TEST1
(
  A  VARCHAR2(12)
);

DROP SEQUENCE SEQ_TEST;

CREATE SEQUENCE SEQ_TEST
  START WITH 160
  MAXVALUE 999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  CACHE 20
  NOORDER;

drop table TABLEINFO cascade constraints
/
CREATE TABLE TABLEINFO
(
  TABLE_NAME          VARCHAR2(255)        NOT NULL,
  TABLE_ID_NAME       VARCHAR2(255),
  TABLE_ID_INCREMENT  NUMBER(5)                 DEFAULT 1,
  TABLE_ID_VALUE      NUMBER(20)                DEFAULT 0,
  TABLE_ID_GENERATOR  VARCHAR2(255),
  TABLE_ID_TYPE       VARCHAR2(255),
  TABLE_ID_PREFIX     VARCHAR2(255)
);

COMMENT ON TABLE TABLEINFO IS '表信息维护对象';

COMMENT ON COLUMN TABLEINFO.TABLE_NAME IS '表名称';


COMMENT ON COLUMN TABLEINFO.TABLE_ID_NAME IS '表的主键名称';

COMMENT ON COLUMN TABLEINFO.TABLE_ID_INCREMENT IS '表的主键递增量
缺省为1';

COMMENT ON COLUMN TABLEINFO.TABLE_ID_VALUE IS '主键当前值：缺省为0';

COMMENT ON COLUMN TABLEINFO.TABLE_ID_GENERATOR IS '自定义表主键生成机制
必需从
com.frameworkset.common.poolman.sql.PrimaryKey集成';

COMMENT ON COLUMN TABLEINFO.TABLE_ID_TYPE IS '主键类型（string,int）';

COMMENT ON COLUMN TABLEINFO.TABLE_ID_PREFIX IS '类型为string的主键前缀，可指定可不指定,缺省值为""';


CREATE UNIQUE INDEX PK_TABLEINFO0 ON TABLEINFO(TABLE_NAME)
/


ALTER TABLE TABLEINFO ADD   CONSTRAINT PK_TABLEINFO0 PRIMARY KEY (TABLE_NAME)
/
INSERT INTO TABLEINFO ( TABLE_NAME, TABLE_ID_NAME, TABLE_ID_INCREMENT, TABLE_ID_VALUE,
TABLE_ID_GENERATOR, TABLE_ID_TYPE, TABLE_ID_PREFIX ) VALUES ( 
'test', 'id', 1, 142, 'seq_test', 'sequence', 'test'); 
INSERT INTO TABLEINFO ( TABLE_NAME, TABLE_ID_NAME, TABLE_ID_INCREMENT, TABLE_ID_VALUE,
TABLE_ID_GENERATOR, TABLE_ID_TYPE, TABLE_ID_PREFIX ) VALUES ( 
'test1', 'id', 1, 0, 'seq_test', 'sequence', 'test1'); 
COMMIT;

ALTER TABLE TEST
 ADD (clobname  CLOB);
 
ALTER TABLE TEST
 ADD (blobname  BLOB);
 
 ALTER TABLE TEST add  primary key(id); 
 
 
 /**
 select * from test1
select * from test

begin
delete from test1;
delete from test;
commit;
end;
*/
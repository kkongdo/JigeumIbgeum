 CREATE TABLE "SPRING"."MEMBER" 
(	"MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
	"MEM_PW" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
	"MEM_NM" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
	"NICKNAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"PHONE_NUM" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
	"SSN" VARCHAR2(14 BYTE) NOT NULL ENABLE, 
	"MEM_STAT" CHAR(1 BYTE) DEFAULT 'Y' NOT NULL ENABLE, 
	"SCORE" NUMBER(5,0) NOT NULL ENABLE, 
	"AUTHORITY" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	CONSTRAINT "PK_MEMBER" PRIMARY KEY ("MEM_ID")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS"  ENABLE
) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;
  
  
  
  
  CREATE TABLE "SPRING"."ACCOUNT" 
   (	"ACCOUNT" NUMBER(20,0) NOT NULL ENABLE, 
		"ACT_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
		"ACT_PASSWORD" NUMBER(4,0) NOT NULL ENABLE, 
		"BALANCE" NUMBER(13,0) DEFAULT 0 NOT NULL ENABLE, 
		"REGDATE" DATE NOT NULL ENABLE, 
		"MEM_NM" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
		"SSN" VARCHAR2(14 BYTE) NOT NULL ENABLE, 
		"PHONE_NUM" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
		"JOB" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
		"PUR_TRANS" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
		"SOR_FUND" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
		"MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
		CONSTRAINT "PK_ACCOUNT" PRIMARY KEY ("ACCOUNT")
		USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
		STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
		PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
		BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
		TABLESPACE "USERS"  ENABLE, 
		CONSTRAINT "FK_MEMBER_TO_ACCOUNT_1" FOREIGN KEY ("MEM_ID")
		REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
	PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
	NOCOMPRESS LOGGING
	STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
	PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
	BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
	TABLESPACE "USERS" ;


  CREATE TABLE "SPRING"."TRANSFER" 
   (	"TRANS_SEQ" NUMBER(6,0) NOT NULL ENABLE, 
		"DEPO_BANK" VARCHAR2(25 BYTE) NOT NULL ENABLE, 
		"DEPO_NUM" NUMBER(20,0) NOT NULL ENABLE, 
		"RECEIVE_NM" VARCHAR2(25 BYTE) NOT NULL ENABLE, 
		"SEND_NM" VARCHAR2(25 BYTE) NOT NULL ENABLE, 
		"DEPO_MON" NUMBER(13,0) NOT NULL ENABLE, 
		"WITHDR_MON" NUMBER(13,0) NOT NULL ENABLE, 
		"TRANS_DATE" DATE NOT NULL ENABLE, 
		"MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
		"ACCOUNT" NUMBER(20,0) NOT NULL ENABLE, 
		CONSTRAINT "PK_TRANSFER" PRIMARY KEY ("TRANS_SEQ")
		USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
		STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
		PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
		BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
		TABLESPACE "USERS"  ENABLE, 
		CONSTRAINT "FK_MEMBER_TO_TRANSFER_1" FOREIGN KEY ("MEM_ID")
		REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE, 
		CONSTRAINT "TRANSFER_FK" FOREIGN KEY ("ACCOUNT")
		REFERENCES "SPRING"."ACCOUNT" ("ACCOUNT") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
	PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
	NOCOMPRESS LOGGING
	STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
	PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
	BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
	TABLESPACE "USERS" ;


  CREATE TABLE "SPRING"."CARD" 
   (	"CD_NO" NUMBER, 
        "CD_NUM" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
        "CD_ITEM" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
        "CD_PW" VARCHAR2(4 BYTE) NOT NULL ENABLE, 
        "CD_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
        "CD_SSN" VARCHAR2(14 BYTE) NOT NULL ENABLE, 
        "CD_PHONE" VARCHAR2(13 BYTE) NOT NULL ENABLE, 
        "CD_STATUS" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
        "PAY_BANK" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
        "PAY_ACCOUNT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
        "PAY_DATE" NUMBER(2,0) NOT NULL ENABLE, 
        "END_DATE" DATE NOT NULL ENABLE, 
        "START_DATE" DATE NOT NULL ENABLE, 
        "MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        PRIMARY KEY ("CD_NO")
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
        STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
        PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
        BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
        TABLESPACE "USERS"  ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_CARD_1" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;


    
  CREATE TABLE "SPRING"."WAITING" 
   (	"WT_SEQ" NUMBER(6,0) NOT NULL ENABLE, 
        "WT_NO" NUMBER(4,0) NOT NULL ENABLE, 
        "WT_LIST" NUMBER(5,0) NOT NULL ENABLE, 
        "WT_DATE" DATE NOT NULL ENABLE, 
        "WT_STORE" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
        "MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        CONSTRAINT "PK_WAITING" PRIMARY KEY ("WT_SEQ")
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
        STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
        PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
        BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
        TABLESPACE "USERS"  ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_WAITING_1" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;

    
  CREATE TABLE "SPRING"."POPULAR_WORD" 
   (	"PW_WORD" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        "PW_DATE" DATE NOT NULL ENABLE, 
        "PW_AGE" NUMBER(3,0) NOT NULL ENABLE, 
        "MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_POPULAR_WORD_1" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;


    
  CREATE TABLE "SPRING"."QUIZ" 
   (	"MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        "QUIZ_DATE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
        "QUIZ_STAT" CHAR(1 BYTE) NOT NULL ENABLE, 
        "MY_ANSWER" NUMBER NOT NULL ENABLE, 
        "ANSWER" NUMBER NOT NULL ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_QUIZ_1" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;



  CREATE TABLE "SPRING"."POINT" 
   (	"POINT_SEQ" NUMBER NOT NULL ENABLE, 
        "POINT" NUMBER NOT NULL ENABLE, 
        "POINT_DATE" DATE NOT NULL ENABLE, 
        "DIVISION" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        "MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        CONSTRAINT "PK_POINT" PRIMARY KEY ("POINT_SEQ")
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
        STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
        PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
        BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
        TABLESPACE "USERS"  ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_POINT_1" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;


    
  CREATE TABLE "SPRING"."NOTICE" 
   (	"NTC_ID" NUMBER NOT NULL ENABLE, 
        "TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
        "NTC_VIEW" NUMBER DEFAULT 0 NOT NULL ENABLE, 
        "NTC_CONTENT" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
        "NTC_DATE_CREATED" DATE NOT NULL ENABLE, 
        "MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NTC_ID")
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
        STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
        PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
        BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
        TABLESPACE "USERS"  ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;



  CREATE TABLE "SPRING"."BOARD" 
   (	"BRD_ID" NUMBER NOT NULL ENABLE, 
        "BRD_CATEGORY" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
        "TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
        "BRD_VIEW" NUMBER DEFAULT 0 NOT NULL ENABLE, 
        "BRD_CONTENT" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
        "BRD_DECLARATION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
        "BRD_SUGGESTION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
        "BRD_DATE_CREATED" DATE NOT NULL ENABLE, 
        "MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        CONSTRAINT "PK_BOARD" PRIMARY KEY ("BRD_ID")
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
        STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
        PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
        BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
        TABLESPACE "USERS"  ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;


  CREATE TABLE "SPRING"."BRD_COMMENT" 
   (	"CMT_ID" NUMBER NOT NULL ENABLE, 
        "CMT_CONTENT" VARCHAR2(2000 BYTE) NOT NULL ENABLE, 
        "CMT_DECLARATION" NUMBER NOT NULL ENABLE, 
        "CMT_SUGGESTION" NUMBER NOT NULL ENABLE, 
        "CMT_REGDATE" DATE NOT NULL ENABLE, 
        "BRD_ID" NUMBER NOT NULL ENABLE, 
        "MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        CONSTRAINT "FK_BOARD_TO_COMMENT_2" FOREIGN KEY ("BRD_ID")
        REFERENCES "SPRING"."BOARD" ("BRD_ID") ENABLE, 
        CONSTRAINT "FK_MEMBER_TO_COMMENT_2" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;


  CREATE TABLE "SPRING"."SUGGESTION" 
   (	"MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        "BRD_ID" NUMBER NOT NULL ENABLE, 
        CONSTRAINT "FK_SUGGESTION_MEM_ID_MEM_ID" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE, 
        CONSTRAINT "FK_SUGGESTION_BRD_ID_BRD_ID" FOREIGN KEY ("BRD_ID")
        REFERENCES "SPRING"."BOARD" ("BRD_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;

    
  CREATE TABLE "SPRING"."DECLARATION" 
   (	"MEM_ID" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
        "BRD_ID" NUMBER NOT NULL ENABLE, 
        CONSTRAINT "FK_DECLARATION_MEM_ID_MEM_ID" FOREIGN KEY ("MEM_ID")
        REFERENCES "SPRING"."MEMBER" ("MEM_ID") ENABLE, 
        CONSTRAINT "FK_DECLARATION_BRD_ID_BRD_ID" FOREIGN KEY ("BRD_ID")
        REFERENCES "SPRING"."BOARD" ("BRD_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
    NOCOMPRESS LOGGING
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "USERS" ;


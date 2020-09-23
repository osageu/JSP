select *
from member
where status = 'Y'
  and user_id = ?
  and user_pwd = ?;




INSERT 
INTO MEMBER
(
    USER_NO, 
    USER_ID, 
    USER_PWD, 
    USER_NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    INTEREST
) 
VALUES
(
    SEQ_UNO.NEXTVAL, 
    ?, 
    ?, 
    ?, 
    ?, 
    ?, 
    ?, 
    ?
);



UPDATE MEMBER
    SET USER_NAME = ?
        , PHONE = ?
        , EMAIL = ?
        , ADDRESS = ?
        , INTEREST = ?
    WHERE USER_ID = ?;



SELECT 
       NOTICE_NO
     , NOTICE_TITLE
     , USER_ID
     , COUNT
     , CREATE_DATE
FROM NOTICE
JOIN MEMBER ON (NOTICE_WRITER = USER_NO)
WHERE NOTICE.STATUS='Y'
ORDER BY NOTICE_NO DESC;

INSERT
  INTO NOTICE
  (
    NOTICE_NO
  , NOTICE_TITLE
  , NOTICE_CONTENT
  , NOTICE_WRITER
  )
  VALUES
  (
     SEQ_NNO.NEXTVAL
   , ?
   , ?
   , ?
  );


UPDATE
       NOTICE
   SET COUNT = COUNT+1
 WHERE NOTICE_NO = ?
   AND STATUS = 'Y'


SELECT
       NOTICE_NO
     , NOTICE_TITLE
     , NOTICE_CONTENT
     , USER_ID
     , CREATE_DATE
  FROM NOTICE
  JOIN MEMBER ON(NOTICE_WRITER=USER_NO)
 WHERE NOTICE_NO = ?
   AND STATUS = 'Y'
 

UPDATE
	   NOTICE
   SET NOTICE_TITLE = ?
     , NOTICE_CONTENT = ?
 WHERE NOTICE_NO = ?


 UPDATE
 	    NOTICE
 	SET STATUS = 'N'
  WHERE NOTICE_NO = ?
 
 
 SELECT COUNT(*)
   FROM BOARD
  WHERE BOARD_TYPE = 1
    AND STATUS='Y'
 
    
 SELECT *
  FROM (
        SELECT 
                ROWNUM RNUM
              , A.*
        FROM (
             SELECT 
                    BOARD_NO
                  , CATEGORY_NAME
                  , BOARD_TITLE
                  , USER_ID
                  , COUNT
                  , CREATE_DATE
               FROM BOARD B
               JOIN CATEGORY USING(CATEGORY_NO)
               JOIN MEMBER ON(BOARD_WRITER=USER_NO)
              WHERE B.STATUS='Y'
                AND BOARD_TYPE=1
              ORDER
                 BY BOARD_NO DESC
            ) A
        )
 WHERE RNUM BETWEEN ? AND ?
 
 
 INSERT
   INTO BOARD
   (
   		BOARD_NO
   	  , BOARD_TYPE
   	  , CATEGORY_NO
   	  , BOARD_TITLE
   	  , BOARD_CONTENT
   	  , BOARD_WRITER
   	  , CREATE_DATE
   )
   VALUES
   (
   	    SEQ_BNO.NEXTVAL
   	  , 1
   	  , ?
   	  , ?
   	  , ?
   	  , ?
   	  , SYSDATE
   )
   
 INSERT
   INTO ATTACHMENT
   (
   		FILE_NO
   	  , REF_BNO
   	  , ORIGIN_NAME
   	  , CHANGE_NAME
   	  , FILE_PATH
   )
   VALUES
   (
   		SEQ_FNO.NEXTVAL
   	  , SEQ_BNO.CURRVAL
   	  , ?
   	  , ?
   	  , ?
   )
   

UPDATE
	   BOARD
   SET COUNT = COUNT + 1
 WHERE BOARD_NO = ?
   AND STATUS = 'Y'
 

SELECT 
       BOARD_NO
     , CATEGORY_NAME
     , BOARD_TITLE
     , BOARD_CONTENT
     , USER_ID
     , CREATE_DATE
  FROM BOARD
  JOIN CATEGORY USING(CATEGORY_NO)
  JOIN MEMBER ON(BOARD_WRITER = USER_NO)
 WHERE BOARD_NO = ?
   AND B.STATUS = 'Y'
   

SELECT
       FILE_NO
     , ORIGIN_NAME
     , CHANGE_NAME
     , FILE_PATH
  FROM ATTACHMENT
 WHERE REF_BNO = ?
   
   
UPDATE
       BOARD
   SET CATEGORY_NO = ?
     , BOARD_TITLE = ?
     , BOARD_CONTENT = ?
 WHERE BOARD_NO = ?
   

UPDATE
       ATTACHMENT
   SET ORIGIN_NAME = ?
     , CHANGE_NAME = ?
     , FILE_PATH = ?
 WHERE FILE_NO = ?
 
 
INSERT
  INTO ATTACHMENT
  (
     FILE_NO
   , REF_BNO
   , ORIGIN_NAME
   , CHANGE_NAME
   , FILE_PATH
  )
VALUES 
  (
     SEQ_FNO.NEXTVAL
   , ?
   , ?
   , ?
   , ?
  )
 
 
INSERT
  INTO BOARD
  (
  	BOARD_NO
  , BOARD_TYPE
  , BOARD_TITLE
  , BOARD_CONTENT
  , BOARD_WRITER
  , CREATE_DATE
  )
 VALUES
 (
    SEQ_BNO.NEXTVAL
  , 2
  , ?
  , ?
  , ?
  , SYSDATE
 )
 
 
INSERT
  INTO ATTACHMENT
  (
     FILE_NO
   , REF_BNO
   , ORIGIN_NAME
   , CHANGE_NAME
   , FILE_PATH
   , FILE_LEVEL
  )
  VALUES
  (
     SEQ_FNO.NEXTVAL  
   , SEQ_BNO.CURRVAL
   , ?
   , ?
   , ?
   , ?
  )
  
   
 SELECT
 	    BOARD_NO
	  , BOARD_TITLE
	  , COUNT
	  , FILE_PATH || CHANGE_NAME "TITLEIMG"
  FROM  BOARD B
  JOIN ATTACHMENT ON(BOARD_NO=REF_BNO)
 WHERE BOARD_TYPE = 2
   AND B.STATUS = 'Y'
   AND FILE_LEVEL = 1
ORDER
    BY BOARD_NO DESC
  
  
 SELECT
        COUNT(*)
   FROM MEMBER
  WHERE USER_ID = ?
 
SELECT '<tr><td>'||D.TABLESPACE_NAME||'</td>' ,
        '<td>'|| ration_space||'</td>' RATION_SPACE_M,
       '<td>'|| FREE_SPACE||'</td>' FREE_SPACE_M,
       '<td>'|| (real_SPACE - NVL(FREE_SPACE,0))||'</td>' USED_SPACE_M,
        '<td>'|| ROUND ((real_SPACE - NVL(FREE_SPACE,0)) / ration_space *100 ,2)||'</td></tr>' AS "USED%"
    FROM(  SELECT TABLESPACE_NAME,
                  ROUND (SUM(BYTES)/(1024 * 1024),2) real_SPACE,
                  ROUND (sum(DECODE(maxbytes,0,bytes,maxbytes)) /(1024 * 1024) ,2) ration_space 
             FROM DBA_DATA_FILES
          GROUP BY TABLESPACE_NAME) D,
         (  SELECT TABLESPACE_NAME,
                 ROUND (SUM(BYTES)/(1024 * 1024),2) FREE_SPACE
             FROM DBA_FREE_SPACE
          GROUP BY TABLESPACE_NAME) F
   WHERE D.TABLESPACE_NAME =F.TABLESPACE_NAME(+);

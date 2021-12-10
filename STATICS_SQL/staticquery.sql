select t."total"
FROM (SELECT ROUND(AVG(COUNT(study_instance_uid))) AS "total",m."stored studies per day",m."Modality"
FROM medistore.didb_studies_block1  t
group by TRUNC(last_image_insert_time));

SELECT COUNT(study_instance_uid) as "Total # of studies",medistore.get_primary_modality(study_modality) as "Modality",trunc(study_date,'dd') as "year",TO_CHAR(study_date,'HH') AS "hour"
FROM medistore.didb_studies_block2
WHERE study_date BETWEEN to_date("01-JUN-21",'dd-MM-YY') AND to_date("01-JUN-20",'dd-MM-YY')
GROUP BY medistore.get_primary_modality(study_modality),TRUNC(study_date,'dd'),TO_CHAR(study_date,'HH');

SELECT trunc(study_date,'YY') FROM medistore.didb_studies_block2;

/*"Total # of studies "*/
SELECT COUNT(study_instance_uid) as "Total # of studies",medistore.get_primary_modality(study_modality) as "Modality",trunc(study_date,'YY') as "year"
FROM medistore.didb_studies_block2
WHERE study_date BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY')
GROUP BY medistore.get_primary_modality(study_modality),TRUNC(study_date,'YY');


/*  studies per year  */
SELECT COUNT(*) AS "studies per year"
FROM medistore.didb_studies_block1
WHERE study_date BETWEEN to_date("08-JUN-20",'dd-MM-YY') AND "08-FEB-20";


/*stored studies per day modality ('MR','XRAY','CT','MG','US','NM','PT CT','RF')*/
SELECT ROUND(AVG("stored studies per day")) AS "stored studies per day",SUM("stored studies per day") as "stored number","Modality"
FROM (
  SELECT COUNT(study_instance_uid) as "stored studies per day",medistore.get_primary_modality(study_modality) as "Modality",TRUNC(study_date) as "time_day"
  FROM medistore.didb_studies_block1
  WHERE study_date BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY')
  group by medistore.get_primary_modality(study_modality),TRUNC(study_date)
)
/*WHERE "Modality" IN ('MR','XRAY','CT','MG','US','NM','PT CT','RF')*/ 
group by "Modality";


/*Total # of stored studies - peak hour*/
    SELECT COUNT(study_instance_uid) as "stored hour",medistore.get_primary_modality(study_modality) as "Modality",to_char(study_date,'HH') as "time_hour",trunc(study_date,'YY') as "year"
    FROM medistore.didb_studies_block1
    WHERE study_date BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY')
    group by medistore.get_primary_modality(study_modality),to_char(study_date,'HH'),trunc(study_date,'YY');
    
    

      
      
      




select TO_DATE('08-JUN-20','DD-MM-YY') from dual 




      
WHERE t."Total of stored studies - peak hour" = MaxModality."Total of stored studies - peak hour";



SELECT to_char(last_image_insert_time,'HH') FROM  medistore.didb_studies_block1 

SELECT sysdate FROM  dual

SELECT DISTINCT trim('\' from substr(study_modality,1,instr(study_modality,'\',2))) FROM medistore.didb_studies_block1

select last from medistore.didb_studies_block1
order by substr(study_modality,1,instr(study_modality,'\',2))) ='CR' or 
group
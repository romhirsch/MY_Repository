
SELECT COUNT(study_instance_uid) as "Total # of studies"
FROM medistore.didb_studies_block2
WHERE last_image_insert_time BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY');

SELECT COUNT(study_instance_uid) as "Total # of studies"
FROM medistore.didb_studies_block2
WHERE study_date BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY');

/*where last_imege_isert_time = study_Date*/
SELECT COUNT(study_instance_uid) as "Total # of studies",medistore.get_primary_modality(study_modality) as "Modality",TRUNC(last_image_insert_time,'YY') as "year"
FROM medistore.didb_studies_block
WHERE last_image_insert_time BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY') and trunc(last_image_insert_time) = trunc(study_date)
GROUP BY medistore.get_primary_modality(study_modality),TRUNC(last_image_insert_time,'YY');

/**/
SELECT SUM(number_of_study_images) 
FROM medistore.didb_studies_block2
WHERE last_image_insert_time BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY');



/*"Total # of studies stored"*/
SELECT COUNT(study_instance_uid) as "Total # of studies",medistore.get_primary_modality(study_modality) as "Modality",TRUNC(last_image_insert_time,'YY') as "year"
FROM medistore.didb_studies_block1
WHERE last_image_insert_time BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY')
GROUP BY medistore.get_primary_modality(study_modality),TRUNC(last_image_insert_time,'YY');


/*  studies per year  */
SELECT COUNT(*) AS "studies per year"
FROM medistore.didb_studies_block1
WHERE last_image_insert_time BETWEEN to_date("08-JUN-20",'dd-MM-YY') AND to_date("08-JUN-20",'dd-MM-YY');


/*stored studies per day modality ('MR','XRAY','CT','MG','US','NM','PT CT','RF')*/
SELECT ROUND(AVG(t."stored studies per day")) AS "stored studies per day",SUM(t."stored studies per day") as "stored number","Modality",TRUNC(s.study_date,'YY') as "year"
FROM (
  SELECT COUNT(study_instance_uid) as "stored studies per day",medistore.get_primary_modality(study_modality) as "Modality",TRUNC(study_date) as "time_day"
  FROM medistore.didb_studies_block1
  WHERE study_date BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY')
  group by medistore.get_primary_modality(study_modality),TRUNC(study_date)
) t , medistore.didb_studies_block1 s
group by t."Modality",TRUNC(s.study_date,'YY');


/*Total # of stored studies - peak hour all  */
Select AVG("stored hour per day") as "stored hour" ,"time_hour","Modality"
From (
  SELECT COUNT(study_instance_uid) as "stored hour per day",medistore.get_primary_modality(study_modality) as "Modality",to_char(study_date,'HH24') as "time_hour",trunc(study_date) as "day"
  FROM medistore.didb_studies_block2
  WHERE study_date BETWEEN to_date('01-JAN-19','dd-MM-YY') AND to_date('01-JAN-20','dd-MM-YY')
  group by medistore.get_primary_modality(study_modality),to_char(study_date,'HH24'),trunc(study_date)
)   
GROUP BY "time_hour","Modality";

      
 
 
 
 
 
 Select AVG("stored hour per day") as "stored hour" ,"time_hour","Modality"
From (
  SELECT COUNT(b.study_instance_uid) as "stored hour per day",medistore.get_primary_modality(b.study_modality) as "Modality",to_char(a.event_date,'HH24') as "time_hour",trunc(a.event_date) as "day"
  FROM medistore.didb_studies_block1 b LEFT JOIN auditing.audit_log_block1 a ON a.study_instance_uid = b.study_instance_uid
  WHERE a.event_date BETWEEN to_date('01-JAN-14','dd-MM-YY') AND to_date('01-JAN-21','dd-MM-YY')
  GROUP BY medistore.get_primary_modality(b.study_modality),to_char(a.event_date,'HH24'),trunc(a.event_date)
)    
GROUP BY "time_hour", "Modality";
 
 
 
 
 
 
 
 
 
 
 
 
      
      
select TRUNC(study_date) from medistore.didb_studies_block1
/*

select to_char(sysdate,'HH') from dual 

select TO_DATE('08-JUN-20','DD-MM-YY') from dual 


select t."total"
FROM (SELECT ROUND(AVG(COUNT(study_instance_uid))) AS "total",m."stored studies per day",m."Modality"
FROM medistore.didb_studies_block1  t
group by TRUNC(last_image_insert_time));

SELECT COUNT(study_instance_uid) as "Total # of studies",medistore.get_primary_modality(study_modality) as "Modality",trunc(study_date,'dd') as "year",TO_CHAR(study_date,'HH') AS "hour"
FROM medistore.didb_studies_block2
WHERE study_date BETWEEN to_date("01-JUN-21",'dd-MM-YY') AND to_date("01-JUN-20",'dd-MM-YY')
GROUP BY medistore.get_primary_modality(study_modality),TRUNC(study_date,'dd'),TO_CHAR(study_date,'HH');

SELECT trunc(study_date,'YY') FROM medistore.didb_studies_block2;


      
WHERE t."Total of stored studies - peak hour" = MaxModality."Total of stored studies - peak hour";



SELECT to_char(last_image_insert_time,'HH') FROM  medistore.didb_studies_block1 

SELECT sysdate FROM  dual

SELECT DISTINCT trim('\' from substr(study_modality,1,instr(study_modality,'\',2))) FROM medistore.didb_studies_block1

select last from medistore.didb_studies_block1
order by substr(study_modality,1,instr(study_modality,'\',2))) ='CR' or 
group
*/
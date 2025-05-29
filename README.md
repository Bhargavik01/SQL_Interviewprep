# SQL_Interviewprep


### https://www.sql-practice.com/
Tables:
Patient Table:  

| Column Name  | Data Type |
| ------------ | --------- |
| patient\_id  | INT       |
| first\_name  | TEXT      |
| last\_name   | TEXT      |
| gender       | CHAR(1)   |
| birth\_date  | DATE      |
| city         | TEXT      |
| province\_id | CHAR(2)   |
| allergies    | TEXT      |
| height       | INT       |
| weight       | INT       |

Patient Table:  
| Column Name  | Data Type |
| ------------ | --------- |
| patient\_id  | INT       |
| first\_name  | TEXT      |
| last\_name   | TEXT      |
| gender       | CHAR(1)   |
| birth\_date  | DATE      |
| city         | TEXT      |
| province\_id | CHAR(2)   |
| allergies    | TEXT      |
| height       | INT       |
| weight       | INT       |

admissions:  
| Column Name               | Data Type |
| ------------------------- | --------- |
| **patient\_id**           | INT       |
| admission\_date           | DATE      |
| discharge\_date           | DATE      |
| diagnosis                 | TEXT      |
| **attending\_doctor\_id** | INT       |


Doctors:  
| Column Name    | Data Type |
| -------------- | --------- |
| **doctor\_id** | INT       |
| first\_name    | TEXT      |
| last\_name     | TEXT      |
| specialty      | TEXT      |

Province names:  
| Column Name      | Data Type |
| ---------------- | --------- |
| **province\_id** | CHAR(2)   |
| province\_name   | TEXT      |




Show first name, last name, and gender of patients whose gender is 'M'  
SELECT first_name, last_name, gender from patients where gender ="M";

Show first name and last name of patients who does not have allergies. (null)  
SELECT first_name, last_name from patients where allergies is NULL;

Show first name of patients that start with the letter 'C'   
SELECT first_name from patients where first_name like 'C%';

Show first name and last name of patients that weight within the range of 100 to 120 (inclusive):  
SELECT first_name,last_name from patients where weight between 100 and 120;

Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'  
update patients set allergies = 'NKA' where allergies is NULL;

Show first name and last name concatinated into one column to show their full name.  
select concat(first_name," ",last_name) as full_name from patients;

Show first name, last name, and the full province name of each patient.   
Example: 'Ontario' instead of 'ON'  
select p.first_name,p.last_name,pn.province_name from patients p left join province_names pn on p.province_id=pn.province_id;

Show how many patients have a birth_date with 2010 as the birth year.  
select count (*) from patients where year(birth_date)== 2010;

Show the first_name, last_name, and height of the patient with the greatest height.  
select first_name,last_name,height from patients where height = (select max(height) from patients);

Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000   
select * from patients where patient_id in (1,45,534,879,1000);

Show all the columns from admissions where the patient was admitted and discharged on the same day.  
select * from admissions where admission_date = discharge_date;

Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.  
select distinct city as unique_cities from patients where province_id ="NS";  
SELECT city FROM patients GROUP BY city HAVING province_id = 'NS';

Show unique birth years from patients and order them by ascending.  
select year(birth_date) as birth_year from patients order by birth_year asc;

Show unique birth years from patients and order them by ascending.  
select distinct year(birth_date) as birth_year from patients order by birth_year asc;  
SELECT year(birth_date) FROM patients GROUP BY year(birth_date)

Show unique first names from the patients table which only occurs once in the list.
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
select first_name from patients group by first_name having count(first_name) =1  
SELECT first_name
FROM (
    SELECT
      first_name,
      count(first_name) AS occurrencies
    FROM patients
    GROUP BY first_name
  )
WHERE occurrencies = 1



Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long. 
select patient_id, first_name from patients where first_name like 's%s' and len(first_name)>=6;
SELECT
  patient_id,
  first_name
FROM patients
WHERE first_name LIKE 's____%s';

SELECT
  patient_id,
  first_name
FROM patients
where
  first_name like 's%'
  and first_name like '%s'
  and len(first_name) >= 6;




 




























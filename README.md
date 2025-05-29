# SQL_Interviewprep

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



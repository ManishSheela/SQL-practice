/* 
Show first name, last name, and gender of patients who's gender is 'M' 
*/
select first_name,last_name,gender
from patients where gender = 'M';

/* 
Show first name and last name of patients who does not have allergies. (null) 
*/
select first_name,last_name
from patients where allergies IS NULL;

/* 
Show first name of patients that start with the letter 'C' 
*/
select first_name from patients
where first_name like 'C%'

/* 
Show first name and last name of patients that weight within
the range of 100 to 120 (inclusive) 
*/
select first_name,last_name from patients
where weight between 100 and 120

select first_name,last_name from patients
where weight>=100 and weight<=120

/* 
Update the patients table for the allergies column. 
If the patient's allergies is null then replace it with 'NKA'
*/
update patients
set allergies = 'NKA'
where allergies is NULL

/* 
Show first name and last name concatinated into
one column to show their full name. */
select concat(first_name,' ',last_name) as full_name
from patients

select (first_name || ' ' || last_name) as full_name
from patients

/*
Show first name, last name, and the full province name of each patient.
Example: 'Ontario' instead of 'ON'
*/
select first_name,last_name,province_name
from patients
join province_names
on patients.province_id = province_names.province_id;

/* 
Show how many patients have a birth_date with 2010 as the birth year.
*/
select count(year(birth_date)) as total_patients
from patients
where year(birth_date) = 2010

select (count(*)) as total_patients
from patients
where year(birth_date) = 2010;

select count(birth_date) as total_patients
from patients
where birth_date>= '2010-01-01' and birth_date<= '2010-12-31'; 

/* 
Show the first_name, last_name, and height of the patient with the greatest height.
*/
select first_name,last_name, max(height) as height
from patients;

select first_name,last_name,height
from patients
order by height desc limit 1

select first_name,last_name,height
from patients
where height = (select max(height) from patients)

/* Show the total number of admissions for patient_id 579 */
select patient_id ,count(*)as total_admissions 
from admissions
where patient_id = 579

/* 
Based on the cities that our patients live in, show unique cities that are in province_id 'NS'? 
*/
select distinct(city) from patients
where province_id is 'NS'

/*
Write a query to find the first_name, last name and birth date 
of patients who have height more than 160 and weight more than 70
*/
select first_name,last_name,birth_date from patients
where height > 160 and weight > 70

/*
Write a query to find list of patients first_name, last_name, and allergies 
from Hamilton where allergies are not null
*/
select first_name,last_name,allergies
from patients
where city = 'Hamilton' and allergies is not NULL

/*
Based on cities where our patient lives in, 
write a query to display the list of unique city starting with 
a vowel (a, e, i, o, u). Show the result order in ascending by city.
*/
select distinct city from patients
where city like 'a%' or 
	  city like 'e%' or 
      city like 'i%' or 
      city like 'o%' or 
      city like 'u%' 
order by city;







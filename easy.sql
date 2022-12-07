/* Show first name, last name, and gender of patients who's gender is 'M' */


select first_name,last_name,gender
from patients where gender = 'M';


/* Show first name and last name of patients who does not have allergies. (null) */
select first_name,last_name
from patients where allergies IS NULL;

/* Show first name of patients that start with the letter 'C' */
select first_name from patients
where first_name like 'C%'

/* Show first name and last name of patients that weight within
the range of 100 to 120 (inclusive) */
select first_name,last_name from patients
where weight between 100 and 120

select first_name,last_name from patients
where weight>=100 and weight<=120

/* Update the patients table for the allergies column. 
If the patient's allergies is null then replace it with 'NKA' */
update patients
set allergies = 'NKA'
where allergies is NULL

/* Show first name and last name concatinated into
one column to show their full name. */
select concat(first_name,' ',last_name) as full_name
from patients

select (first_name || ' ' || last_name) as full_name
from patients



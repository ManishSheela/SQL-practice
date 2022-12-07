/* Show unique birth years from patients and order them by ascending 
*/
select distinct year(birth_date) from patients
order by year(birth_date);

/* Show unique first names from the patients table which only occurs once in the list.For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
*/
select first_name
from patients
group by first_name having count(first_name) = 1;

/* Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
*/
select patient_id, first_name from patients
where first_name like 's____%s' 

select patient_id, first_name from patients
where first_name like 's%s' and len(first_name) >= 6

select patient_id,first_name from patients
where first_name like 's%' and first_name like '%s' and len(first_name) >= 6

/* Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
Primary diagnosis is stored in the admissions table.
*/
select patients.patient_id,first_name,last_name from patients
join admissions
on patients.patient_id = admissions.patient_id and admissions.diagnosis = 'Dementia'

select patient_id,first_name,last_name from patients
where (select patient_id from admissions where diagnosis = 'Dementia')

/* Display every patient's first_name. Order the list by the length of each name and then by alphbetically
*/
select first_name from patients
order by len(first_name),first_name

/* Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.
*/
select (select count(*)  from patients  where gender = 'M') as male_count ,
		(select Count(*) from patients where gender = 'F') as female_count 
      
select sum(gender = 'M') as male_count , sum(gender='F')as female_count
from patients











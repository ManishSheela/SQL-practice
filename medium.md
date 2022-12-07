> Show unique birth years from patients and order them by ascending 
```{mysql}
select distinct year(birth_date) from patients
order by year(birth_date);
```
> Show unique first names from the patients table which only occurs once in the list.For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
```{mysql}
select first_name
from patients
group by first_name having count(first_name) = 1;
```
> Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
```{mysql}
select patient_id, first_name from patients
where first_name like 's____%s' 
```
```{mysql}
select patient_id, first_name from patients
where first_name like 's%s' and len(first_name) >= 6
```
```{mysql}
select patient_id,first_name from patients
where first_name like 's%' and first_name like '%s' and len(first_name) >= 6
```
> Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
Primary diagnosis is stored in the admissions table.
```{mysql}
select patients.patient_id,first_name,last_name from patients
join admissions
on patients.patient_id = admissions.patient_id and admissions.diagnosis = 'Dementia'
```
```{mysql}
select patient_id,first_name,last_name from patients
where (select patient_id from admissions where diagnosis = 'Dementia')
```
> Display every patient's first_name. Order the list by the length of each name and then by alphbetically
```{mysql}
select first_name from patients
order by len(first_name),first_name
```
> Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.
```{mysql}
select (select count(*)  from patients  where gender = 'M') as male_count ,
		(select Count(*) from patients where gender = 'F') as female_count 
 ```
```{mysql}
select SUM(gender = 'M') as male_count , SUM(gender='F')as female_count
from patients
```
> Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
```{mysql}
select first_name,last_name,allergies from patients
where allergies in ('Penicillin','Morphine') 
order by allergies,first_name,last_name
```
> 
Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
```{mysql}
select patient_id,diagnosis
from admissions
group by patient_id,diagnosis having count(*) > 1;
```
> Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.
```{mysql}
select city,count(*)as num_patients from patients
group by city 
order by count(*) desc,city;
```
> Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor" 
```{mysql}
select first_name, last_name, 'Patient' as role from patients
union ALL
select first_name, last_name, 'Doctor' as role from doctors
```
> Show all allergies ordered by popularity. Remove NULL values from query.
```{mysql}
select allergies, count(allergies) as total_diagnosis 
from patients
where allergies is not NULL
group by allergies order by count(allergies) desc;
```
> Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
```{mysql}
select first_name,last_name ,birth_date
from patients
where Year(birth_date) between 1970 and 1979
order by birth_date
```
> We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane
```{mysql}
select concat(upper(last_name),',',lower(first_name)) as new_name_format 
from patients  
order by first_name desc
```
> Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
```{mysql}
select province_id, sum(height)as sum_of_height
from patients
group by province_id having sum_of_height >= 7000
```
> Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
```{mysql}
select (max(weight)-min(weight)) from (select weight from patients 
where last_name is 'Maroni') as weight_delta
```
```{mysql}
select (Max(weight)-min(weight)) as weight_delta
from patients
where last_name = 'Maroni'
```
> Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
```{mysql}
select day(admission_date) as day_number, count(*) as number_of_admissions
from admissions
group by day_number
order by number_of_admissions desc
```
> Show all columns for patient_id 542's most recent admission_date.
```{mysql}
select * from admissions
where patient_id = 542
order by admission_date desc limit 1
```
> Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.
```{mysql}
select patient_id,attending_doctor_id,diagnosis 
from admissions
where (mod(patient_id,2) = 1 and attending_doctor_id in(1,5,19)) 
or (attending_doctor_id like '%2%' and len(patient_id) = 3 )
```
> Show first_name, last_name, and the total number of admissions attended for each doctor.
Every admission has been attended by a doctor.
```{mysql}
select first_name,last_name, count(*)as admissions_total 
from doctors
join admissions
on doctors.doctor_id = admissions.attending_doctor_id
group by first_name,last_name
```
> For each physicain, display their id, full name, and the first and last admission date they attended.
```{mysql}
select doctor_id, concat(first_name,' ',last_name) as full_name, min(admission_date),max(admission_date) 
from doctors
join admissions
on admissions.attending_doctor_id = doctors.doctor_id
group by doctor_id
```
> Display the total amount of patients for each province. Order by descending.
```{mysql}
select province_name, count(*) as patient_count from patients
join province_names
on province_names.province_id = patients.province_id
group by province_name 
order by patient_count desc
```











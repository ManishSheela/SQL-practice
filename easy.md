> Show first name, last name, AND gender of patients who's gender is 'M' 
```{mysql} 
SELECT first_name,last_name,gender
FROM patients WHERE gender = 'M'
```
> Show first name AND last name of patients who does not have allergies. (null) 
```{mysql} 
SELECT first_name,last_name
FROM patients WHERE allergies IS NULL;
```
> Show first name of patients that start with the letter 'C' 
```{mysql} 
SELECT first_name FROM patients
WHERE first_name LIKE 'C%'
```
> Show first name AND last name of patients that weight within
the range of 100 to 120 (inclusive) 
```{mysql} 
SELECT first_name,last_name FROM patients
WHERE weight between 100 AND 120
```
```{mysql} 
SELECT first_name,last_name FROM patients
WHERE weight>=100 AND weight<=120
```
> UPDATE the patients table for the allergies column. 
If the patient's allergies is null then replace it with 'NKA'
```{mysql}
UPDATE patients
set allergies = 'NKA'
WHERE allergies is NULL
```
> Show first name AND last name concatinated into
one column to show their full name
```{mysql}
SELECT concat(first_name,' ',last_name) as full_name
FROM patients
```
```{mysql} 
SELECT (first_name || ' ' || last_name) as full_name
FROM patients
```
> Show first name, last name, AND the full province name of each patient.
Example: 'Ontario' instead of 'ON'
```{mysql} 
SELECT first_name,last_name,province_name
FROM patients
join province_names
on patients.province_id = province_names.province_id;
```
> Show how many patients have a birth_date with 2010 as the birth year.
```{mysql}
SELECT count(year(birth_date)) as total_patients
FROM patients
WHERE year(birth_date) = 2010
```
```{mysql} 
SELECT (count(*)) as total_patients
FROM patients
WHERE year(birth_date) = 2010;
```
```{mysql} 
SELECT count(birth_date) as total_patients
FROM patients
WHERE birth_date>= '2010-01-01' AND birth_date<= '2010-12-31'; 
```
> Show the first_name, last_name, AND height of the patient with the greatest height.
```{mysql} 
SELECT first_name,last_name, max(height) as height
FROM patients;
```
```{mysql} 
SELECT first_name,last_name,height
FROM patients
order by height desc limit 1
```
```{mysql} 
SELECT first_name,last_name,height
FROM patients
WHERE height = (```{mysql} SELECT max(height) FROM patients)
```
> Show the total number of admissions for patient_id 579 
```{mysql} 
SELECT patient_id ,count(*)as total_admissions 
FROM admissions
WHERE patient_id = 579
```
> Based on the cities that our patients live in, show unique cities that are in province_id 'NS'? 
```{mysql} 
SELECT distinct(city) FROM patients
WHERE province_id is 'NS'
```
> Write a query to find the first_name, last name AND birth date of patients who have height more than 160 AND weight more than 70
```{mysql} 
SELECT first_name,last_name,birth_date FROM patients
WHERE height > 160 AND weight > 70
```
> Write a query to find list of patients first_name, last_name, AND allergies FROM Hamilton WHERE allergies are not null
```{mysql} 
SELECT first_name,last_name,allergies
FROM patients
WHERE city = 'Hamilton' AND allergies is not NULL
```
> Based on cities WHERE our patient lives in, 
write a query to display the list of unique city starting with 
a vowel (a, e, i, o, u). Show the result order in ascending by city.

```{mysql} 
SELECT distinct city FROM patients
WHERE city LIKE 'a%' or 
	  city LIKE 'e%' or 
      city LIKE 'i%' or 
      city LIKE 'o%' or 
      city LIKE 'u%' 
order by city;
```






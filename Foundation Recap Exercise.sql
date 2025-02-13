/*
Foundation Recap Exercise

Use the table PatientStay.  
This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024
*/

--1. List the patients -
--a) in the Oxleas or PRUH hospitals and

SELECT
	*
FROM
	PatientStay ps
WHERE Hospital IN ('Oxleas','PRUH')

--b) admitted in February 2024

SELECT
	*
FROM
	PatientStay ps
WHERE AdmittedDate BETWEEN '20240201' AND '20240229'

-- using Month to filter
SELECT
	*
FROM
	patientStay
WHERE Month(admitteddate) BETWEEN 2 AND 3
ORDER BY AdmittedDate

--c) only the Surgery wards
SELECT
	*
FROM
	PatientStay ps
WHERE ward LIKE '%Surgery%'


-- Starting with 'D'
SELECT
	*
FROM
	PatientStay ps
WHERE ward LIKE 'D%'


--2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.

SELECT
	PatientId 
	,AdmittedDate 
	,DischargeDate 
	,Hospital 
	,Ward
FROM
	PatientStay
ORDER BY AdmittedDate


--3. Order results by AdmittedDate (latest first) then PatientID column (high to low)

SELECT
	PatientId 
	,AdmittedDate 
	,DischargeDate 
	,Hospital 
	,Ward 
	,datediff(day,admitteddate,DischargeDate) AS [LoS]
FROM
	PatientStay
ORDER BY AdmittedDate DESC, PatientId DESC

--4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.
SELECT
	ps.PatientId
	,ps.AdmittedDate
	,ps.DischargeDate
	,ps.Hospital
	,ps.Ward
	,cast(datediff(day,ps.admitteddate,ps.DischargeDate)+1 AS varchar) + ' Days' AS [LoS]
FROM
	PatientStay ps


/*
1. List the patients -
a) in the Oxleas or PRUH hospitals and
b) admitted in February 2024
c) only the Surgery wards

2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.
3. Order results by AdmittedDate (latest first) then PatientID column (high to low)
4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.
*/

-- Write the SQL statement here

--5. How many patients has each hospital admitted? 



SELECT
	Hospital
	,count(*) AS [CountOfPats]
FROM
	PatientStay ps
GROUP BY hospital
ORDER BY 2 DESC

--6. How much is the total tarriff for each hospital?
SELECT
	Hospital 
	,sum(tariff)
FROM
	PatientStay ps
GROUP BY Hospital

--7. List only those hospitals that have admitted over 10 patients
SELECT
	Hospital 
	,count(*) AS [CountOfPats]
FROM
	PatientStay ps
GROUP BY hospital
ORDER BY 2 DESC
-- No clue with the one above

--8. Order by the hospital with most admissions first
SELECT
	*
FROM
	PatientStay ps

SELECT
	ps.Hospital 
	,count(*)
FROM
	PatientStay ps
GROUP BY ps.Hospital



/*
5. How many patients has each hospital admitted? 
6. How much is the total tarriff for each hospital?
7. List only those hospitals that have admitted over 10 patients
8. Order by the hospital with most admissions first
*/

-- Write the SQL statement here


--5. How many patients has each hospital admitted? 



--6. How much is the total tarriff for each hospital?



--7. List only those hospitals that have admitted over 10 patients



--8. Order by the hospital with most admissions first




select 
count(*) as [Count of Pat]
from PatientStay
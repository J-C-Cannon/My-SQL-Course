/*
Foundation Recap Exercise

Use the table PatientStay.  
This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024
*/

--1. List the patients -
--a) in the Oxleas or PRUH hospitals and

SELECT * FROM PatientStay ps 
where Hospital in ('Oxleas','PRUH')

--b) admitted in February 2024

SELECT * FROM PatientStay ps 
where AdmittedDate between '20240201' and '20240229'

-- using Month to filter
select * from patientStay 
where Month(admitteddate) between 2 and 3
order by AdmittedDate

--c) only the Surgery wards
SELECT * FROM PatientStay ps 
where ward like '%Surgery%'


-- Starting with 'D'
SELECT * FROM PatientStay ps 
where ward like 'D%'


--2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.

select PatientId,AdmittedDate,DischargeDate,Hospital,Ward From PatientStay order by AdmittedDate


--3. Order results by AdmittedDate (latest first) then PatientID column (high to low)
select PatientId,AdmittedDate,DischargeDate,Hospital,Ward,datediff(day,admitteddate,DischargeDate) as [LoS] From PatientStay
order by AdmittedDate Desc, PatientId DESC

--4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.
select 
	ps.PatientId,
	ps.AdmittedDate,
	ps.DischargeDate,
	ps.Hospital,
	ps.Ward, 
	cast(datediff(day,ps.admitteddate,ps.DischargeDate)+1 as varchar) + ' Days' as [LoS] 
From PatientStay ps


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
SELECT Hospital,count(*) as [CountOfPats] FROM PatientStay ps 
group by hospital order by 2 desc

--6. How much is the total tarriff for each hospital?
SELECT Hospital,sum(tariff) FROM PatientStay ps 
group by Hospital

--7. List only those hospitals that have admitted over 10 patients
SELECT Hospital, count(*) as [CountOfPats] FROM PatientStay ps 
group by hospital order by 2 desc
-- No clue with the one above

--8. Order by the hospital with most admissions first
SELECT * FROM PatientStay ps 

SELECT hospital, count(*) FROM PatientStay ps 



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

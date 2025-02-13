/*
Foundation Recap Exercise

Use the table PatientStay.  
This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024
*/

SELECT
	*
FROM
	PatientStay ps ;

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

--1 - 4
SELECT PatientId, AdmittedDate, DischargeDate, Hospital, Ward,
DATEDIFF(DAY, AdmittedDate, DischargeDate) + 1 AS LengthOfStay
FROM PatientStay ps
WHERE hospital IN ('PRUH','Oxleas')
AND AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
AND Ward LIKE '%Surgery%'
ORDER BY AdmittedDate DESC, PatientId DESC 



/*
5. How many patients has each hospital admitted? 
6. How much is the total tarriff for each hospital?
7. List only those hospitals that have admitted over 10 patients
8. Order by the hospital with most admissions first
*/

-- Write the SQL statement here
--5
SELECT Hospital,
COUNT(PatientID) AS Number_Patients
FROM PatientStay
WHERE AdmittedDate IS NOT NULL
GROUP BY Hospital

--6
SELECT Hospital,
SUM(Tariff) AS Total_Tariff
FROM PatientStay
GROUP BY Hospital

--7 & 8
SELECT Hospital,
COUNT(PatientID) AS Number_Patients
FROM PatientStay
GROUP BY Hospital
HAVING COUNT(PatientID) >= 10
ORDER BY Number_Patients DESC
SELECT *
FROM PatientStay ps
WHERE hospital IN ('PRUH','Oxleas')
AND AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
AND Ward LIKE '%Surgery%'
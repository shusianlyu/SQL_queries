/*Reviews & Comments & Users*/

SELECT R.business_id
FROM Reviews R
WHERE R.author IN (SELECT F.user_id FROM Friends F)
GROUP BY R.business_id
MINUS
SELECT R.business_id
FROM Reviews R
WHERE R.author NOT IN (SELECT F.user_id FROM Friends F)
GROUP BY R.business_id





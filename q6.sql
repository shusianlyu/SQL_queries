SELECT B.category_type, COUNT(*) AS rcount
FROM Reviews R, Businesses B
WHERE R.business_id=B.id
GROUP BY B.category_type

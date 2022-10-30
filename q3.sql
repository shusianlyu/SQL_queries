/*Categories name cotains '%Coffee%' B.address_state = 'CA'*/

SELECT B.id, B.business_name
FROM Businesses B
WHERE B.address_state = 'CA' AND B.business_name LIKE '%Coffee%' 
AND B.category_type <> (SELECT C.id FROM Categories C WHERE C.name LIKE '%Coffee%')
ORDER BY B.id;
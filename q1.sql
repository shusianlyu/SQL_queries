/*business&category&*states
BCT2&AZ
category national parks -> find category_id
business -> find BCT2
find AZ*/

SELECT COUNT(*)
FROM Businesses B
WHERE B.address_state = 'AZ' and B.category_type IN (SELECT C.id FROM Categories C WHERE C.name = 'National Parks')
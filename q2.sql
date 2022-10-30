/*Users birthplace CA(4,9,11) & user_checkin & business.address_state(3,4,6,7,8,9,10)

use NOT IN */

SELECT U.id
FROM Users U WHERE U.birthplace = 'CA' AND U.id NOT IN (SELECT C.user_id 
FROM User_checkin C WHERE C.business_id IN (SELECT B.id 
FROM Businesses B WHERE B.address_state = 'CA'))



SELECT U.id
FROM Users U
WHERE U.gender = 'M' AND U.id IN (SELECT C.user_id 
FROM Complimented C WHERE C.friend_id IN (SELECT U.id 
FROM Users U WHERE U.gender = 'F'))
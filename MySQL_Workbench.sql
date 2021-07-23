use TWITTER;
SELECT * from users;
SELECT * from users where first_name like "a%";
INSERT INTO users (id, first_name,last_name,handle,birthday) VALUES(6,'Victor',"Henriquez","Vitoco",19700122);
UPDATE users SET handle = 'Vitorio', created_at = curdate(), updated_at = curdate() WHERE id=6;
DELETE FROM users WHERE id=6

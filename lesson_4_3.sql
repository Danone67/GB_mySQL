SELECT birthday FROM profiles;

-- вычислим разницу между текущим годом и годом рождения пользователя,
-- из результата вычетаем единицу, если текущий день находится к началу календаря ближе, чем день рождения
SELECT user_id, YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) AS age 
FROM profiles 
ORDER BY age;

-- добавим колонку is_active
ALTER TABLE profiles ADD is_active BOOLEAN DEFAULT true NOT NULL;

DESCRIBE profiles;
-- помечаем пользователей, чей возраст < 18, как неактивных
UPDATE profiles
SET is_active = 0
WHERE (YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5))) < 18;

SELECT * FROM profiles;
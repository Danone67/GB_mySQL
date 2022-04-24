SELECT * FROM messages;

-- добавим новую запись, с неактуальной датой
INSERT INTO messages (from_user_id, to_user_id, txt, created_at)
VALUES (3, 5, 'Тест скрипта, удаляющего сообщения из будущего', '2023-04-24 21:21:21');

-- выведем ее на экран
SELECT * FROM messages 
ORDER BY id DESC 
LIMIT 1;

-- удалим те записи, дата создания которых больше текущей даты
DELETE FROM messages 
WHERE created_at > now();


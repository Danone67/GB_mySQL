-- данные внутри таблиц сгенерированы с помощью ресурса https://generatedata.com/

SHOW TABLES;

-- увеличим количество символов в колонке phone
ALTER TABLE users MODIFY COLUMN phone char(15);

-- добавление данных в таблицу users
INSERT IGNORE INTO users (firstname, lastname, email, phone)
VALUES
  ("Henry","Murphy","diam@protonmail.org","1-874-160-7158"),
  ("Herrod","Burns","augue.sed@google.com","(643) 281-4567"),
  ("Quynn","Lynch","non.hendrerit@outlook.net","1-837-562-7885"),
  ("Iris","Wood","ridiculus.mus@hotmail.org","1-841-658-3864"),
  ("Gray","Hughes","euismod@yahoo.com","(151) 213-3659"),
  ("Mohammad","Burke","arcu.sed@aol.org","1-734-353-1491"),
  ("Joseph","Elliott","mauris.sagittis@icloud.org","(787) 639-0287"),
  ("Magee","Cunningham","vel.sapien@aol.ca","(318) 743-7765"),
  ("Jasper","Bennett","varius.orci@icloud.org","(213) 164-1796"),
  ("Marny","Perez","erat.in@aol.org","1-584-282-1252");
  
 
DESCRIBE profiles;

-- добавление данных в таблицу profiles
INSERT IGNORE INTO profiles (user_id, gender, birthday, photo_id, city, country)
VALUES
  (3, "f","1949-08-13","124565","Punggol","Indonesia"),
  (4, "f","1973-10-31","460891","Cork","Indonesia"),
  (5, "f","2017-09-23","601607","Heidenheim","Brazil"),
  (6, "m","1957-10-11","3971274","Uyo","Peru"),
  (7, "f","1969-12-01","151823","Kalisz","Chile"),
  (8, "m","1948-12-02","134310","Łomża","Ireland"),
  (9, "m","2006-03-25","393886","Gia Bình","Austria"),
  (10, "m","1965-06-21","111666","Hoogeveen","Peru"),
  (11, "f","2001-11-20","400377","Dublin","Canada"),
  (12, "m","2003-02-16","392214","Grimma","Peru");

SELECT * FROM messages;

-- очистим таблицу messages
TRUNCATE TABLE messages;

-- добавление данных в таблицу messages
INSERT INTO messages (from_user_id, to_user_id, txt)
VALUES
  (2,12,"Aliquam vulputate"),
  (10,8,"rutrum non, hendrerit id, ante. Nunc mauris"),
  (8,9,"in faucibus"),
  (5,4,"auctor, nunc"),
  (7,6,"nulla."),
  (6,5,"Nulla dignissim. Maecenas ornare egestas ligula."),
  (11,7,"rutrum, justo. Praesent luctus. Curabitur"),
  (2,7,"mus. Proin vel nisl. Quisque"),
  (7,3,"ipsum. Curabitur consequat,"),
  (1,8,"quis accumsan convallis, ante lectus convallis");
 
SELECT * FROM friend_requests;

-- добавление данных в friend_requests
INSERT IGNORE INTO friend_requests (from_user_id, to_user_id, accepted)
VALUES
  (6,5,1),
  (11,7,1),
  (2,7,1),
  (7,3,0),
  (1,8,0),
  (4,5,0),
  (7,6,0),
  (7,2,1),
  (10,11,0),
  (9,5,1);
 
SELECT * FROM communities;

-- очистим таблицу communities
TRUNCATE TABLE communities;
-- ошибка из за внешнего ключа, таблица communities_users ссылается на communities
-- удалим внешние ключи в communities_users, очистим таблицу communities, внесем новые данные и вернем FK обратно
ALTER TABLE communities_users DROP FOREIGN KEY communities_users_ibfk_1;
ALTER TABLE communities_users DROP FOREIGN KEY communities_users_ibfk_2;
TRUNCATE TABLE communities;
-- очистим таблицу communities_users
TRUNCATE TABLE communities_users;

-- добавление данных в таблицу communities
INSERT INTO communities (name, description, admin_id)
VALUES
  ("Cum Sociis LLP","vitae semper egestas, urna justo faucibus lectus, a",2),
  ("Semper Dui Foundation","lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies",1),
  ("Sit Ltd","Duis risus odio, auctor vitae,",4),
  ("Pellentesque Habitant Industries","vel est tempor",6),
  ("Imperdiet Ullamcorper Duis PC","sed pede.",6),
  ("Nisi Incorporated","Curae Donec tincidunt. Donec vitae erat vel",7),
  ("Commodo Auctor Limited","mauris id sapien. Cras dolor dolor, tempus non,",9),
  ("Orci Quis Lectus PC","mauris sapien, cursus in, hendrerit",9),
  ("Nulla Tempor Incorporated","nunc sed pede. Cum",9),
  ("Proin Industries","nulla vulputate",6);
 
 -- вернем FK
ALTER TABLE communities_users 
ADD FOREIGN KEY (community_id) REFERENCES communities (id),
ADD FOREIGN KEY (user_id) REFERENCES users (id);

-- добавление данных в таблицу communities_users
INSERT INTO communities_users (community_id, user_id)
VALUES
  (1,8),
  (5,1),
  (9,8),
  (1,7),
  (3,8),
  (5,5),
  (7,9),
  (6,4),
  (7,5),
  (10,8);
 
SELECT * FROM communities_users;

SELECT * FROM media_types;

-- добавление данных в media_types
INSERT IGNORE INTO media_types 
VALUES (DEFAULT, 'изображение'),
       (DEFAULT, 'музыка'),
       (DEFAULT, 'GIF-анимация'),
       (DEFAULT, 'видеофайлы'),
       (DEFAULT, 'текстовый документ'),
       (DEFAULT, 'рисунок'),
       (DEFAULT, 'ссылка'),
       (DEFAULT, 'ZIP/RAR архив'),
       (DEFAULT, 'Бинарный исполняемый файл'),
       (DEFAULT, 'Unknown');
      
SELECT * FROM media;

INSERT IGNORE INTO media (user_id, media_types_id, file_name, file_size)
VALUES
  (8,8,"https://baidu.com",1251),
  (7,8,"http://zoom.us",1592),
  (2,8,"https://ebay.com",3938),
  (10,8,"https://naver.com",2627),
  (5,8,"https://naver.com",4916),
  (8,9,"FSX81DSY2DD.txt",1552),
  (6,3,"MFQ86EMJ7EF.avi",2369),
  (6,10,"DDS11XXU6YK.mp3",4980),
  (12,10,"ZQV56UUF6YE.zip",433),
  (7,6,"OVN31XQC1SC.exe",3528);

SELECT * FROM likes;

-- добавление данных в таблицу likes
INSERT INTO likes (user_id, media_id)
VALUES (2, 3),
	   (3, 3),
	   (4, 4),
	   (8, 1),
	   (8, 4),
	   (8, 8),
	   (9, 1),
	   (5, 5),
	   (3, 7);
	   
SELECT * FROM photo_albums;

-- добавление данных в таблицу photo_albums
INSERT INTO photo_albums (name, user_id)
VALUES ('Family', 3),
	   ('Work', 5),
	   ('Pets', 2),
	   ('Flowers', 2),
	   ('Cars', 7),
	   ('Cities', 9),
	   ('Happy New Year', 4),
	   ('My Biryhday', 10),
	   ('Love', 1),
	   ('Road', 11);
	   
SELECT * FROM photos;

-- добавление данных в таблицу photos
INSERT INTO photos (album_id, media_id)
VALUES (2, 4),
	   (3, 3),
	   (3, 1),
	   (4, 3),
	   (5, 3),
	   (6, 3),
	   (6, 6),
	   (7, 3);

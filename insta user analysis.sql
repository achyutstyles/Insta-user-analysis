use ig_clone;
describe users;
-- 1. 5 oldest users of the instagram from the database
select * from users;
select username,created_at from users order by created_at limit 5;
-- 2. users who never posted a single photo on instagram
select * from photos,users;
select * from users u left join photos p on p.user_id=u.id where
p.image_url is null order by u.username;
-- 3. winner of the contest and provide their details to the team
select * from likes,photos,users;
select likes.photo_id,users.username, count(likes.users_id) as likess
from likes inner join photos on likes.photo_id=photos.id
inner join users on photos.user_id=users.id group by
likes.photo_id,users.username order by likess desc;
-- 4.identify and suggest the top 5 most commonly used hashtags on platform
select * from photo_tags,tags;
select t.tag_name, count(p.photo_id) as ht from photo_tags p inner join
tags t on t.id=p.tag_id group by t.tag_name order by ht desc;
-- 5.what day of the week do most users register on
select * from users;
select DATE_FORMAT((created_at), "%w") as dayy, count(username)
from users group by 1 order by 2 desc;

-- ======= TABLA USERS ======

create table users ( 
  id serial primary key, 
  firstname varchar(50),
  lastname varchar(50),
  email varchar(100)
);

drop table users;

select * from users;

insert into users  (firstname, lastname, email) values
('Lina', 'Fernanda', 'lina_fernanda@gmail.com'), -- 1
('Arabella', 'vargas', 'arabellaVargas@gmail.com'), -- 2
('carlos', 'ivan', 'carlosIvan@gmail.com'); -- 3

delete from users where id=3;


-- ==== TABLA POST ====

create table posts (
  id serial primary key, 
  creator_id int references users(id),
  title varchar (50),
  texto text
);

drop table posts;

insert into posts (creator_id, title, text) values
(2, 'First post', 'Lorem ipsum dolor sit amet consectetur.'),
(1, 'second post', 'Lorem ipsum dolor sit amet consectetur.'),
(3, 'third post', 'Lorem ipsum dolor sit amet consectetur.'),
(2, 'fourth post', 'Lorem ipsum dolor sit amet consectetur.'),
(1, 'fifth post', 'Lorem ipsum dolor sit amet consectetur.');

select * from posts;

alter table posts rename column texto to text;

-- ==== USERS INNER JOIN POSTS ====

select * from users U inner join posts P
on U.id = P.creator_id;

-- ==== TABLA LIKES ====

create table likes (
   id serial primary key,
   user_id int references users(id),
   post_id int references posts(id)
);

drop table likes;
select * from likes;
TRUNCATE likes RESTART IDENTITY CASCADE;


-- === INCERSION DE DATOS EN LA TABLA LIKES 

insert into likes (user_id, post_id) values 
(1, 2),
(3, 4),
(1, 5),
(2, 1);

select * from posts inner join users
on posts.creator_id = users.id;

select users.firstname, posts.title from users inner join likes 
on likes.user_id = users.id inner join posts
on likes.post_id = posts.id;






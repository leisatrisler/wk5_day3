-- Add a row of data into the blog_user table
-- Syntax: INSERT INTO table_name(col_1, col_2, etc.) VALUES (val_1, val_2, etc.)


select *
from blog_user

insert into blog_user(
	username,
	password_hash,
	email,
	first_name,
	last_name,
	birthday,
	password_hint
) values (
	'brians',
	'dfgsjdsdjgajkd',
	'brians@ct.com',
	'Brian',
	'Stanton',
	'1979-03-13',
	'good luck!'
);

select *
from blog_user;

insert into blog_user(
	email,
	username,
	birthday,
	last_name,
	first_name,
	middle_name,
	password_hash,
	password_hint,
	birthday
) values (
	'jumpman23@goat.com',
	'airjordan',
	'1961-02-17',
	'Jordan',
	'Michael',
	'Jeffrey',
	'ghajgkzdgh',
	'bulls'
);

select *
from blog_user;

-- insert without column names
-- syntex: INSERT INTO table_name VALUES (val_1, val_2,etc.)
insert into category values(
	1,
	'Health & Wellness',
	'Articles about bettering your mental and physical wellbeing',
	'#4147e8'
);

select *
from category;

-- Because we manually set the category_id to 1, the SERIAL did not call the next val
-- So if we try and to create another category using the default category_id, we will initally run into an error
insert into category(
	category_name,
	description,
	color
) values (
	'Technolgy',
	'Articles about the technology that shapes and changes our world',
	'#c73920'
);

select *
from category;

-- Insert Multiple rows of data in one command
-- Syntax: INSERT INTO table_name (col_1, col_2, etc.) VALUES (val_a_1, val_a_2, etc.)

insert into post(
	title,
	body,
	copyright,
	user_id,
) values (
	'ChatGPT',
	'It is going to take over the world. Or will it ?',
	true,
	1
), (
	'Chicago Bulls',
	'Ever since I left this franchise has been a joke',
	false 
	2
), (
	'Python',
	'I love Python. It is a great language and I am excited to keep learning!',
	'no',
	1
);

select *
from post;

---- Try to add another post with a user id of a user that does not exist
--insert into post (
--	title,
--	body,
--	copyright,
--	user_id	
--) values (
--	'Spring',
--	'The weather is becoming much nicer and I love it!',
--	'off',
--	3 -- user with ID 3 DOES not EXIST!
--);


insert into post_category
values(1,2),
(2,1),
(2,2),
(3,2),

select *
from post_category 

insert into post_comment (
	body, 
	post_id,
	user_id,	
) values (
	'I agree. Jerry needs to sell the team.',
	2,
	1
);

select *
from post_comment;


insert into post_comment(
	body,
	post_id,
	user_id
) values (
	'Do you like it better than SQL or Javascript? I do but I know some do not'
	3,
	2
);

select *
from post;

-- UPDATE DATA
-- Syntax: UPDATE table_name SET col_name = value WHERE condition 
update post 
set title = 'Python Rules!'
where post_id = 3;

select *
from post;

-- an UPDATE/SET without a where condition, all rows will update 
update post 
set copyright = true;

select *
from post;

select *
from blog_user

insert into blog_user(
	username,
	password_hash,
	email,
	first_name,
	last_name,
	birthday,
	password_hint
) VALUES (
	'kevinb',
	'dfjhjdskfhdsf',
	'kevinb@ct.com',
	'Kevin',
	'Beier',
	'1977-05-26',
	'bad luck!'
),(
	'greatone',
	'kdsfjdskf',
	'wayneg@nhl.com',
	'Wayne',
	'Gretzky',
	'1962-09-06',
	'hockey!'
);

select *
from blog_user;

--UPDATE multiple rows based on a condition 
update blog_user 
set middle_name = 'Coding'
where email like '%@ct.com';

select *
from blog_user;


-- Update multiple comments at a time
-- Syntax: UPDATE table_name SET col_1 = val_1, col_2 = val_2, etc. WHERE condition 
update post 
set body = 'I won 6 rings here.', last_edited = current_timestamp 
where post_id = 2;

select *
from post;

-- Constraints still apply to updates as well
--update post 
--set user_id = 10 -- Will not work since user id 10 does not exist !
--where post_id = 1;

insert into category(category_name, description, color)
values  ('abc', 'abc123', 'dfddf'),('cba', 'cba', 'cba'),('test123', '1234 test', '1234');

select *
from category;

-- Delete a row/record from a table
-- Syntax: Delete from table_name where condition 

delete from category 
where category_id = 4;

select *
from category;

-- Delete multiple rows if they meet the condition
delete from category
where color not like '#%';

select *
from category;

select *
from post_category;

-- DELETE FROM without a where clause will delete ALL ROWS
select *
from post_comment;

delete from post_comment;

select *
from post_comment;














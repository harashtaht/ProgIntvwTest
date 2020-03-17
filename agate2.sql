show databases;

use finalproject;

show tables;

CREATE TABLE authors
(
	author_name VARCHAR(255) NOT NULL,
    book_name VARCHAR(255) NOT NULL
    );
    
CREATE TABLE books
(
	book_name VARCHAR(255) NOT NULL,
    sold_copies INT);
    
INSERT INTO authors (author_name, book_name) VALUES
("author_1", "book_1"),
("author_1", "book_2"),
("author_2", "book_3"),
("author_2", "book_4"),
("author_2", "book_5"),
("author_3", "book_6");

SELECT * FROM books;

INSERT INTO books (sold_copies, book_name) VALUES
(1000, "book_1"),
(1500, "book_2"),
(34000, "book_3"),
(29000, "book_4"),
(40000, "book_5"),
(4400, "book_6");


SELECT author_name, sold_copies FROM authors a
LEFT JOIN books b on a.book_name = b.book_name
ORDER BY sold_copies ASC;

SELECT author_name, SUM(sold_copies) FROM authors a
LEFT JOIN books b on a.book_name = b.book_name;

#######################
### 1.	Create an SQL query that shows the TOP 3 authors who sold the least books in total.
### Answer No 1 

SELECT author_name, SUM(sold_copies) as total_sold FROM authors a
LEFT JOIN books b on a.book_name = b.book_name
GROUP BY author_name
ORDER BY total_sold ASC
LIMIT 3;


######################
#### 2. Write an SQL query to find out how many users inserted more than 2000 
#### but less than 4000 images in their presentations!

CREATE TABLE event_log
(
	user_id INT NOT NULL,
    event_date_time INT NOT NULL
    );
    
SHOW TABLES;
SELECT * FROM event_log;

INSERT INTO event_log (user_id, event_date_time) VALUES
(7494212, 1535308430),
(7494212, 1535308433),
(1475185, 1535308444),
(6946725, 1535308475),
(6946725, 1535308476),
(6946725, 1535308477);

SELECT * FROM event_log;

### Answer No 2

-- 
-- (SELECT 
--         user_id, COUNT(event_date_time) AS times_inserted
--     FROM
--         event_log
--     GROUP BY user_id
--     HAVING (COUNT(event_date_time) < 3
--         AND COUNT(event_date_time) >= 1));
-- 

SELECT 
    COUNT(user_id)
FROM
    (SELECT 
        user_id, COUNT(event_date_time) AS times_inserted
    FROM
        event_log
    GROUP BY user_id
    HAVING (COUNT(event_date_time) < 3
        AND COUNT(event_date_time) >= 1)) AS T;

--  2000< x <4000; --> REAL CONDITION


######################
#### 3. 
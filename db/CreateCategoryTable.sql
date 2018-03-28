DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
  category_id SERIAL,
category_name VARCHAR(50) NOT NULL,
PRIMARY KEY (category_id));

//1
INSERT INTO Category (category_name)
VALUES ('Clothes');

//2
INSERT INTO Category (category_name)
VALUES ('Food');

//3
INSERT INTO Category (category_name)
VALUES ('Toiletries');

//4
INSERT INTO Category (category_name)
VALUES ('Furniture');

//5
INSERT INTO Category (category_name)
VALUES ('Electronics');

DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
  category_id SERIAL,
category_name VARCHAR(50) NOT NULL,
PRIMARY KEY (category_id));

INSERT INTO Category (category_name)
VALUES ('Clothes');

INSERT INTO Category (category_name)
VALUES ('Hats');

INSERT INTO Category (category_name)
VALUES ('Toiletries');

INSERT INTO Category (category_name)
VALUES ('Household');

INSERT INTO Category (category_name)
VALUES ('Electronics');

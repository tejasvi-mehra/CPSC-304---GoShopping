DROP TABLE IF EXISTS Items;
CREATE TABLE Items(
  item_id SERIAL,
item_name VARCHAR(50) NOT NULL,
manufacturer VARCHAR(50) NOT NULL,
item_quantity INTEGER,
price INTEGER NOT NULL,
category_id SERIAL NOT NULL REFERENCES Category(category_id) ON DELETE CASCADE,
PRIMARY KEY (item_id),
FOREIGN KEY (category_id) REFERENCES Category(category_id),
CHECK (item_quantity >= 0));


INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Pyjamas', 'Ralph Lauren', 10, 10, 1);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Socks', 'Ralph Lauren', 20, 49, 1);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Sweater', 'Adidas', 20, 149, 1);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Air Jordan Shoes', 'Nike', 0, 249, 1);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Toothbrush', 'Phillips', 30, 152, 3);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Shampoo', 'Dove', 15, 10, 3);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Conditioner', 'Dove', 10, 8, 3);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Sofa', 'ILoveSofa', 40, 4900, 4);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Bed', 'ILoveBed', 2, 10000, 4);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Xbox One', 'Microsoft', 0, 450, 5);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Playstation', 'Sony', 0, 350, 5);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('WiiU', 'Nintendo', 0, 250, 5);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Baked Beans', 'Heinz', 10, 10, 2);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Waffles', 'Eggo', 10, 15, 2);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Olive Oil', 'Olivay', 5, 20, 2);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Chocolate', 'Lindt', 5, 20, 2);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id)
VALUES ('Green Tea', 'Tetley', 100, 5, 2);

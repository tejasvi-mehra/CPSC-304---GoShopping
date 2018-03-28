DROP TABLE IF EXISTS Items;
CREATE TABLE Items(
  item_id SERIAL,
item_name VARCHAR(50) NOT NULL,
manufacturer VARCHAR(50) NOT NULL,
item_quantity INTEGER,
price DECIMAL(12,2) NOT NULL,
category_id SERIAL NOT NULL REFERENCES Category(category_id) ON DELETE CASCADE,
sale_discount DECIMAL(5,4),
PRIMARY KEY (item_id),
FOREIGN KEY (category_id) REFERENCES Category(category_id));

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id, sale_discount)
VALUES ('Pyjamas', 'Ralph Lauren', 10, 10.00, 1, 0);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id, sale_discount)
VALUES ('Socks', 'Ralph Lauren', 20, 49.99, 2, 0.25);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id, sale_discount)
VALUES ('Toothbrush', 'Phillips', 30, 152.99, 3, 0.25);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id, sale_discount)
VALUES ('Sofa', 'ILoveSofa', 40, 4900.00, 4, 0.25);

INSERT INTO Items (item_name, manufacturer, item_quantity, price, category_id, sale_discount)
VALUES ('Xbox One', 'Microsoft', 0, 3.99, 5, 0.25);

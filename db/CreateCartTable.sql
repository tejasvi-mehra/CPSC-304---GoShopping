DROP TABLE IF EXISTS Cart;
CREATE TABLE Cart(
  cart_id SERIAL,
item_id INTEGER NOT NULL,
cart_quantity INTEGER NOT NULL,
customer_id INTEGER NOT NULL REFERENCES Customers(customer_id) ON DELETE CASCADE,
PRIMARY KEY (cart_id, item_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (item_id) REFERENCES Items(item_id),
CHECK (cart_quantity >= 0));

INSERT INTO Cart (item_id, cart_quantity, customer_id)
VALUES (1, 5, 1);
INSERT INTO Cart (item_id, cart_quantity, customer_id)
VALUES (2, 3, 1);
INSERT INTO Cart (item_id, cart_quantity, customer_id)
VALUES (3, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 1, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 2, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 3, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 4, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 5, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 6, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 7, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 8, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 9, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 10, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 11, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 12, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 13, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 14, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 15, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 16, 1, 2);
INSERT INTO Cart (cart_id, item_id, item_quantity, customer_id)
VALUES (3, 17, 1, 2);

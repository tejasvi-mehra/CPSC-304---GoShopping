DROP VIEW IF EXISTS CategoryAvgPrice;
CREATE VIEW CategoryAvgPrice (category_id, category_name, avg) AS
SELECT C.category_id, C.category_name, AVG(price) AS avg_price
FROM Items I NATURAL JOIN Category C
GROUP BY C.category_id;

CREATE VIEW CartCustomersItems (cart_id, customer_id, name, item_id, item_name, cart_quantity, item_quantity) AS
SELECT Cart.cart_id AS "Cart ID", Cart.customer_id "Customer ID", Customers.name AS "Name", Cart.item_id "Item ID", Items.item_name "Item", Cart.cart_quantity "In Cart", Items.item_quantity AS "Stock"
FROM Cart NATURAL JOIN Customers NATURAL JOIN Items
GROUP BY Cart.cart_id, Items.item_quantity, Items.item_name, Customers.name;

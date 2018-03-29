DROP VIEW IF EXISTS CategoryAvgPrice;
CREATE VIEW CategoryAvgPrice (category_id, category_name, avg) AS
SELECT C.category_id, C.category_name, AVG(price) AS avg_price
FROM Items I NATURAL JOIN Category C
GROUP BY C.category_id;

DROP VIEW IF EXISTS CartCustomersItems;
CREATE VIEW CartCustomersItems (cart_id, customer_id, name, item_id, item_name, category_id, category_name, cart_quantity, item_quantity) AS
SELECT Cart.cart_id AS "Cart ID", Cart.customer_id AS "Customer ID", Customers.name AS "Name", Cart.item_id AS "Item ID", Items.item_name AS "Item", category_id AS "Category ID", category_name AS "Category", Cart.cart_quantity AS "In Cart", Items.item_quantity AS "Stock"
FROM Cart NATURAL JOIN Customers NATURAL JOIN Items NATURAL JOIN Category;

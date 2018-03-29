DROP TABLE IF EXISTS Warehouse;
CREATE TABLE Warehouse(
    warehouse_id SERIAL,
  address VARCHAR(50) UNIQUE,
  PRIMARY KEY (warehouse_id));

INSERT INTO Warehouse (address)
VALUES ('123 Warehouse Avenue');

INSERT INTO Warehouse (address)
VALUES ('222 Boulder Street');

INSERT INTO Warehouse (address)
VALUES ('9923 Big Buildings');

INSERT INTO Warehouse (address)
VALUES ('334 Small Street');

INSERT INTO Warehouse (address)
VALUES ('2231 Empty Lane');

DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
  category_id SERIAL,
category_name VARCHAR(50) NOT NULL,
PRIMARY KEY (category_id));

INSERT INTO Category (category_name)
VALUES ('Clothes');

INSERT INTO Category (category_name)
VALUES ('Food');

INSERT INTO Category (category_name)
VALUES ('Toiletries');

INSERT INTO Category (category_name)
VALUES ('Furniture');

INSERT INTO Category (category_name)
VALUES ('Electronics');

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees(
    employee_id SERIAL,
  name VARCHAR(100) NOT NULL,
  password VARCHAR(32) NOT NULL,
  phone VARCHAR(22) NOT NULL,
  employee_sin VARCHAR(9) UNIQUE NOT NULL,
  email VARCHAR(320) UNIQUE NOT NULL,
  warehouse_id INTEGER,
  address VARCHAR(50),
  position VARCHAR(50),
  PRIMARY KEY (employee_id),
  FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id));

INSERT INTO Employees (name, password, phone, employee_sin, email, warehouse_id, address, position)
VALUES ('Penny', 'happy', '613-555-0139', 123456789, 'p@abc.com', 5, '12 Rand Ave.', 'Manager');

INSERT INTO Employees (name, password, phone, employee_sin, email, warehouse_id, address, position)
VALUES ('Issey', 'sad', '780-555-0159', 987364990, 'i@bob.com', 2, '245 Nowhere Street', 'Cashier');

INSERT INTO Employees (name, password, phone, employee_sin, email, warehouse_id, address, position)
VALUES ('Matt', 'sun', '418-555-0169', 937463745, 'm@tim.com', 5, '152 Penny Lane', 'Manager');

INSERT INTO Employees (name, password, phone, employee_sin, email, warehouse_id, address, position)
VALUES ('Jason', 'secretagent', '218-544-0132', 947433722, '4@2221.com', 5, '152 Penny Lane', 'Agent');

INSERT INTO Employees (name, password, phone, employee_sin, email, warehouse_id, address, position)
VALUES ('James', '007', '418-535-2269', 237566675, 'jamb@22231.com', null, '153 Penny Lane', 'Executive');DROP TABLE IF EXISTS Items;
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

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
  customer_id SERIAL,
name VARCHAR(100) NOT NULL,
password VARCHAR(32) NOT NULL,
phone VARCHAR(22),
email VARCHAR(320) UNIQUE,
creditcard VARCHAR(16),
address VARCHAR(50),
PRIMARY KEY (customer_id));

INSERT INTO Customers (name, password, phone, email, creditcard, address)
VALUES ('Ashley', 'password', '123-456-7899', 'a@abc.com', 1234123412341235, '1 Rand Ave.');

INSERT INTO Customers (name, password, phone, email, creditcard, address)
VALUES ('Bob', 'abc123', '123-426-9900', 'b@bob.com', 1234123412341212, '2 Nowhere Street');

INSERT INTO Customers (name, password, phone, email, creditcard, address)
VALUES ('Tim', 'letsgo', '9231235882', 'c@tim.com', 1234123412441234, '15 Penny Lane');

INSERT INTO Customers (name, password, phone, email, creditcard, address)
VALUES ('Dennis', 'ilove304', '9593852212', 'd@rand.com', 1234123412341134, '99 W 15th');

INSERT INTO Customers (name, password, phone, email, creditcard, address)
VALUES ('Josh', 'letsgo', '8273729988', 'j@new.com', 9999444422224444, '12 UBC Ave.');

DROP TABLE IF EXISTS Loyalty;
CREATE TABLE Loyalty(
    customer_id INTEGER REFERENCES Customers(customer_id) ON DELETE CASCADE,
  points INTEGER,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

  INSERT INTO Loyalty (customer_id, points)
  VALUES (1, 0);

  INSERT INTO Loyalty (customer_id, points)
  VALUES (3, 100);

  INSERT INTO Loyalty (customer_id, points)
  VALUES (4, 10000);

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

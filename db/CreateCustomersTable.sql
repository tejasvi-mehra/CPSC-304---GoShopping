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

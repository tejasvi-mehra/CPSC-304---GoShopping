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

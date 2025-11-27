CREATE TABLE category (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(100) NOT NULL
);

CREATE TABLE annonce (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHAR(100) NOT NULL,
price REAL NOT NULL,
city VARCHAR(100) NOT NULL,
description TEXT NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
category_id INT NOT NULL,
FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE tag (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(100) NOT NULL
);

CREATE TABLE annonce_tag (
annonce_id INT NOT NULL,
tag_id INT NOT NULL,
FOREIGN KEY (annonce_id) REFERENCES annonce(id),
FOREIGN KEY (tag_id) REFERENCES tag(id),
PRIMARY KEY (annonce_id, tag_id)
);

-- Insert categories
INSERT INTO category (name) VALUES ('Electronics');
INSERT INTO category (name) VALUES ('Furniture');
INSERT INTO category (name) VALUES ('Books');
INSERT INTO category (name) VALUES ('Clothing');
INSERT INTO category (name) VALUES ('Vehicles');

-- Insert tags
INSERT INTO tag (name) VALUES ('New');
INSERT INTO tag (name) VALUES ('Used');
INSERT INTO tag (name) VALUES ('On Sale');
INSERT INTO tag (name) VALUES ('Limited Edition');
INSERT INTO tag (name) VALUES ('Free Shipping');

-- Insert annonces
INSERT INTO annonce (title, price, city, description, category_id) VALUES ('iPhone 12', 799.99, 'New York', 'A brand new iPhone 12, unopened box.', 1);
INSERT INTO annonce (title, price, city, description, category_id) VALUES ('Sofa Set', 299.99, 'Los Angeles', 'Comfortable sofa set in good condition.', 2);
INSERT INTO annonce (title, price, city, description, category_id) VALUES ('Harry Potter Book Set', 49.99, 'Chicago', 'Complete set of Harry Potter books.', 3);
INSERT INTO annonce (title, price, city, description, category_id) VALUES ('Leather Jacket', 89.99, 'Miami', 'Stylish leather jacket, size M.', 4);

-- Insert annonce_tag relationships
INSERT INTO annonce_tag (annonce_id, tag_id) VALUES (1, 1);
INSERT INTO annonce_tag (annonce_id, tag_id) VALUES (1, 5);
INSERT INTO annonce_tag (annonce_id, tag_id) VALUES (2, 2);
INSERT INTO annonce_tag (annonce_id, tag_id) VALUES (2, 3);
INSERT INTO annonce_tag (annonce_id, tag_id) VALUES (3, 2);

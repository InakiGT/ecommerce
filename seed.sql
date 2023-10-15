CREATE TABLE Categories(
	id			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    description	TEXT NOT NULL
);

CREATE TABLE Products(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name		VARCHAR(255) NOT NULL,
    category_id	INT,
    imageUrl	VARCHAR(500),
    price 		DOUBLE NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Clients(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name		VARCHAR(50) NOT NULL,
   	lastname	VARCHAR(50),
    email 		VARCHAR(255) NOT NULL,
    `password`	VARCHAR(50) NOT NULL
);

CREATE TABLE Cp(
    id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    city		VARCHAR(50),
    state		VARCHAR(50)
);

CREATE TABLE ShippingAdd(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    number 		INT NOT NULL,
    street		VARCHAR(50) NOT NULL,
    apartment 	VARCHAR(5),
    cp_id 		INT,
    FOREIGN KEY (cp_id) REFERENCES Cp(id)
);

CREATE TABLE Buys(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    client_id	INT,
    shipping_id	INT,
    total 		DOUBLE,
    FOREIGN KEY (client_id) REFERENCES Clients(id),
    FOREIGN KEY (shipping_id) REFERENCES ShippingAdd(id)
);

CREATE TABLE ShippingInst(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    instruction	TEXT,
    address_id	INT,
    FOREIGN KEY (address_id) REFERENCES ShippingAdd(id)
);

CREATE TABLE Suppliers(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name		VARCHAR(255),
    email		VARCHAR(255)
);

CREATE TABLE Supplier_product(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    supplier_id	INT,
    product_id	INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

CREATE TABLE Sells(
	id 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    product_id	INT,
    buy_id		INT,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (buy_id) REFERENCES Buys(id)
);
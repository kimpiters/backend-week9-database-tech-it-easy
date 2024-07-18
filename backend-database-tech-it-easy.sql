-------- CREATE TABLES --------

CREATE TABLE Products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	brand VARCHAR(255) NOT NULL,
	price DECIMAL NOT NULL,
	current_stock INT NOT NULL,
	sold INT NOT NULL,
	type VARCHAR(255) NOT NULL CHECK (type = 'television' OR type = 'remote control' OR type = 'ci module' OR type = 'wall bracket')
);

CREATE TABLE Items (
	serial_number VARCHAR(255) NOT NULL PRIMARY KEY,
	date_sold TIMESTAMP,
	product_id INT NOT NULL REFERENCES Products(id)
);

CREATE TABLE Televisions (
	id SERIAL PRIMARY KEY,
	height INT NOT NULL,
	width INT NOT NULL,
	screen_quality VARCHAR(255) NOT NULL,
	screen_type VARCHAR(255) NOT NULL,
	wifi BIT NOT NULL,
	smart_tv BIT NOT NULL,
	voice_control BIT NOT NULL,
	hdr BIT NOT NULL,
	product_id INT NOT NULL REFERENCES Products(id)
);

CREATE TABLE Remote_controls (
	id SERIAL PRIMARY KEY,
	smart BIT NOT NULL,
	battery_type VARCHAR(255) NOT NULL,
	product_id INT NOT NULL REFERENCES Products(id)
);

CREATE TABLE CI_modules (
	id SERIAL PRIMARY KEY,
	provider VARCHAR(255) NOT NULL,
	encoding VARCHAR(255) NOT NULL,
	product_id INT NOT NULL REFERENCES Products(id)
);

CREATE TABLE Wall_brackets (
	id SERIAL PRIMARY KEY,
	adjustable BIT NOT NULL,
	fixation_method VARCHAR(255) NOT NULL,
	height INT NOT NULL,
	width INT NOT NULL,
	product_id INT NOT NULL REFERENCES Products(id)
);

CREATE TABLE Television_remote_control (
	television_id INT NOT NULL UNIQUE REFERENCES Televisions(id),
	remote_control_id INT NOT NULL UNIQUE REFERENCES Remote_controls(id)
);

CREATE TABLE Television_ci_module (
	television_id INT NOT NULL UNIQUE REFERENCES Televisions(id),
	ci_module_id INT NOT NULL REFERENCES CI_modules(id)
);

CREATE TABLE Television_wall_bracket (
	television_id INT NOT NULL REFERENCES Televisions(id),
	wall_bracket_id INT NOT NULL REFERENCES Wall_brackets(id)
);

CREATE TABLE Users (
	id SERIAL PRIMARY KEY,
	user_name VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	position VARCHAR(255) NOT NULL,
	pay_scale INT NOT NULL,
	vacation_days INT NOT NULL
);

-------- ADD DATA --------

INSERT INTO Products (name, brand, price, current_stock, sold, type)
VALUES	('OTV 40GF-5023C', 'OK.', 279, 13, 2, 'television'),
		('Crystal UHD 55CU7040', 'Samsung', 549, 10, 5, 'television'),
		('OTV Remote Control', 'OK.', 25, 13, 2, 'remote control'),
		('Crystal Remote Control', 'Samsung', 49, 14, 1, 'remote control'),
		('Interactieve CI+ 1.3 module', 'Quantis', 69.95, 19, 1, 'ci module'),
		('Interactieve CI+ 1.3 Ziggo module', 'SMiT', 58, 20, 0, 'ci module'),
		('IWB 1100 32-65"', 'ISY', 34.99, 8, 2, 'wall bracket'),
		('TVM 3405 Fixed Medium Zwart', 'Vogels', 49.99, 9, 1, 'wall bracket');

INSERT INTO Items (serial_number, date_sold, product_id)
VALUES	('12345', '2024-05-12', 1),
		('02468', '2023-06-01', 2),
		('55555', '2024-03-30', 2);

INSERT INTO Televisions (height, width, screen_quality, screen_type, wifi, smart_tv, voice_control, hdr, product_id)
VALUES	(51.45, 89.8, 'Full HD', 'led', '1', '1', '0', '1', 1),
		(72.1, 122.8, 'Ultra HD 4K', 'led', '1', '1', '1', '1', 2);

INSERT INTO Remote_controls (smart, battery_type, product_id)
VALUES	('0', 'AAA', 3),
		('1', 'AAA', 4);

INSERT INTO CI_modules (provider, encoding, product_id)
VALUES	('Caiway', 'Conax', 5),
		('Ziggo', 'Conax', 6);

INSERT INTO Wall_brackets (adjustable, fixation_method, height, width, product_id)
VALUES	('0', 'Schroeven', 400, 400, 7),
		('1', 'ClickLoc', 400, 400, 8);

INSERT INTO Television_remote_control (television_id, remote_control_id)
VALUES	(1, 1),
		(2, 2);

INSERT INTO Television_ci_module (television_id, ci_module_id)
VALUES	(1, 1),
		(2, 1);

INSERT INTO Television_wall_bracket (television_id, wall_bracket_id)
VALUES	(1, 1),
		(1, 2),
		(2, 1),
		(2, 2);

INSERT INTO Users (user_name, password, address, position, pay_scale, vacation_days)
VALUES	('c.darwin', 'password123', 'Galapagoslaan 1', 'magazijn medewerker', 1, 14),
		('m.curie', 'polonium84', 'Radiumstraat 88', 'administratief medewerker', 2, 10);

-------- VIEW TABLES --------

SELECT * FROM Products;

SELECT * FROM Items;

SELECT * FROM Televisions;

SELECT * FROM Remote_controls;

SELECT * FROM CI_modules;

SELECT * FROM Wall_brackets;

SELECT * FROM Television_remote_control;

SELECT * FROM Television_ci_module;

SELECT * FROM Television_wall_bracket;

SELECT * FROM Users;
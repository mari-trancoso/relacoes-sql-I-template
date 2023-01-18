-- Active: 1674043719095@@127.0.0.1@3306

------------------------------- PRÁTICA 1 e 2 1:m
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, name, email, password)
VALUES 
    ("u001", "Mari", "mari@email.com", "mari123"), 
    ("u002", "Paulo", "paulo@email.com", "paulo123");

INSERT INTO phones (id, phone_number, user_id)
VALUES
    ("p001", "5541992199033", "u001"), 
    ("p002", "5541988369014", "u002"), 
    ("p003", "5541996993847", "u002");

INSERT INTO phones (id, phone_number, user_id)
VALUES
    ("p004", "5541996995252", "u004");    --- tinha que dar erro!


DELETE FROM phones 
WHERE user_id = "u004";


SELECT * FROM phones;

SELECT * FROM users;

--- juntando as duas tabelas
SELECT * FROM users
INNER JOIN  phones
ON phones.user_id = users.id;

------------------------------- PRÁTICA 3 1:1
CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

INSERT INTO licenses (id, register_number, category)
VALUES 
    ("l001", "129934", "A"), 
    ("l002", "333444", "B");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES 
    ("d001", "Carlos", "carlos@email.com", "carlos123", "l001"), 
    ("d002", "Marina", "marina@email.com", "marina123", "l002");

DELETE FROM drivers
WHERE id = "d002";

SELECT * FROM drivers;

INSERT INTO drivers
(id, name, email, password, license_id)
VALUES 
    ("d002", "Marina", "marina@email.com", "marina123", "l002");

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;





------------------------------- Exercício Fixação 1:m
CREATE TABLE owners (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE cats (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    color TEXT NOT NULL,
    owner_id TEXT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES owners(id)
);

DROP TABLE cats;

INSERT INTO owners (id, name)
VALUES 
    ("o001", "Mariana"), 
    ("o002", "Junior");

INSERT INTO cats (id, name, color, owner_id)
VALUES 
    ("c001", "isis", "white", "o001"), 
    ("c002", "zé", "black", "o002"), 
    ("c003", "moka", "yellow", "o002");

SELECT * FROM cats
INNER JOIN owners
ON cats.owner_id = owners.id;

INSERT INTO cats (id, name, color, owner_id)
VALUES ("c004", "jenny", "black", "o003");

DELETE FROM cats
WHERE id = "c004";
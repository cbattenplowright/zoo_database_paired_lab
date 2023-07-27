DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosure;

CREATE TABLE enclosure (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
); 

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE animal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosure(id)
);

CREATE TABLE assignment (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosure(id),
    day VARCHAR(255)
); 

INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('big cat field', 20, FALSE);
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('reptile house', 100, FALSE);
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('monkey house', 45, TRUE);

INSERT INTO staff (name, employeeNumber) VALUES ('Captain Rik', 12345);
INSERT INTO staff (name, employeeNumber) VALUES ('Mister Smee', 67892);
INSERT INTO staff (name, employeeNumber) VALUES ('Peter Pan', 98761);



INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Toney', 'Tiger', 59, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Tick-Tock', 'Crocodile', 34, 2);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Mufasa', 'Lion', 40, 1);

INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 2, 'Thursday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 3, 'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3, 1, 'Tuesday');



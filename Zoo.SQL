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

INSERT INTO staff (name, employeeNumber) VALUES ('Captain Hook', 12345);
INSERT INTO staff (name, employeeNumber) VALUES ('Mister Smee', 67892);
INSERT INTO staff (name, employeeNumber) VALUES ('Peter Pan', 98761);
INSERT INTO staff (name, employeeNumber) VALUES ('Wendy', 37821);
INSERT INTO staff (name, employeeNumber) VALUES ('George', 98323);


INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Toney', 'Tiger', 59, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Tick-Tock', 'Crocodile', 34, 2);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Mufasa', 'Lion', 40, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Baghera', 'Jaguar', 22, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Kaa', 'Python', 18, 2);


INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 1, 'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 2, 'Tuesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 3, 'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 2, 'Thursday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 1, 'Friday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 1, 'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 1, 'Tuesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 3, 'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 2, 'Thursday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 2, 'Friday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3, 3, 'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3, 2, 'Tuesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3, 1, 'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3, 2, 'Thursday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3, 3, 'Friday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (4, 3, 'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (4, 1, 'Tuesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (4, 1, 'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (4, 1, 'Thursday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (4, 3, 'Friday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (5, 2, 'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (5, 2, 'Tuesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (5, 1, 'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (5, 2, 'Thursday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (5, 1, 'Friday');

-- -- SELECT statment which displays all animal names in the big cat field enclosure
-- SELECT animal.id, animal.name, enclosure.name
-- FROM animal 
-- INNER JOIN enclosure 
-- ON animal.enclosure_id = enclosure.id 
-- WHERE enclosure.name IN ('big cat field');

-- SELECT statment which displays all animal names in the reptile house
SELECT animal.id, animal.name, enclosure.name 
FROM animal 
INNER JOIN enclosure 
ON animal.enclosure_id = enclosure.id 
WHERE enclosure.name IN ('reptile house');

-- -- SELECT statement displays all the employee names that are working in the monkey house on Wednesdays
-- SELECT e.name, s.name, a.day 
-- FROM enclosure AS e
-- INNER JOIN assignment AS a
-- ON e.id = a.enclosure_id
-- INNER JOIN staff AS s
-- ON s.id = a.employee_id
-- WHERE e.name IN ('monkey house')
-- AND a.day IN ('Wednesday');

-- -- SELECT statement displays all the employee names that are working in the monkey house on Wednesdays
-- SELECT e.name, s.name, a.day
-- FROM enclosure AS e
-- INNER JOIN assignment AS a
-- ON e.id = a.enclosure_id
-- INNER JOIN staff AS s
-- ON s.id = a.employee_id
-- WHERE e.name IN ('big cat field')
-- AND a.day IN ('Friday');
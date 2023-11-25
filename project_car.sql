CREATE TABLE Salesperson (
    salesperson_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Car (
    car_id SERIAL PRIMARY KEY,
    serial_number VARCHAR(50),
    make VARCHAR(50),
    model VARCHAR(50),
    year INTEGER,
    horsepower INTEGER,
    weight INTEGER,
    weight_to_power_ratio NUMERIC,
    is_serviced BOOLEAN DEFAULT FALSE
);

CREATE TABLE ServiceTicket (
    service_ticket_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Invoice (
    invoice_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    salesperson_id INT,
    customer_id INT
);

CREATE TABLE ServiceHistory (
    service_history_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE PartsUsed (
    parts_used_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE Invoice
ADD FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id);

ALTER TABLE Invoice
ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

CREATE OR REPLACE FUNCTION InsertCustomer(name VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Customer (name) VALUES (name);
END;
$$ LANGUAGE plpgsql;


SELECT InsertCustomer('Ren Nogami');



INSERT INTO Car (serial_number, make, model, year, horsepower, weight)
VALUES 
    ('S13-001', 'Nissan', 'Silvia S13', 1988, 205, 1170),
    ('S14-001', 'Nissan', 'Silvia S14', 1993, 247, 1250),
    ('S15-001', 'Nissan', 'Silvia S15', 1999, 250, 1260),
    ('FC3S-001', 'Mazda', 'RX-7 FC3S', 1985, 182, 1100),
    ('EG6-001', 'Honda', 'Civic EG6', 1992, 167, 960),
    ('EK9-001', 'Honda', 'Civic Type R EK9', 1997, 182, 970),
    ('SW20-001', 'Toyota', 'MR2 SW20', 1989, 200, 1280),
    ('R32-001', 'Nissan', 'Skyline GT-R R32', 1999, 276, 1430),
    ('R34-001', 'Nissan', 'Skyline GT-R R34', 1999, 330, 1560),
    ('GC8-001', 'Subaru', 'Impreza WRX STI Type R', 1998, 550, 1200);



--create db
USE [master]
GO

IF DB_ID('EmergencyServicesResponseApplication') IS NOT NULL
BEGIN
	ALTER DATABASE EmergencyServicesResponseApplication SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE EmergencyServicesResponseApplication
END

CREATE DATABASE EmergencyServicesResponseApplication
GO

USE EmergencyServicesResponseApplication
GO

--tables
CREATE TABLE [callers] ( 
	caller_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	phone_number VARCHAR (20) NOT NULL,
	email VARCHAR (50) NOT NULL,
	address VARCHAR (50) NOT NULL,
) 

CREATE TABLE [emergency_service_requests] ( 
	emergency_service_request_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	date_time DATETIME NOT NULL,
	address VARCHAR(50) NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	type VARCHAR(50) NOT NULL,
	status VARCHAR(50) NOT NULL,
	priority VARCHAR(10) NOT NULL,
	description VARCHAR(300) NOT NULL,
) 

CREATE TABLE [fire_stations] (
	fire_station_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	responder_count INT NOT NULL,
)

CREATE TABLE [police_stations] ( 
	police_station_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	responder_count INT NOT NULL,
	inmate_capacity INT NOT NULL,
)

CREATE TABLE [hospitals] ( 
	hospital_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	responder_count INT NOT NULL,
	patient_capacity INT NOT NULL,
)

CREATE TABLE [fire_fighters] (
	fire_fighter_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fire_station_id INT NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	FOREIGN KEY (fire_station_id) REFERENCES fire_stations(fire_station_id)
)

CREATE TABLE [police_officers] (
	police_officer_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	police_station_id INT NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	FOREIGN KEY (police_station_id) REFERENCES police_stations(police_station_id)
)

CREATE TABLE [paramedics] (
	paramedic_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	hospital_id INT NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
)


--inserts
-- Insert data into the [callers] table
INSERT INTO [callers] (first_name, last_name, phone_number, email, address)
VALUES
    ('John', 'Doe', '555-123-4567', 'john.doe@example.com', '123 Main St'),
    ('Jane', 'Smith', '555-987-6543', 'jane.smith@example.com', '456 Elm St'),
    ('Alice', 'Johnson', '555-555-5555', 'alice.johnson@example.com', '789 Oak St'),
    ('Bob', 'Williams', '555-111-2222', 'bob.williams@example.com', '101 Maple Ave'),
    ('Eve', 'Brown', '555-222-3333', 'eve.brown@example.com', '222 Pine Rd');

-- Insert data into the [emergency_service_requests] table
INSERT INTO [emergency_service_requests] (date_time, address, latitude, longitude, type, status, priority, description)
VALUES
    ('2023-10-25 08:30:00', '789 Oak St', 34.12345, -118.56789, 'Fire', 'Pending', 'High', 'House on fire'),
    ('2023-10-25 09:15:00', '567 Pine St', 34.23456, -118.67890, 'Medical', 'Dispatched', 'Medium', 'Medical emergency'),
    ('2023-10-25 10:00:00', '123 Elm St', 34.34567, -118.78901, 'Fire', 'Pending', 'High', 'Apartment fire'),
    ('2023-10-25 11:30:00', '456 Oak St', 34.45678, -118.89012, 'Police', 'In Progress', 'Medium', 'Burglary reported'),
    ('2023-10-25 12:45:00', '789 Maple St', 34.56789, -118.90123, 'Medical', 'Completed', 'Low', 'Minor injury');

-- Insert data into the [fire_stations] table
INSERT INTO [fire_stations] (name, address, latitude, longitude, responder_count)
VALUES
    ('Fire Station 1', '123 Firefighter Ave', 34.34567, -118.78901, 15),
    ('Fire Station 2', '456 Fire Blvd', 34.45678, -118.89012, 12),
    ('Fire Station 3', '789 Fire Lane', 34.56789, -118.90123, 10),
    ('Fire Station 4', '101 Fire Rd', 34.67890, -118.01234, 18),
    ('Fire Station 5', '222 Fire Street', 34.78901, -118.12345, 14);

-- Insert data into the [police_stations] table
INSERT INTO [police_stations] (name, address, latitude, longitude, responder_count, inmate_capacity)
VALUES
    ('Police Station A', '789 Cop Lane', 34.56789, -118.90123, 20, 100),
    ('Police Station B', '101 Law St', 34.67890, -118.01234, 15, 80),
    ('Police Station C', '456 Safety Blvd', 34.34567, -118.78901, 22, 120),
    ('Police Station D', '123 Justice St', 34.45678, -118.89012, 18, 90),
    ('Police Station E', '555 Security Ave', 34.56789, -118.90123, 25, 110);

-- Insert data into the [hospitals] table
INSERT INTO [hospitals] (name, address, latitude, longitude, responder_count, patient_capacity)
VALUES
    ('General Hospital', '123 Health St', 34.78901, -118.12345, 30, 200),
    ('City Medical Center', '456 Care Ave', 34.89012, -118.23456, 25, 150),
    ('Community Hospital', '789 Wellness Blvd', 34.56789, -118.90123, 35, 250),
    ('Medical Center A', '101 Medical Rd', 34.67890, -118.01234, 28, 180),
    ('Regional Hospital', '555 Healing Lane', 34.34567, -118.78901, 40, 300);

-- Insert data into the [fire_fighters] table
INSERT INTO [fire_fighters] (fire_station_id, first_name, last_name)
VALUES
    (1, 'Alice', 'Anderson'),
    (1, 'Bob', 'Baker'),
    (2, 'Charlie', 'Clark'),
    (2, 'David', 'Davis'),
    (3, 'Eve', 'Evans');

-- Insert data into the [police_officers] table
INSERT INTO [police_officers] (police_station_id, first_name, last_name)
VALUES
    (1, 'Frank', 'Foster'),
    (2, 'Grace', 'Garcia'),
    (3, 'Henry', 'Harris'),
    (4, 'Ivy', 'Irwin'),
    (5, 'Jack', 'Jackson');

-- Insert data into the [paramedics] table
INSERT INTO [paramedics] (hospital_id, first_name, last_name)
VALUES
    (1, 'Lisa', 'Lewis'),
    (2, 'Mike', 'Miller'),
    (3, 'Nancy', 'Nelson'),
    (4, 'Oliver', 'Owens'),
    (5, 'Pam', 'Parker');

--create db
USE [master]
GO

IF DB_ID('esra_db') IS NOT NULL
BEGIN
	ALTER DATABASE esra_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE esra_db
END

CREATE DATABASE esra_db
GO

USE esra_db
GO

--tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

CREATE TABLE [callers] ( 
	caller_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	phone_number INT NOT NULL,
	street VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip INT NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
) 

CREATE TABLE [service_requests] ( 
	service_request_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	caller_id INT NOT NULL,
	type VARCHAR(50) NOT NULL,
	date_time DATETIME NOT NULL,
	street VARCHAR(50) NOT NULL,
   city VARCHAR(50) NOT NULL,
   state VARCHAR(50) NOT NULL,
   zip INT NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	status VARCHAR(50) NOT NULL,
	priority VARCHAR(10) NOT NULL,
	description VARCHAR(300) NOT NULL,
	FOREIGN KEY (caller_id) REFERENCES callers(caller_id)
) 

CREATE TABLE [fire_stations] (
	fire_station_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	street VARCHAR(50) NOT NULL,
   city VARCHAR(50) NOT NULL,
   state VARCHAR(50) NOT NULL,
   zip INT NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	responder_count INT NOT NULL,
)

CREATE TABLE [police_stations] ( 
	police_station_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
   city VARCHAR(50) NOT NULL,
   state VARCHAR(50) NOT NULL,
   zip INT NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	responder_count INT NOT NULL,
	inmate_capacity INT NOT NULL,
)

CREATE TABLE [hospitals] ( 
	hospital_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
   city VARCHAR(50) NOT NULL,
   state VARCHAR(50) NOT NULL,
   zip INT NOT NULL,
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
INSERT INTO users (username, password_hash, salt, user_role)
VALUES
	('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user'),
	('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

INSERT INTO [callers] (first_name, last_name, phone_number, email, address)
VALUES
    ('John', 'Doe', '555-123-4567', 'john.doe@example.com', '123 Main St'),
    ('Jane', 'Smith', '555-987-6543', 'jane.smith@example.com', '456 Elm St'),
    ('Alice', 'Johnson', '555-555-5555', 'alice.johnson@example.com', '789 Oak St'),
    ('Bob', 'Williams', '555-111-2222', 'bob.williams@example.com', '101 Maple Ave'),
    ('Eve', 'Brown', '555-222-3333', 'eve.brown@example.com', '222 Pine Rd');

INSERT INTO [emergency_service_requests] (date_time, address, latitude, longitude, type, status, priority, description)
VALUES
    ('2023-10-25 08:30:00', '789 Oak St', 34.12345, -118.56789, 'Fire', 'Pending', 'High', 'House on fire'),
    ('2023-10-25 09:15:00', '567 Pine St', 34.23456, -118.67890, 'Medical', 'Dispatched', 'Medium', 'Medical emergency'),
    ('2023-10-25 10:00:00', '123 Elm St', 34.34567, -118.78901, 'Fire', 'Pending', 'High', 'Apartment fire'),
    ('2023-10-25 11:30:00', '456 Oak St', 34.45678, -118.89012, 'Police', 'In Progress', 'Medium', 'Burglary reported'),
    ('2023-10-25 12:45:00', '789 Maple St', 34.56789, -118.90123, 'Medical', 'Completed', 'Low', 'Minor injury');

INSERT INTO [fire_stations] (name, address, latitude, longitude, responder_count)
VALUES
    ('Fire Station 1', '123 Firefighter Ave', 34.34567, -118.78901, 15),
    ('Fire Station 2', '456 Fire Blvd', 34.45678, -118.89012, 12),
    ('Fire Station 3', '789 Fire Lane', 34.56789, -118.90123, 10),
    ('Fire Station 4', '101 Fire Rd', 34.67890, -118.01234, 18),
    ('Fire Station 5', '222 Fire Street', 34.78901, -118.12345, 14);

INSERT INTO [police_stations] (name, address, latitude, longitude, responder_count, inmate_capacity)
VALUES
    ('Police Station A', '789 Cop Lane', 34.56789, -118.90123, 20, 100),
    ('Police Station B', '101 Law St', 34.67890, -118.01234, 15, 80),
    ('Police Station C', '456 Safety Blvd', 34.34567, -118.78901, 22, 120),
    ('Police Station D', '123 Justice St', 34.45678, -118.89012, 18, 90),
    ('Police Station E', '555 Security Ave', 34.56789, -118.90123, 25, 110);

INSERT INTO [hospitals] (name, address, latitude, longitude, responder_count, patient_capacity)
VALUES
    ('General Hospital', '123 Health St', 34.78901, -118.12345, 30, 200),
    ('City Medical Center', '456 Care Ave', 34.89012, -118.23456, 25, 150),
    ('Community Hospital', '789 Wellness Blvd', 34.56789, -118.90123, 35, 250),
    ('Medical Center A', '101 Medical Rd', 34.67890, -118.01234, 28, 180),
    ('Regional Hospital', '555 Healing Lane', 34.34567, -118.78901, 40, 300);

INSERT INTO [fire_fighters] (fire_station_id, first_name, last_name)
VALUES
    (1, 'Alice', 'Anderson'),
    (1, 'Bob', 'Baker'),
    (2, 'Charlie', 'Clark'),
    (2, 'David', 'Davis'),
    (3, 'Eve', 'Evans');

INSERT INTO [police_officers] (police_station_id, first_name, last_name)
VALUES
    (1, 'Frank', 'Foster'),
    (2, 'Grace', 'Garcia'),
    (3, 'Henry', 'Harris'),
    (4, 'Ivy', 'Irwin'),
    (5, 'Jack', 'Jackson');

INSERT INTO [paramedics] (hospital_id, first_name, last_name)
VALUES
    (1, 'Lisa', 'Lewis'),
    (2, 'Mike', 'Miller'),
    (3, 'Nancy', 'Nelson'),
    (4, 'Oliver', 'Owens'),
    (5, 'Pam', 'Parker');

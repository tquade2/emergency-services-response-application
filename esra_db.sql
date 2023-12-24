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
	phone VARCHAR (15) NOT NULL,
	street VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	state VARCHAR(50) NOT NULL,
	zip VARCHAR(9) NOT NULL,
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
	zip VARCHAR(9) NOT NULL,
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
	zip VARCHAR(9) NOT NULL,
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
	zip VARCHAR(9) NOT NULL,
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
	zip VARCHAR(9) NOT NULL,
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

INSERT INTO callers (first_name, last_name, phone, street, city, state, zip, latitude, longitude)
VALUES
    ('John', 'Doe', 1234567890, '123 Main St', 'Anytown', 'CA', 12345, 34.0522, -118.2437),
    ('Jane', 'Smith', 9876543210, '456 Elm St', 'Somewhere', 'NY', 54321, 40.7128, -74.0060),
    ('Bob', 'Johnson', 5555555555, '789 Oak St', 'Nowhere', 'TX', 67890, 29.7604, -95.3698),
    ('Mary', 'Davis', 1112223333, '101 Pine St', 'Smallville', 'WA', 98765, 47.6062, -122.3321),
    ('David', 'Lee', 9998887777, '555 Cedar St', 'Metropolis', 'IL', 54321, 37.7749, -89.4194);

INSERT INTO service_requests (caller_id, type, date_time, street, city, state, zip, latitude, longitude, status, priority, description)
VALUES
    (1, 'Police', '2023-12-21 10:00:00', '123 Main St', 'Anytown', 'CA', 12345, 34.0522, -118.2437, 'Open', 'High', 'Noise Complaint, party north of residence.'),
    (2, 'Fire', '2023-12-22 14:30:00', '456 Elm St', 'Somewhere', 'NY', 54321, 40.7128, -74.0060, 'Open', 'Medium', 'Cat stcuk in tree.'),
    (3, 'Medical', '2023-12-23 09:15:00', '789 Oak St', 'Nowhere', 'TX', 67890, 29.7604, -95.3698, 'Open', 'Low', 'Middle-aged man collapsed after eating dinner.'),
    (4, 'Police, Fire', '2023-12-24 16:45:00', '101 Pine St', 'Smallville', 'WA', 98765, 47.6062, -122.3321, 'Open', 'Medium', 'Suspected arsonists starting abandoned house fires.'),
    (5, 'Fire, Medical', '2023-12-25 08:30:00', '555 Cedar St', 'Metropolis', 'IL', 54321, 37.7749, -89.4194, 'Open', 'High', 'Burning apartment building');
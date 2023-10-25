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
CREATE TABLE [emergency_service_requests] ( 
	emergency_service_request_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	date_time DATETIME NOT NULL,
	address VARCHAR(50) NOT NULL,
	latitude VARCHAR(10) NOT NULL,
	longitude VARCHAR(10) NOT NULL,
	type VARCHAR(50) NOT NULL,
	status VARCHAR(50) NOT NULL,
	priority VARCHAR(10) NOT NULL,
	description VARCHAR(300) NOT NULL,
) 

CREATE TABLE [fire_stations] (
	fire_station_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL,
	latitude VARCHAR(10) NOT NULL,
	longitude VARCHAR(10) NOT NULL,
	responder_count INT NOT NULL,
)

CREATE TABLE [police_stations] ( 
	police_station_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	latitude VARCHAR(10) NOT NULL,
	longitude VARCHAR(10) NOT NULL,
	responder_count INT NOT NULL,
	inmate_capacity INT NOT NULL,
)

CREATE TABLE [hospitals] ( 
	hospital_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	latitude VARCHAR(10) NOT NULL,
	longitude VARCHAR(10) NOT NULL,
	responder_count INT NOT NULL,
	patient_capacity INT NOT NULL,
)

CREATE TABLE [fire_fighters] (
	fire_fighter_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fire_station_id INT NOT NULL,
	type VARCHAR(50) NOT NULL,
	FOREIGN KEY (fire_station_id) REFERENCES fire_stations(fire_station_id)
)

CREATE TABLE [police_officers] (
	police_officer_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	police_station_id INT NOT NULL,
	type VARCHAR(50) NOT NULL,
	FOREIGN KEY (police_station_id) REFERENCES police_stations(police_station_id)
)

CREATE TABLE [paramedics] (
	paramedic_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	hospital_id INT NOT NULL,
	type VARCHAR(50) NOT NULL,
	FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
)


--inserts
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Smith', 'John', 'john.smith@example.com', '1234567890', '1985-05-15', 1)
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Johnson', 'Jane', 'jane.johnson@example.com', '9876543210', '1990-09-25', 0)
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Doe', 'Michael', 'michael.doe@example.com', NULL, '1980-03-10', 1)
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Williams', 'Emily', 'emily.williams@example.com', '5555555555', '1995-12-01', 0)
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Brown', 'Sarah', 'sarah.brown@example.com', '9998887777', '1988-07-18', 1)
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Davis', 'Matthew', 'matthew.davis@example.com', NULL, '1976-11-30', 0)
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Wilson', 'Olivia', 'olivia.wilson@example.com', '1112223333', '1992-02-05', 1)
--INSERT INTO [member] (last_name, first_name, email_address, phone_number, date_of_birth, has_reminder_emails) VALUES ('Lee', 'James', 'james.lee@example.com', '7777777777', '1982-08-22', 0)

--INSERT INTO [group] (group_name) VALUES ('Coffee Geeks')
--INSERT INTO [group] (group_name) VALUES ('Bicycle Nerds')
--INSERT INTO [group] (group_name) VALUES ('Coding Dorks')

--INSERT INTO [event] (event_name, description, start_date_time, duration, group_number) VALUES ('Coffee Meetup', 'Get together at local coffee shop to talk about and drink coffee.', '2023-10-20T13:00:00', '01:00:00', 1)
--INSERT INTO [event] (event_name, description, start_date_time, duration, group_number) VALUES ('Coffee Meetup', 'Get together at local coffee shop to talk about and drink coffee.', '2023-11-20T13:00:00', '01:00:00', 1)
--INSERT INTO [event] (event_name, description, start_date_time, duration, group_number) VALUES ('Bike Ride', 'Group bike ride on the Olentangy Trail.', '2023-12-20T13:00:00', '01:00:00', 2)
--INSERT INTO [event] (event_name, description, start_date_time, duration, group_number) VALUES ('Side-Project Presentations', 'Present your new side project to the group!', '2023-09-20T13:00:00', '01:00:00', 3)

--INSERT INTO [member_group] (member_number, group_number) VALUES (1,1)
--INSERT INTO [member_group] (member_number, group_number) VALUES (1,2)
--INSERT INTO [member_group] (member_number, group_number) VALUES (1,3)
--INSERT INTO [member_group] (member_number, group_number) VALUES (2,1)
--INSERT INTO [member_group] (member_number, group_number) VALUES (2,2)
--INSERT INTO [member_group] (member_number, group_number) VALUES (2,3)

--INSERT INTO [event_member] (member_number, event_number) VALUES (1,1)
--INSERT INTO [event_member] (member_number, event_number) VALUES (1,2)
--INSERT INTO [event_member] (member_number, event_number) VALUES (1,3)
--INSERT INTO [event_member] (member_number, event_number) VALUES (2,1)
--INSERT INTO [event_member] (member_number, event_number) VALUES (3,1)
--INSERT INTO [event_member] (member_number, event_number) VALUES (4,1)

------foreign keys

ALTER TABLE [[fire_fighters]] CHECK CONSTRAINT [hospital_id]


--ALTER TABLE [member_group] CHECK CONSTRAINT [FK_member_group_member]


--ALTER TABLE [member_group] CHECK CONSTRAINT [FK_member_group_group]


--ALTER TABLE [event_member] CHECK CONSTRAINT [FK_event_member_member]


--ALTER TABLE [event_member] CHECK CONSTRAINT [FK_event_member_event]

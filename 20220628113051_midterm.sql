create database midterm;
use midterm;



/*
Q.1 Design database for online movie ticket booking. For that, write queries for creating all
tables with constraints for online movie ticket booking system. Mention all fields with its
data type in query. [40 Marks]

-- ScheduleTheather - (ID_PK, dayOfTheWeek, startHour, endHour, status[opened, closed]) 
-- MovieTheater - (ID_PK,  name, country, city, postalCode, phoneNumber, email, schedule_FK)
-- Room - (ID_PK, number, teatherID_FK, type[Regular, 3D, VIP, LUXE+], price) 
-- Session - (ID_PK, roomID_FK, startTime, endTime)
-- Movie - (ID_PK, title, type[comedy, scary, fiction, ...], durationMinutes, startDate, endDate, minimalAge, language, subtitles) 
-- Client -(ID_PK, name, phoneNumber, email, address, DOB)
-- Ticket - (ID_PK, theaterID_FK, movieID_FK,  sessionID_FK,  clientname_FK)  
-- Payments - (ID_PK, type[credit, debt, money, ...], status[payed, pending, processing], price_FK, ticketID_FK, clientID_FK)

*/



-- ScheduleTheather - (ID_PK, dayOfTheWeek, startHour, endHour, status[opened, closed]) 
create table ScheduleTheather (
	scheduleID int not null primary key auto_increment,
    dayOfTheWeek varchar(150),
    startHour time,
    endHour time,
    status varchar(150)
);

-- MovieTheater - (ID_PK,  name, country, city, postalCode, phoneNumber, email, schedule_FK)
create table MovieTheater (
	movieTheaterID int not null primary key auto_increment,
    name varchar(255) not null,
    country varchar(150),
    city varchar(150),
    postalCode varchar(150),
    phoneNumber varchar(255) unique,
    email varchar(255) unique,
    scheduleID int references ScheduleTheather(scheduleID)
);


-- Room - (ID_PK, number, teatherID_FK, type[Regular, 3D, VIP, LUXE+], price) 
create table Room (
	roomID int not null primary key auto_increment,
    number int,
    type varchar(150),
    price float,
    movieTheaterID int references MovieTheater(movieTheaterID)
);


-- Session - (ID_PK, roomID_FK, startTime, endTime)
create table Session (
	sessionID int not null primary key auto_increment,
    startTime time,
    endTime time,
    roomID int references Room(roomID)
);

-- Movie - (ID_PK, title, type[comedy, scary, fiction, ...], durationMinutes, startDate, endDate, minimalAge, language, subtitles) 
create table Movie (
	movieID int not null primary key auto_increment,
    title varchar(255) not null,
    type varchar(150),
    durationMinutes int not null,
    startDate date  not null,
    endDate date not null,
    minimalAge int,
    language varchar(150) not null,
    subtitle varchar(150)
);

-- Client -(ID_PK, name, phoneNumber, email, address, DOB)
create table Client (
	clientID int not null primary key auto_increment,
    name varchar(255) not null,
    phoneNumber varchar(150),
    email varchar(255) unique, 
    address varchar(255),
    DOB date
);

-- Ticket - (ID_PK, theaterID_FK, movieID_FK,  sessionID_FK,  clientname_FK)   
create table Ticket (
	ticketID int not null primary key auto_increment,
    movieTheaterID int references MovieTheater(movieTheaterID),
    movieID int references Movie(movieID),
    sessionID int references Session(sessionID),
    clientID int references Client(clientID)    
);


-- Payments - (ID_PK, type[credit, debt, money, ...], status[payed, pending, processing], price_FK, ticketID_FK, clientID_FK)
create table Payments (
	paymentsID int not null primary key auto_increment,
    type varchar(150),
    status varchar(150),
    price int references Room(price),
    ticketID int references Ticket(ticketID),
    clientID int references Client(clientID)    
);




/*
Q.2 Solve the queries with use of below tables: [60 Marks]
Doctor (DoctorId,DoctorName,qualification,DoctorAddress)
Patient (PatientId,PatientName,dob,PatientAddress,gender)
Treatment (TreatmentId,TreatmentDetail)
Charges (DoctorId, TreatmentId, Charges)
Appointment (AppointmentId, DoctorId, PatientId, TreatmentId, AppointmentDate, status)

1. Created table with all constraints.
2. Display the appointment information of Dr. Venus.
3. Display information of all doctors who are presently treating more than 1 patient.
4. Display details of all doctors who are charging less than $150.
5. Display details of all doctors whose charges are highest.
6. Display information of all patients who are being treated by Dr. Bahrudin.
7. Display information of all female patients who are getting treatment from Dr. Venus.
8. Display information of patients who have visited the same dentist.
9. Delete all those information whose appointment was cancelled.
10. Display all dentists who are presently treating at least 10 patients.
11. List patient’s details who had taken appointment of tomorrow.
12. Display minimum, maximum and average charges.


*/


-- Doctor (DoctorId,DoctorName,qualification,DoctorAddress)
create table Doctor (
	doctorID int not null primary key auto_increment,
    name varchar(255) not null,
    qualification varchar(255),
    doctorAddress varchar(255)
);


insert into Doctor(name, qualification, doctorAddress)
values ('Bahrudin', 'Anesthesiology', 'Montreal'),
( 'Venus', 'Psychiatry', 'Montreal'),
( 'Ana', 'Dentist', 'Montreal'),
( 'Afonso', 'Dermatology', 'Montreal'),
( 'Paloma', 'Neurology', 'Toronto');



-- Patient (PatientId,PatientName,dob,PatientAddress,gender)
create table Patient (
	patientID int not null primary key auto_increment,
    name varchar(255) not null,
    DOB date,
    patientAddress varchar(255),
    gender varchar(255)

);

insert into Patient(name, DOB, patientAddress, gender)
values ('Maria','2000-05-14',  'Montreal', 'Feminine'),
( 'Mariana', '2002-06-12',  'Montreal', 'Feminine'),
( 'Mora', '1985-05-29',  'Montreal', 'Other'),
( 'Matheus','1994-07-10',  'Montreal', 'Masculine'),
( 'Marco', '1995-09-14',  'Montreal', 'Masculine');

-- Treatment (TreatmentId,TreatmentDetail)
create table Treatment (
	treatmentID int not null primary key auto_increment,
    treatmentDetail varchar (255)
);

insert into Treatment (treatmentDetail)
values ('Treatment A'),
('Treatment B'),
('Treatment C');

-- Charges (DoctorId, TreatmentId, Charges)
create table Charges (
	chargesID int not null primary key auto_increment,
    charges float not null,
    doctorID int references Doctor(doctorID),
    treatmentID int references Treatment(treatmentID)
);
 insert into Charges (charges, doctorID, treatmentID)  
 values( 150, 1, 1), ( 250, 2, 2), ( 50, 3, 3), ( 100, 4, 1), ( 320, 5, 2), ( 400, 1, 3), ( 250, 2, 1), ( 70, 3, 2);


-- Appointment (AppointmentId, DoctorId, PatientId, TreatmentId, AppointmentDate, status)
create table Appointment (
	appointmentID int not null primary key auto_increment,
    doctorID int references Doctor(doctorID),
    patientID int references Patient(patientID),
    treatmentID int references Treatment(treatmentID),
    appointmentDate date not null,
    status varchar(150)
);
			--				5			5		3			    
insert into Appointment (doctorID, patientID, treatmentID, appointmentDate, status)
values (1, 1, 3, '2023-01-15', 'pending'), (2, 1, 2, '2022-01-15', 'completed'), (3, 2, 1, '2022-01-15', 'completed'),
(4, 3, 1, '2022-01-15', 'completed'), (5, 1, 3, '2022-01-15', 'canceled'), (2, 1, 1, '2022-01-15', 'canceled'),
(1, 2, 1, '2022-01-15', 'completed'), (3, 1, 1, '2022-01-15', 'completed'), (1, 1, 3, '2022-06-29', 'pending');


select * from Doctor;

-- 2. Display the appointment information of Dr. Venus.
select * from  Appointment where doctorId = (select doctorId from Doctor where name = "Venus");
select
	Appointment.*, 
    Doctor.name 
from Appointment 
inner join Doctor 
	ON Appointment.doctorID = Doctor.doctorID 
where 
	Doctor.name = "Venus";

-- 3. Display information of all doctors who are presently treating more than 1 patient.
select * from Doctor where doctorId in (select doctorId from Appointment group by doctorID having count(*) > 1);
select
	Doctor.* 
from Doctor
inner join Appointment
	ON Doctor.doctorId = Appointment.doctorId
group by doctorId
having count(Appointment.patientID) > 1;

-- 4. Display details of all doctors who are charging less than $150.
select * from Doctor where doctorId in (select doctorId from Charges where charges < 150);
select 
	Doctor.* 
from Doctor
inner join Charges
	ON Doctor.doctorId = Charges.doctorId
where
	Charges.charges < 150
group by Doctor.doctorId;

-- 5. Display details of all doctors whose charges are highest. TOP 1
select * from Doctor where doctorId = (select doctorId from Charges where charges = (select max(charges) from charges));

select 
	d.*,
    c.*
from Doctor as d
inner join Charges as c
	on d.doctorId = c.doctorId
order by c.charges desc
limit 1;

-- 6. Display information of all patients who are being treated by Dr. Bahrudin.
select * from Patient where patientID in (select patientID from Appointment where doctorID = (select doctorId from Doctor where name = "Bahrudin"));

select distinct(patient.name), patient.*, appointment.patientID, doctor.doctorID, doctor.name
from patient
inner join appointment
on patient.patientID = appointment.patientID
inner join doctor
on appointment.doctorID = doctor.doctorID
where doctor.name = "Bahrudin";

-- 7. Display information of all female patients who are getting treatment from Dr. Venus.
select * from Patient where patientID in (select patientID from Appointment where doctorID = (select doctorId from Doctor where name = "Venus")) AND gender = "Feminine";

select distinct(patient.name), patient.*, appointment.patientID, doctor.doctorID, doctor.name
from patient
inner join appointment
on patient.patientID = appointment.patientID
inner join doctor
on appointment.doctorID = doctor.doctorID
where doctor.name = "Venus" and patient.gender = "Feminine";


-- 8. Display information of patients who have visited the same dentist.
select * from Patient where patientID in (select patientID from Appointment where doctorID = (select doctorId from Doctor where qualification = "Dentist") group by doctorId);

select distinct(patient.name), patient.*, appointment.patientID, doctor.doctorID, doctor.name
from patient
inner join appointment
on patient.patientID = appointment.patientID
inner join doctor
on appointment.doctorID = doctor.doctorID
where doctor.qualification = "Dentist";

-- 9. Delete all those information whose appointment was cancelled.
-- delete * from Appointment where status = "canceled";     #I didn't want to delete it
select * from Appointment where status = "canceled";

-- 10. Display all dentists who are presently treating at least 1 patient.
select * from Appointment where doctorId in (select doctorId from Doctor where qualification = 'Dentist') having count(*) >=1;

select doctor.doctorID, doctor.name
from patient
inner join appointment
on patient.patientID = appointment.patientID
inner join doctor
on appointment.doctorID = doctor.doctorID
where doctor.qualification = "Dentist"
having count(*) >=1;

-- 11. List patient’s details who had taken appointment of tomorrow.
select name from Patient where patientID in (select patientID from Appointment where appointmentDate = '2022-06-29');

-- 12. Display minimum, maximum and average charges.
select min(charges), max(charges), avg(charges) from Charges;
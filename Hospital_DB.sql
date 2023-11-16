/*HOSPITAL MANAGEMENT SYSTEM DATABASE*/
/* Create Database*/
DROP SCHEMA Hospital_DB;
CREATE SCHEMA Hospital_DB;
USE Hospital_DB;


/* CREATE TABLES */
CREATE TABLE Patient
(
    Pat_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Pat_Name VARCHAR(50) NOT NULL,
    Pat_Phone INTEGER NOT NULL,
    Pat_DOB DATE NOT NULL,
    Pat_Gender VARCHAR(50)
);
ALTER TABLE Patient AUTO_INCREMENT = 101;

CREATE TABLE Payment
(
    Pay_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Pay_Method VARCHAR(50) NOT NULL,
    Pay_Date DATE NOT NULL,
    Pay_Amount FLOAT NOT NULL,
    Pat_ID INTEGER,
    FOREIGN KEY (Pat_ID) REFERENCES Patient(Pat_ID)
);
ALTER TABLE Payment AUTO_INCREMENT = 2001;

CREATE TABLE Department
(
    Dep_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Dep_Name VARCHAR(50) NOT NULL,
    Dep_Phone INTEGER NOT NULL
);
ALTER TABLE Department AUTO_INCREMENT = 30001;

CREATE TABLE `Schedule`
(
    Sch_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Sch_Day VARCHAR(50) NOT NULL,
    Sch_From TIME NOT NULL,
    Sch_To TIME NOT NULL
);
ALTER TABLE `Schedule` AUTO_INCREMENT = 400001;

CREATE TABLE Doctor
(
    Doc_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Doc_Name VARCHAR(50) NOT NULL,
    Doc_Phone INTEGER NOT NULL,
    Doc_Gender VARCHAR(50) NOT NULL,
    Dep_ID INTEGER,
    FOREIGN KEY (DEP_ID) REFERENCES Department(Dep_ID),
    Sch_ID INTEGER,
    FOREIGN KEY (Sch_ID) REFERENCES Schedule(Sch_ID)
);
ALTER TABLE Doctor AUTO_INCREMENT = 5000001;

CREATE TABLE Appointment
(
    App_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    App_Room VARCHAR(50) NOT NULL,
    App_Date DATE NOT NULL,
    App_Time TIME NOT NULL,
    App_Reason VARCHAR(50) NOT NULL,
    Pat_ID INTEGER,
    FOREIGN KEY (Pat_ID) REFERENCES Patient(Pat_ID),
    Doc_ID INTEGER,
    FOREIGN KEY (Doc_ID) REFERENCES Doctor(Doc_ID)
);
ALTER TABLE Appointment AUTO_INCREMENT = 60000001;

/* INSERT DATA*/
INSERT INTO Patient (Pat_Name, Pat_Phone, Pat_DOB, Pat_Gender) VALUES
('Rashed','0505260567','2004-07-23','M'),
('Ahmed','0556391715','1991-03-26','M'),
('Fatima','0502900282','2003-01-06','F'),
('Alia','0566425206','1992-02-06','F'),
('Khaled','0555774526','1998-05-12','M'),
('Mouza','0543261525','2001-04-05','F');
SELECT * FROM Patient;

INSERT INTO Payment (Pay_Method, Pay_Date, Pay_Amount, Pat_ID) VALUES
('Card','2022-10-05',950,104),
('Card','2022-10-06',300,102),
('Cash','2022-10-11',1200,105),
('Card','2022-10-15',150,106),
('Cash','2022-10-18',2050,101),
('Cash','2022-10-19',1850,103);
SELECT * FROM Payment;

INSERT INTO Department (Dep_Name, Dep_Phone) VALUES 
('ENT', '0523673440'),
('Dental', '0506148078'),
('Skin', '0504199557'),
('Orthopaedics', '0521453302'),
('Surgery', '0505662670'),
('Eye', '0501039246');
SELECT * FROM Department;

INSERT INTO Schedule (Sch_Day, Sch_From, Sch_To) VALUES
('Wednesday','8:00','18:30'),
('Monday','7:00','18:00'),
('Tuesday','9:00','19:30'),
('Friday','7:00','13:00'),
('Thursday','8:00','17:30'),
('Monday','7:00','18:30');
SELECT * FROM Schedule;

INSERT INTO Doctor (Doc_Name, Doc_Phone, Doc_Gender, Dep_ID, Sch_ID) VALUES
('Asma Alameri',0509461126,'F',30005,400006),
('Hamad Alnuaimi',0507607984,'M',30006,400004),
('Amna Almheiri',0502083610,'F',30001,400002),
('Wadha Almazrouei',0505811192,'F',30003,400001),
('Saif Alneyadi',0504958402,'M',30002,400005),
('Abrar Alshamsi',0502327860,'F',30004,400003);
SELECT * FROM Doctor;

INSERT INTO Appointment (App_Room, App_Date, App_Time, App_Reason, Pat_ID, Doc_ID) VALUES
('A213','2022-10-04','12:00','Acne',103,5000004),
('A130','2022-10-05','10:40','Dry Eye',101,5000002),
('C600','2022-10-10','8:30','Ear Infection',106,5000003),
('B411','2022-10-14','9:15','Nose surgery',104,5000001),
('C501','2022-10-17','11:20','Osteoporosis',105,5000006),
('B321','2022-10-18','10:00','Tooth Decay',102,5000005);
SELECT * FROM Appointment;

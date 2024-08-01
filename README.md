# Database Design for AZ Hopital

## Table of content
- [Project overview](#project-overview)
- [Client requirement](#client's-requirement)
- [Tools](#tools)
- [Processes](#processes)
- [DB Testing](#db-testing)



## Project overview
### Objectives:
This project seeks to develop a hospital database management system for to improve patient health care delivery system, streamlining operations, and managing resources more efficiently.

### Key Features: 
The database is required for storing information on patients, doctors, medical records, appointments, and departments in within the organization.

## Client's Requirement
### Store patients’ data:
 When a patient wants to register to the GP in the hospital, they need to provide their full name, address, date of birth and insurance. Also, they must create the username and password to allow them to sign into the patient portal. Optionally, they can also provide an email address and telephone number. 
### Store appointment details:
The patients will then book an appointment through patient’s portal. System checks doctor’s availability. Appointment details are stored, including date, time, department, status (pending, cancelled, or completed) and doctor. 
Check appointment Details and Medical Records:
When the patient arrives for the appointment, the doctors should check and review patient's medical record including past appointments, diagnoses, medicines, allergies. 
### Update Medical Records:
Doctor updates medical record with new diagnoses, and medicines. When a patient finishes his appointment and has seen the doctor, their status must be changed to completed and they can write a review/feedback for the doctor.
### Generate Veiw of patient records:
The database is required to generate veiw for a specific patient for data such as patient's name, medical history, appointment, allergies, diagnosis, medicines.

## Tool
- Postgresql
  
## Processes
### Database Schema
- Doctors: hold records about doctors as name, speciality, department, availability status
- Appointment: 
- Medical_record
- Department
- Patient: stores information about patients

### Table Definitions
- Patient table:

```sql
CREATE TABLE patient(
patient_id varchar(15) NOT NULL PRIMARY KEY,
Full_name varchar (100) NOT NULL UNIQUE,
username varchar(20) NOT NULL,
password varchar(15) NOT NULL,
email varchar (60) UNIQUE,
address varchar(225) NOT NULL,
dob date,
insurance varchar(25) NOT NULL UNIQUE,
phone varchar(25),
date_left date
)
````

- Appointment Table:
	
```sql

CREATE TABLE appointment(
appointment_id varchar(15) PRIMARY KEY NOT NULL,
patient_id varchar(15)	NOT NULL,
appointment_date date NOT NULL,
appointment_time time NOT NULL,
department_id varchar NOT NULL,
appointment_status varchar NOT NULL,
doctor_id varchar NOT NULL,
CHECK (appointment_status IN ('pending','completed','cancelled')),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
FOREIGN KEY (department_id) REFERENCES departments(department_id),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
)
```

- Medical Records Table:
  
``` sql
CREATE TABLE medical_records(
record_id varchar PRIMARY KEY NOT NULL,
doctor_id varchar NOT NULL,
patient_id varchar NOT NULL,
diagnosis varchar NOT NULL,
medicines varchar NOT NULL,
department_id varchar,
prescription_date date NOT NULL,
allergies varchar),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
FOREIGN KEY (department_id) REFERENCES departments(department_id)
)
```


- Doctors Table:
``` sql
CREATE TABLE doctors(
doctor_id varchar NOT NULL PRIMARY KEY,
full_name varchar NOT NULL,
status varchar NOT NULL,
department_id VARCHAR NOT NULL,
speciality varchar NOT NULL,
FOREIGN KEY (department_id) REFERENCES departments(department_id),
CHECK (status IN('Not available','Available'))
)
```


- Image:


![doctors_table](https://github.com/user-attachments/assets/44bb5e92-b110-480e-bf4a-94759efa19b2)


- Department Table:
```sql
CREATE TABLE departments(
department_id varchar NOT NULL PRIMARY KEY,
department_name varchar NOT NULL UNIQUE)
```


- Image:

  
![departments_table](https://github.com/user-attachments/assets/d417017a-71b3-4e2e-8d17-63908ea207f2)

## ERD:
![ERD](https://github.com/user-attachments/assets/f402a1c7-bb26-4b8d-8c1b-11cbc643bc95)


## Normalization
Database schema is normalized up to the Third Normal Form (3NF)
1. First Normal Form (1NF): Each table has a primary key, and each column contains atomic values without repeating groups
2. Second Normal Form (2NF): All non-key attributes are fully functional dependent on the primary key.
3. Third Normal Form (3NF): Eliminates transitive dependencies where non-key attributes are dependent on other non-key attributes

## Testing and Result
Populating table with sample data
- Patient:
```sql
INSERT INTO patient
VALUES
	('HS1001','Cole Bath', 'thecole', 'ekkkk123', 'colebath@outlook.com',
	'LA','02/12/1994','NIS/123/123/','07083890932', NULL),
	   ('HS1002','Michael King', 'Michael', 'mikemike', 'tmikeking@gmail.com',
	'NYC','10/12/1980',	'NIS/235/1222/','08126875645', NULL),
	  ('HS1003','Peter Pan', 'Peter Pan', 'panpete', 'thepeters@gmail.com',
	'Kogi', '10/11/1983','NIS/453/1222/','08023232328', '03/04/2024'),
	('HS1004','James Bond', 'BondJ14', 'bondss', 'james123@yahoo.com',
	'Ikere','12/02/1991','NIS/723/1222/','09123234528', '02/15/2024'),
	('HS1005','Temitope Rachael', 'tems', 'tems1', 'tems53@gmail.com',
	'Tink','10/10/19978','NIS/184/1292/','09023200328', NULL),
	('HS1006','Salam Ibrahim', 'salami', 'ibro333', 'ibrosalam@gmail.com',
	'Ikere','07/12/1981','NIS/901/1222/','08123232987', NULL),
 	('HS1007','Gary Bayo', 'Bayog', 'foeodls;', 'garybayo@outlook.com',
	'LA','02/12/1994','NIS/123/1237','07074222707', NULL),
	('HS1008','Temi Michael', 'temmike', 'temsmike1', 'tmiketemi12@gmail.com',
	'Temimike','12/10/19978','NIS/184/1271/','09066200397', NULL),
	('HS1009','Salam Abeeb', 'Abeeblai', 'abeeb333', 'abeebsalam@hotmail.com',
	'Benin city','11/10/1981','NIS/901/1022/','08123232080', NULL),
 	('HS1010','Muideen Bayo', 'Muideen', 'bayoo123', 'muideenbayo@outlook.com',
  'Ewekoro, Ogun', ‘02/12/1983', 'NIS/123/1037', '07074272700', NULL);
```


- Image:


![patient table](https://github.com/user-attachments/assets/01075edf-3a55-4fed-b213-aeaf6947f864)

- Department:
```sql
INSERT INTO departments
VALUES ('HS/PD','Pediatric Department'),
		('HS/OD','Orthopedic Department'),
		('HS/CD','Cardiology Department'),
		('HS/GD', 'Gastroenterology Department'),
		('HS/ON','Oncology Department'),
		('HS/ND','Neurology Department'),
		('HS/ED','Emergency Department');
```



- Image:

  
![departments_table](https://github.com/user-attachments/assets/f4890082-5006-40a6-86d5-4eeb380568d1)


- Doctors:
```sql
INSERT INTO doctors
VALUES ('DOC001','Ben Carson','Available','HS/PD','Pediatrician'),
	('DOC002','Taylor Pills','Available','HS/OD','Orthopedic surgeon'),
	('DOC003','Mule May', 'Available','HS/GD','Gastroenterologist'),
	('DOC004','Mike Bale', 'Available','HS/ND','Neurologist'),
	('DOC005','Makinde Oladele','Available','HS/CD','Cardiologist'),
	('DOC006','Kunle Akinrele','Available','HS/GD','Gastroenterologist'),
	('DOC007','Deborah Bolade','Not available','HS/ED','Emergencies'),
	('DOC008','Adeola Adeleye','Available','HS/ND','Neurologist'),
	('DOC009','Olowe James','Available','HS/ON','Oncologist'),
	('DOC010','Malomo Lola','Available','HS/GD','Gastroenterologist'),
	('DOC011','Emmanuella Philip','Available', 'HS/GD', 'Gastroenterologist'),
	('DOC012','Gaius Marcus','Available','HS/ON','Oncologist'),
	('DOC013','Mark Anthony','Available','HS/ON','Oncologist');
```


- Image:

  
![doctors_table](https://github.com/user-attachments/assets/8a42cba1-2bd7-4b8f-87cb-ce69a3319279)


- Appointments:
```sql
INSERT INTO appointment
VALUES('APP1001','HS1001','10-12-2024','12:30:00', 'HS/PD','pending','DOC001'),
('APP1003','HS1004','07-01_2024','10:00:00', 'HS/GD', 'pending', 'DOC003'),
('APP1004','HS1005','08-10-2024', '11:00:00', 'HS/GD', 'pending','DOC006'),
('APP1005','HS1006','08-10-2024','9:00:00','HS/GD','pending','DOC010'),
('APP1006','HS1007','07-25-2024','8:00:00','HS/ON','pending','DOC012'),
('APP1007','HS1002','10-30-2024','9:30:00','HS/ND','pending','DOC005'),
('APP1008','HS1008','08-20-2024','10:30:00','HS/ON','pending','DOC013'),
('APP1009','HS1009','07-20-2024','11:20:00','HS/ON','pending','DOC009'),
('APP1010','HS1010','08-16-2024','7:30:00','HS/GD','pending','DOC003');
```


- Image:


  
![appointment table](https://github.com/user-attachments/assets/1e3ff690-38b8-4b89-a237-c0f8a7566588)


- Medical Records:
```sql
INSERT INTO medical_records VALUES 
('REC0004','DOC003','HS1004','Crohn''s disease', 'Mesalamine','HS/GD','01-02-2024','Sulfasalazine'),
('REC0005','DOC012','HS1007','Cancer','Paclitaxel','HS/ON','02-03-2024', 'Chemotherapy drugs'),
('REC006','DOC010','HS1006','Ulcerative colitis','Omeprazole','HS/GD', '01-04-2024','Sulfa drugs')
('REC0007','DOC003','HS1010','Crohn''s disease', 'Mesalamine','HS/GD', '01-03-2024','Sulfasalazine'),
('REC0008','DOC013','HS1009','Cancer','Paclitaxel','HS/ON','02-03-2024','Chemotherapy drugs'),
('REC0009','DOC003','HS100','Ulcerative colitis','Omeprazole','HS/GD','01-01-2024','Sulfa drugs');
```


- Image:

  
![medical_records](https://github.com/user-attachments/assets/28938d52-5a73-4408-ab9c-909524d74e44)


## DB Testing
### Stored Procedures and Functions
##### - Search the database for matching medicine names
```sql
CREATE OR REPLACE FUNCTION med_search (med varchar)
RETURNS TABLE(record_id varchar,
doctor_id varchar,
patient_id varchar,
diagnosis varchar,
medicines varchar,
department_id varchar,
prescription_date date,
allergies varchar)
AS 
$$
BEGIN
	RETURN QUERY
	SELECT * FROM medical_records md
	WHERE md.medicines LIKE '%'||med|| '%'
	ORDER BY prescription_date DESC;
END;
$$
LANGUAGE plpgsql;
```


- Image:

  
![med_search](https://github.com/user-attachments/assets/e011e75c-40af-40db-8f73-814ae86999e6)


#### - A full list of diagnosis and allergies for a specific patient who has an appointment today
```sql
CREATE OR REPLACE FUNCTION full_list (patient varchar)
RETURNS TABLE
(patient_id VARCHAR, 
 full_name VARCHAR, 
 diagnosis VARCHAR, 
 allergies VARCHAR,
 appointment_date DATE)
AS
$$
BEGIN 
	RETURN QUERY
	SELECT pt.patient_id, pt.full_name, md.diagnosis, md.allergies, ap.appointment_date
	FROM patient pt
	INNER JOIN appointment ap ON pt.patient_id = ap.patient_id
	INNER JOIN medical_records md ON pt.patient_id = md.patient_id
	WHERE pt.patient_id = patient
	AND ap.appointment_date = CURRENT_DATE;
END;
$$ LANGUAGE PLPGSQL;
```


- Image:


  
![View](https://github.com/user-attachments/assets/05111d4d-30e7-4595-b5c2-e9a19c4124fb)

#### - Delete appointment with when  completed
```sql
CREATE OR REPLACE PROCEDURE del_completed ()
AS
$$
	BEGIN
	DELETE  FROM appointment
	WHERE appointment_status = 'completed';
	END;
$$
LANGUAGE PLPGSQL;
```
- Image:
![View](https://github.com/user-attachments/assets/de22d3ca-32f6-4ca5-a113-4bff075a6ae7)


#### - UPDATE DETAILS OF AN EXISTING DOCTOR
``` sql
CREATE OR REPLACE PROCEDURE DOC_UPDATE (ndoctor_id varchar, Nfull_name varchar, 
NdepartmentID varchar, Nspeciality varchar)
AS
$$
	BEGIN
	UPDATE doctors
	SET full_name = nfull_name,
	department_id = ndepartmentID,
	speciality = nspeciality
	WHERE doctor_id = ndoctor_id;
	END;
$$
LANGUAGE PLPGSQL;

call doc_update('DOC001', 'Akinkunmi Oyeyemi','HS/PD', 'Physiotherapist' )
```
- Image:
  
![doc_update](https://github.com/user-attachments/assets/92869736-b43f-48a0-a747-998c7ca7e05b)






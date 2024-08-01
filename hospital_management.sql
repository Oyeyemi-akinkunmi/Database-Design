	-- CREATING PATIENTS TABLE
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


SELECT * FROM patient

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
 	('HS1010','Muideen Bayo', 'Muideen', 'bayoo123;', 'muideenbayo@outlook.com',
	'Ewekoro, Ogun','02/12/1983','NIS/123/1037','07074272700', NULL);
	
	SELECT * FROM PATIENT
	
		-- CREATING APPOINTMENT TABLE
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
		-- POPULATING APPOINTMENT TABLE
INSERT INTO appointment
VALUES('APP1001','HS1001','10-12-2024','12:30:00', 'HS/PD','pending','DOC001'),
		('APP1003','HS1004','07-01-2024','10:00:00','HS/GD','pending','DOC003'),
		('APP1004','HS1005','08-10-2024','11:00:00','HS/GD','pending','DOC006'),
		('APP1005','HS1006','08-10-2024','9:00:00','HS/GD','pending','DOC010'),
		('APP1006','HS1007','07-25-2024','8:00:00','HS/ON','pending','DOC012'),
		('APP1007','HS1002','10-30-2024','9:30:00','HS/ND','pending','DOC005'),
		('APP1008','HS1008','08-20-2024','10:30:00','HS/ON','pending','DOC013'),
		('APP1009','HS1009','07-20-2024','11:20:00','HS/ON','pending','DOC009'),
		('APP1010','HS1010','08-16-2024','7:30:00','HS/GD','pending','DOC003')
		
		
SELECT * FROM DOCTORS


SELECT * FROM appointment




		-- ADDING A CHECK CONSTRAINT ON APPOINTMENT STATUS
ALTER TABLE appointment
ADD CHECK(appointment_status = 'pending' OR appointment_status ='cancelled'
		 OR appointment_status = 'completed')


		-- CREATING MEDICAL RECORDS TABLE
CREATE TABLE medical_records(
record_id varchar PRIMARY KEY NOT NULL,
doctor_id varchar NOT NULL,
patient_id varchar NOT NULL,
diagnosis varchar NOT NULL,
medicines varchar NOT NULL,
department_id varchar,
prescription_date date NOT NULL,
allergies varchar)

	ALTER TABLE medical_records
	add FOREIGN KEY (department_id) REFERENCES departments(department_id)
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
FOREIGN KEY (department_id) REFERENCES departments(department_id)
	FOREIGN KEY (patient_id) REFERENCES patient(patient_id),

	-- POPULATING MEDICAL RECORDS TABLE
INSERT INTO medical_records
VALUES ('REC0004','DOC003','HS1004','Crohn''s disease', 'Mesalamine','HS/GD','01-02-2024','Sulfasalazine'),
		('REC0005','DOC012','HS1007','Cancer','Paclitaxel','HS/ON','02-03-2024','Chemotherapy drugs'),
		('REC006','DOC010','HS1006','Ulcerative colitis','Omeprazole','HS/GD','01-04-2024','Sulfa drugs')
		INSERT INTO medical_records
VALUES
		('REC0007','DOC003','HS1010','Crohn''s disease', 'Mesalamine','HS/GD','01-03-2024','Sulfasalazine'),
		('REC0008','DOC013','HS1009','Cancer','Paclitaxel','HS/ON','02-03-2024','Chemotherapy drugs'),
		('REC0009','DOC003','HS100','Ulcerative colitis','Omeprazole','HS/GD','01-01-2024','Sulfa drugs')
		
	
SELECT * FROM MEDICAL_RECORDS


		-- DOCTORS' TABLE
CREATE TABLE doctors(
doctor_id varchar NOT NULL PRIMARY KEY,
full_name varchar NOT NULL,
status varchar NOT NULL,
department_id VARCHAR NOT NULL,
speciality varchar NOT NULL,
FOREIGN KEY (department_id) REFERENCES departments(department_id),
CHECK (status IN('Not available','Available'))
)

SELECT * FROM doctors

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
		('DOC011','Emmanuella Philip','Available','HS/GD','Gastroenterologist'),
		('DOC012','Gaius Marcus','Available','HS/ON','Oncologist'),
		('DOC013','Mark Anthony','Available','HS/ON','Oncologist')

 
		/* CREATING A RELATIONSHIP BETWEEN 
		DOCTORS TABLE AND DEPARTMENT TABLE */
ALTER TABLE doctors
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id)


		-- DEPARTMENTS
CREATE TABLE departments(
department_id varchar NOT NULL PRIMARY KEY,
department_name varchar NOT NULL UNIQUE)

FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id))
DROP TABLE departments

INSERT INTO departments
VALUES ('HS/PD','Pediatric Department'),
		('HS/OD','Orthopedic Department'),
		('HS/CD','Cardiology Department'),
		('HS/GD', 'Gastroenterology Department'),
		('HS/ON','Oncology Department'),
		('HS/ND','Neurology Department'),
		('HS/ED','Emergency Department');
		
SELECT * FROM departments;	
	

		-- TASK 2 APPOINTMENT DATE IS NOT IN THE PAST
ALTER TABLE appointment
ADD CHECK (appointment_date >= 	CURRENT_DATE);

		-- TASK 3
	-- LIST ALL PATIENTS OLDER THAN 40 AND HAVE CANCER
SELECT p.patient_id, p.full_name AS NAME, diagnosis
FROM patient p
JOIN medical_records m ON p.patient_id = m.record_id
WHERE DATEDIFF(p.dob, CURRENT_DATE) 
AND m.diagnosis = 'Cancer';
AND 

SELECT (DOB, CURRENT_DATE)
FROM patient
WHERE patient_id='HS1001'


		-- TASK 4 STORED PROCEDURE
		-- 4A SEARCH THE DATE FOR MATCHING STRING
		
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



SELECT * FROM med_search('pra')
	
		-- 
		
		/* 4B RETURN A FULL LIST OF DIAGNOSIS AND ALLERGIES FOR A SPECIFIEC PATIENT
		WHO HAS AN APPOINTMETN TODAY */

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
	SELECT pt.patient_id, pt.full_name, md.diagnosis, md.allergies,ap.appointment_date
	FROM patient pt
	INNER JOIN appointment ap ON pt.patient_id = ap.patient_id
	INNER JOIN medical_records md ON pt.patient_id = md.patient_id
	WHERE pt.patient_id = patient
	AND ap.appointment_date = CURRENT_DATE;
END;
$$ LANGUAGE PLPGSQL;
	

SELECT * FROM full_list ('HS1005')


		-- 4C UPDATE DETAILS OF AN EXISTING DOCTOR
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

SELECT * FROM doctors
ORDER BY doctor_id;

		-- 4D DELETE APPOINTMENT WITH STATUS = COMPLETED
CREATE OR REPLACE PROCEDURE del_completed ()
AS
$$
	BEGIN
	DELETE  FROM appointment
	WHERE appointment_status = 'completed';
	END;
$$
LANGUAGE PLPGSQL;

INSERT INTO appointment
VALUES('APP1016','HS1010','08-16-2024','7:30:00','HS/GD','completed','DOC010');

SELECT * FROM appointment;

call del_completed();


		--5 VIEW
CREATE VIEW app_view AS
SELECT  dc.doctor_id, dc.full_name, dp.department_name, dc.speciality,
ap.appointment_date,ap.appointment_time
FROM doctors dc INNER JOIN departments dp ON dc.department_id = dp.department_id
INNER JOIN appointment ap ON dc.doctor_id = ap.doctor_id;

SELECT * FROM app_view;


		-- 6 TRIGGER TO CHANGE TO AVAILABLE WHEN CANCELLED

CREATE OR REPLACE TRIGGER appoint_change
AFTER UPDATE ON appointment
FOR EACH ROW
EXECUTE PROCEDURE app_change_fnc(); 

CREATE OR REPLACE FUNCTION app_change_fnc()
RETURNS TRIGGER
AS 
$$
	BEGIN
	UPDATE doctors
	SET status = 'available'
	WHERE doctor_id = (SELECT doctor_id FROM appointment
	WHERE appointment_status = 'cancelled');
	END;
	$$
LANGUAGE PLPGSQL;

UPDATE appointment
SET appointment_status ='cancelled'
WHERE appointmeNt_id ='APP1016'

select * from appointment

		-- 7 COUNT NUMBER OF COMPLETED APPOINTMETNS WITH 
SELECT COUNT(*)
FROM appointment ap
INNER JOIN doctors dc ON ap.doctor_id = dc.doctor_id
WHERE ap.appointment_status ='completed'
AND
dc.speciality ='Gastroenterologist';


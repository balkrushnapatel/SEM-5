use HospitalManagement

CREATE TABLE HospitalMaster (
    HospitalID INT PRIMARY KEY IDENTITY(1,1),
    HospitalName NVARCHAR(150) NOT NULL,
    HospitalAddress NVARCHAR(250) NOT NULL,
    ContactNumber NVARCHAR(10) NULL,
    EmailAddress NVARCHAR(250) NULL,
    OwnerName NVARCHAR(250) NOT NULL,
    OpeningDate DATETIME NOT NULL,
    TotalStaffs INT NOT NULL,
    SundayOpen BIT NOT NULL
);

-- 1. Create Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName NVARCHAR(150) NOT NULL,
    Specialization NVARCHAR(100) NOT NULL,
    ContactNumber NVARCHAR(10) NULL,
    EmailAddress NVARCHAR(250) NULL,
    Qualification NVARCHAR(100) NULL,
    JoiningDate DATETIME NOT NULL,
    IsSurgeon BIT NOT NULL,
    HospitalID INT NOT NULL
);

ALTER TABLE Doctor
ADD CONSTRAINT FK_Doctor_Hospital
FOREIGN KEY (HospitalID)
REFERENCES HospitalMaster(HospitalID);


-- 2. Create Patient table with DoctorID as foreign key
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    PatientName NVARCHAR(150) NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    DateOfBirth DATETIME NOT NULL,
    ContactNumber NVARCHAR(10) NULL,
    EmailAddress NVARCHAR(250) NULL,
    Address NVARCHAR(250) NULL,
    AdmissionDate DATETIME NOT NULL,
    HospitalID INT NOT NULL,
    DoctorID INT NOT NULL,
    
    CONSTRAINT FK_Patient_Hospital FOREIGN KEY (HospitalID) REFERENCES HospitalMaster(HospitalID),
    CONSTRAINT FK_Patient_Doctor FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO HospitalMaster (
    HospitalName, HospitalAddress, ContactNumber, EmailAddress,
    OwnerName, OpeningDate, TotalStaffs, SundayOpen
)
VALUES (
    'LifeCare Hospital',
    'Ring Road, Surat',
    '9876543210',
    'lifecare@hospital.com',
    'Dr. Mahesh Patel',
    '2015-01-10',
    120,
    1
);


-- 3. Insert sample Doctors
INSERT INTO Doctor (
    DoctorName, Specialization, ContactNumber, EmailAddress, 
    Qualification, JoiningDate, IsSurgeon, HospitalID
)
VALUES 
('Dr. Kiran Desai', 'Cardiology', '9123456789', 'kiran.desai@hospital.com', 'MD Cardiology', '2020-04-10', 1, 1),
('Dr. Neha Patel', 'Pediatrics', NULL, NULL, 'MBBS', '2021-07-01', 0, 1);

SELECT DoctorID, DoctorName FROM Doctor;

-- 4. Insert sample Patients
INSERT INTO Patient (PatientName, Gender, DateOfBirth, ContactNumber, EmailAddress, Address, AdmissionDate, HospitalID, DoctorID)
VALUES 
('Rohit Sharma', 'Male', '1992-08-14', '9012345678', 'rohit.sharma@example.com', 'Mumbai, Maharashtra', '2025-06-15', 1, 3),
('Anjali Verma', 'Female', '1985-11-25', NULL, NULL, 'Pune, Maharashtra', '2025-06-17', 1, 4);

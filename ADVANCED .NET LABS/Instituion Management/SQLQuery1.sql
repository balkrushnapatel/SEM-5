use Institute_Management_System
-- Institute Management System: Final Schema (School + College)

-- 1. Institutions
CREATE TABLE Institutions (
    InstitutionId INT PRIMARY KEY IDENTITY(1,1),
    InstitutionName NVARCHAR(100) NOT NULL,
    InstitutionType NVARCHAR(20) NOT NULL,
    CONSTRAINT CK_InstitutionType CHECK (InstitutionType IN ('School', 'College'))
);

-- 2. Users (Admins, Students, Staff, Faculties)
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    InstitutionId INT FOREIGN KEY REFERENCES Institutions(InstitutionId),
    Username NVARCHAR(50) NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL,
    CONSTRAINT CK_UserRoles CHECK (Role IN ('Admin', 'Student', 'Staff', 'Faculty'))
);

-- 3. Staff / Faculties
CREATE TABLE Staff (
    StaffId INT PRIMARY KEY IDENTITY(1,1),
    InstitutionId INT FOREIGN KEY REFERENCES Institutions(InstitutionId),
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Role NVARCHAR(50),   -- 'Teacher', 'Faculty'
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    DOJ DATE,
    IsActive BIT DEFAULT 1
);

-- 4. Classes (School) & Semesters (College)
CREATE TABLE Classes (
    ClassId INT PRIMARY KEY IDENTITY(1,1),
    InstitutionId INT FOREIGN KEY REFERENCES Institutions(InstitutionId),
    ClassName NVARCHAR(50),
    Section NVARCHAR(10),
    Semester INT NULL  -- For colleges only
);

-- 5. Students
CREATE TABLE Students (
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    InstitutionId INT FOREIGN KEY REFERENCES Institutions(InstitutionId),
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Gender NVARCHAR(10),
    DOB DATE,
    ClassId INT,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    IsActive BIT DEFAULT 1,
    CONSTRAINT FK_Students_Classes FOREIGN KEY (ClassId) REFERENCES Classes(ClassId)
);

-- 6. Subjects
CREATE TABLE Subjects (
    SubjectId INT PRIMARY KEY IDENTITY(1,1),
    InstitutionId INT FOREIGN KEY REFERENCES Institutions(InstitutionId),
    SubjectName NVARCHAR(100),
    ClassId INT FOREIGN KEY REFERENCES Classes(ClassId)
);

-- 7. Marks
CREATE TABLE Marks (
    MarkId INT PRIMARY KEY IDENTITY(1,1),
    StudentId INT FOREIGN KEY REFERENCES Students(StudentId),
    SubjectId INT FOREIGN KEY REFERENCES Subjects(SubjectId),
    ExamType NVARCHAR(50),
    MarksObtained INT,
    MaxMarks INT
);

-- 8. Fees
CREATE TABLE Fee (
    FeeId INT PRIMARY KEY IDENTITY(1,1),
    StudentId INT FOREIGN KEY REFERENCES Students(StudentId),
    TotalAmount DECIMAL(10,2),
    PaidAmount DECIMAL(10,2),
    DueDate DATE,
    PaymentDate DATE,
    Status NVARCHAR(20)  -- 'Paid', 'Unpaid', 'Partial'
);

-- 9. Attendance
CREATE TABLE Attendance (
    AttendanceId INT PRIMARY KEY IDENTITY(1,1),
    StudentId INT FOREIGN KEY REFERENCES Students(StudentId),
    Date DATE,
    Status NVARCHAR(10)  -- 'Present', 'Absent'
);

-- 10. Leave Applications
CREATE TABLE LeaveApplications (
    LeaveId INT PRIMARY KEY IDENTITY(1,1),
    InstitutionId INT FOREIGN KEY REFERENCES Institutions(InstitutionId),
    ApplicantId INT,  -- ID of student or staff/faculty
    ApplicantRole NVARCHAR(10),  -- 'Student', 'Staff', 'Faculty'
    FromDate DATE,
    ToDate DATE,
    Reason NVARCHAR(255),
    Status NVARCHAR(20) DEFAULT 'Pending',
    CONSTRAINT CK_LeaveApplicantRole CHECK (ApplicantRole IN ('Student', 'Staff', 'Faculty'))
);

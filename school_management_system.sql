CREATE DATABASE school_management;

-- Database তৈরি করা
CREATE DATABASE school_management;
USE school_management;

-- 1. Students table
CREATE TABLE students (
    student_id      INT PRIMARY KEY AUTO_INCREMENT,
    roll_number     VARCHAR(15) UNIQUE NOT NULL,     -- 2025-001, 6A-015 ইত্যাদি
    full_name       VARCHAR(100) NOT NULL,
    gender          ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth   DATE,
    father_name     VARCHAR(100),
    mother_name     VARCHAR(100),
    address         VARCHAR(255),
    phone           VARCHAR(15),
    email           VARCHAR(100) UNIQUE,
    admission_date  DATE DEFAULT CURRENT_DATE,
    status          ENUM('Active', 'Left', 'Suspended') DEFAULT 'Active',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Teachers table
CREATE TABLE teachers (
    teacher_id      INT PRIMARY KEY AUTO_INCREMENT,
    teacher_code    VARCHAR(10) UNIQUE NOT NULL,    -- T001, TCH-045
    full_name       VARCHAR(100) NOT NULL,
    gender          ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth   DATE,
    phone           VARCHAR(15),
    email           VARCHAR(100) UNIQUE,
    joining_date    DATE,
    salary          DECIMAL(10,2),
    status          ENUM('Active', 'Resigned', 'On Leave') DEFAULT 'Active',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Classes / Sections
CREATE TABLE classes (
    class_id        INT PRIMARY KEY AUTO_INCREMENT,
    class_name      VARCHAR(50) NOT NULL,           -- Class 6, Class 9, Playgroup
    section         VARCHAR(10),                    -- A, B, Science, Commerce
    academic_year   VARCHAR(9) NOT NULL,            -- 2024-2025
    class_teacher_id INT,                           -- শ্রেণি শিক্ষক
    capacity        INT DEFAULT 60,
    FOREIGN KEY (class_teacher_id) REFERENCES teachers(teacher_id)
);

-- 4. Subjects
CREATE TABLE subjects (
    subject_id      INT PRIMARY KEY AUTO_INCREMENT,
    subject_code    VARCHAR(10) UNIQUE NOT NULL,    -- MATH101, ENG201
    subject_name    VARCHAR(100) NOT NULL,
    class_level     VARCHAR(50)                     -- Class 6-8, Class 9-10 ইত্যাদি (optional)
);

-- 5. Student – Class Enrollment (many-to-many)
CREATE TABLE student_enrollments (
    enrollment_id   INT PRIMARY KEY AUTO_INCREMENT,
    student_id      INT NOT NULL,
    class_id        INT NOT NULL,
    roll_in_class   VARCHAR(10),                    -- ক্লাসের মধ্যে রোল (optional)
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id)   REFERENCES classes(class_id),
    UNIQUE KEY (student_id, class_id)               -- একই ছাত্র একই বছরে একই ক্লাসে দুবার enroll হতে পারবে না
);

-- 6. Teacher – Subject – Class Assignment (optional but very useful)
CREATE TABLE teacher_assignments (
    assignment_id   INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id      INT NOT NULL,
    subject_id      INT NOT NULL,
    class_id        INT NOT NULL,
    assigned_date   DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (teacher_id)  REFERENCES teachers(teacher_id),
    FOREIGN KEY (subject_id)  REFERENCES subjects(subject_id),
    FOREIGN KEY (class_id)    REFERENCES classes(class_id),
    UNIQUE KEY (teacher_id, subject_id, class_id)
);






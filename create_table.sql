CREATE TABLE Students
(
    Roll int PRIMARY KEY,
    Name varchar(20),
    Gender varchar(20),
    Age int,
    GPA double(3,2),
    City varchar(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


/// Teacher Tables...-----=======------->>>>

CREATE TABLE Teachers
(
    ID int PRIMARY KEY,
    First_Name varchar(20),
    Last_Name varchar(20),
    Salary double(10,3),
    DepartMent varchar(20),
    Age int,
    Branch varchar(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
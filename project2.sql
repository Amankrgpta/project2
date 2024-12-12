CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    Publisher VARCHAR(255),
    Category VARCHAR(100),
    AvailabilityStatus BOOLEAN DEFAULT TRUE
);
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    MembershipDate DATE
);

CREATE TABLE BorrowingRecords (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    Fine DECIMAL(10, 2),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);
INSERT INTO Books (Title, Author, Publisher, Category) 
VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 'Fiction'),
('1984', 'George Orwell', 'Secker & Warburg', 'Dystopian'),
('Moby Dick', 'Herman Melville', 'Harper & Brothers', 'Adventure');


INSERT INTO Members (Name, Email, Phone, MembershipDate) 
VALUES 
('Alice Johnson', 'alice@example.com', '9876543210', '2024-01-01'),
('Bob Smith', 'bob@example.com', '9876543211', '2024-02-15'),
('Carol Davis', 'carol@example.com', '9876543212', '2024-03-10');

INSERT INTO BorrowingRecords (MemberID, BookID, BorrowDate, ReturnDate, Fine) 
VALUES 
(1, 1, '2024-06-01', '2024-06-10', 0.00),
(2, 2, '2024-06-05', '2024-06-15', 0.00),
(1, 3, '2024-07-01', NULL, 0.00);

INSERT INTO Admin (Name, Email, Password) 
VALUES 
('Admin User', 'admin@example.com', 'securepassword123');


SELECT * FROM Books WHERE AvailabilityStatus = TRUE;





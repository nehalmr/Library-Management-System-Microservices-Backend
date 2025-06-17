-- Seed data for testing
USE book_service_db;

INSERT INTO books (title, author, genre, isbn, year_published, available_copies, total_copies) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '978-0-7432-7356-5', 1925, 3, 5),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', '978-0-06-112008-4', 1960, 2, 3),
('1984', 'George Orwell', 'Dystopian Fiction', '978-0-452-28423-4', 1949, 4, 4),
('Pride and Prejudice', 'Jane Austen', 'Romance', '978-0-14-143951-8', 1813, 1, 2),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '978-0-316-76948-0', 1951, 2, 3);

USE member_service_db;

INSERT INTO members (name, email, phone, address, membership_status) VALUES
('John Doe', 'john.doe@email.com', '+1-555-0101', '123 Main St, City, State', 'ACTIVE'),
('Jane Smith', 'jane.smith@email.com', '+1-555-0102', '456 Oak Ave, City, State', 'ACTIVE'),
('Bob Johnson', 'bob.johnson@email.com', '+1-555-0103', '789 Pine Rd, City, State', 'ACTIVE'),
('Alice Brown', 'alice.brown@email.com', '+1-555-0104', '321 Elm St, City, State', 'INACTIVE'),
('Charlie Wilson', 'charlie.wilson@email.com', '+1-555-0105', '654 Maple Dr, City, State', 'ACTIVE');

USE notification_service_db;

INSERT INTO notifications (member_id, message, type, status, recipient_email, subject) VALUES
(1, 'Welcome to Library Management System! Your account has been created successfully.', 'WELCOME', 'SENT', 'john.doe@email.com', 'Welcome to Library Management System'),
(2, 'Your borrowed book "The Great Gatsby" is due in 2 days. Please return it on time.', 'DUE_REMINDER', 'SENT', 'jane.smith@email.com', 'Book Due Reminder'),
(3, 'Your book "1984" is overdue by 3 days. Please return it immediately.', 'OVERDUE_ALERT', 'PENDING', 'bob.johnson@email.com', 'Overdue Book Alert');

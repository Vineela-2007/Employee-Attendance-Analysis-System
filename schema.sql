CREATE DATABASE IF NOT EXISTS employee_attendance;
USE employee_attendance;

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_code VARCHAR(30) NOT NULL UNIQUE,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Leave', 'Holiday') NOT NULL,
    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE,
    CONSTRAINT uq_employee_attendance_date UNIQUE (employee_id, attendance_date)
);

-- Optional sample data: run once after creating the tables.
INSERT IGNORE INTO employees (employee_code, employee_name, department) VALUES
('EMP001', 'Aarav Sharma', 'Engineering'),
('EMP002', 'Diya Reddy', 'Human Resources'),
('EMP003', 'Kabir Patel', 'Finance'),
('EMP004', 'Meera Kumar', 'Engineering');

INSERT INTO attendance (employee_id, attendance_date, status)
SELECT employee_id, '2026-10-01', 'Present' FROM employees WHERE employee_code = 'EMP001'
ON DUPLICATE KEY UPDATE status = VALUES(status);
INSERT INTO attendance (employee_id, attendance_date, status)
SELECT employee_id, '2026-10-02', 'Absent' FROM employees WHERE employee_code = 'EMP001'
ON DUPLICATE KEY UPDATE status = VALUES(status);
INSERT INTO attendance (employee_id, attendance_date, status)
SELECT employee_id, '2026-10-01', 'Present' FROM employees WHERE employee_code = 'EMP002'
ON DUPLICATE KEY UPDATE status = VALUES(status);
INSERT INTO attendance (employee_id, attendance_date, status)
SELECT employee_id, '2026-10-02', 'Leave' FROM employees WHERE employee_code = 'EMP002'
ON DUPLICATE KEY UPDATE status = VALUES(status);
INSERT INTO attendance (employee_id, attendance_date, status)
SELECT employee_id, '2026-10-01', 'Holiday' FROM employees WHERE employee_code = 'EMP003'
ON DUPLICATE KEY UPDATE status = VALUES(status);

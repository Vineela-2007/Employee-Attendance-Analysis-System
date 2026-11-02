# Employee Attendance Analysis System

A beginner-friendly attendance management and analysis web application built with Python, Streamlit, MySQL, Pandas, NumPy, and Matplotlib.

## Features

- Add and view employee records.
- Record daily attendance: Present, Absent, Leave, or Holiday.
- Prevent duplicate entries for the same employee and date. Saving an existing employee/date updates that record.
- Employee-wise and monthly attendance summaries.
- Department summaries and absenteeism chart.
- Download attendance records and monthly summaries as CSV.
- MySQL-backed storage.

## Attendance rules

- **Present**: counts as a working-day record and as attended.
- **Absent**: counts as a working-day record and as not attended.
- **Leave**: counts as a working-day record and as not attended in the attendance percentage.
- **Holiday**: excluded from the attendance percentage denominator.
- Attendance percentage = `Present records / (Present + Absent + Leave records) * 100`.
- The application uses records that have been entered. It does not automatically create records for missing dates, weekends, or public holidays.

## Requirements

- Python 3.10 or newer
- MySQL Server
- A terminal (macOS Terminal or Windows PowerShell)

## Setup

### 1. Create the MySQL database

Start MySQL, then run the SQL file:

```bash
mysql -u root -p < schema.sql
```

Enter your MySQL password when prompted. Alternatively, open `schema.sql` in MySQL Workbench and execute it.

The script creates the database, tables, and a few optional sample records. If you do not want sample data, remove the sample `INSERT` statements before running it.

### 2. Create and activate a Python virtual environment

macOS/Linux:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Windows PowerShell:

```powershell
py -m venv .venv
.venv\\Scripts\\Activate.ps1
```

### 3. Install dependencies

```bash
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### 4. Configure the database connection

Set environment variables in the terminal before launching the app.

macOS/Linux:

```bash
export DB_HOST=localhost
export DB_PORT=3306
export DB_USER=root
export DB_PASSWORD='your_mysql_password'
export DB_NAME=employee_attendance
```

Windows PowerShell:

```powershell
$env:DB_HOST="localhost"
$env:DB_PORT="3306"
$env:DB_USER="root"
$env:DB_PASSWORD="your_mysql_password"
$env:DB_NAME="employee_attendance"
```

Replace `your_mysql_password` with your actual MySQL password. Do not upload passwords to GitHub.

### 5. Run the application

```bash
streamlit run app.py
```

Streamlit will show a local URL, usually `http://localhost:8501`. Open it in your browser.

## Project structure

```text
employee_attendance_analysis_system/
├── app.py
├── schema.sql
├── requirements.txt
├── README.md
├── .gitignore
├── .env.example
└── data/
    └── README.md
```

## Push the project to GitHub

1. Create a new empty repository on GitHub, for example `employee-attendance-analysis-system`.
2. Open Terminal in this project folder.
3. Run:

```bash
git init
git add .
git commit -m "Initial employee attendance analysis system"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/employee-attendance-analysis-system.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username. Do not commit your real password or `.streamlit/secrets.toml`.

## Troubleshooting

- **Access denied**: verify your MySQL username and password.
- **Unknown database**: run `schema.sql` first.
- **Can't connect to MySQL server**: ensure MySQL is running and the host/port are correct.
- **Module not found**: activate your virtual environment and run `pip install -r requirements.txt`.
- **Duplicate entry**: employee codes must be unique. Attendance records are unique by employee and date.

## Notes

This is a learning/demo project. Use fictional sample employee data for demonstrations. Before real workplace use, add authentication, authorization, backups, audit logging, and appropriate privacy protections.

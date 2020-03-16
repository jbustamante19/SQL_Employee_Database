-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/IGccxF
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Titles (
    emp_no INTEGER   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    birth_date VARCHAR   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date VARCHAR   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

CREATE TABLE Dept_employee (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_employee ADD CONSTRAINT fk_Dept_employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_employee ADD CONSTRAINT fk_Dept_employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

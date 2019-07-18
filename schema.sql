-- NAME
--    schema.sql
-- 
-- DESCRIPTION
--    Schema designed to hold the Pewlett Hackard employees data.
-- 
-- AUTHOR
--    Gilberto Ramirez (gramirez77@gmail.com)
--    v1.0: July 18, 2019
-- 
-- REMARKS
--    This is the ninth week homework for the UNC Data Analytics Boot Camp.

CREATE TABLE employees (
    emp_no     INT         PRIMARY KEY,
    birth_date DATE        NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name  VARCHAR(20) NOT NULL,
    gender     CHAR(1)     NOT NULL CHECK(gender='F' OR gender='M'),
    hire_date  DATE        NOT NULL
);

CREATE TABLE departments (
    dept_no    CHAR(4)     PRIMARY KEY,
    dept_name  VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE dept_emp (
    emp_no     INT         NOT NULL,
    dept_no    CHAR(4)     NOT NULL,
    from_date  DATE        NOT NULL,
    to_date    DATE        NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no    CHAR(4)     NOT NULL,
    emp_no     INT         NOT NULL,
    from_date  DATE        NOT NULL,
    to_date    DATE        NOT NULL,		
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no     INT         NOT NULL,
    salary     INT         NOT NULL,
    from_date  DATE        NOT NULL,
    to_date    DATE        NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    emp_no     INT         NOT NULL,
    title      VARCHAR(20) NOT NULL,
    from_date  DATE        NOT NULL,
    to_date    DATE        NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE departments (
    dept_no varchar(5) NOT NULL,
    dept_name varchar(50),
    CONSTRAINT PK_departments PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
    title_id varchar(5) NOT NULL,
    title varchar(30),
    CONSTRAINT PK_titles PRIMARY KEY (title_id)
);

CREATE TABLE salaries (
    emp_no integer PRIMARY KEY,
    salary numeric
);

-- Create tables with foreign keys after referenced tables exist
CREATE TABLE employees (
    emp_no serial PRIMARY KEY,
    emp_title_id varchar(5),
    birth_date date,
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(2),
    hire_date date,
    CONSTRAINT FK_employees_titles FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    CONSTRAINT FK_employees_salaries FOREIGN KEY (emp_no) REFERENCES salaries (emp_no)
);

CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no varchar(5) NOT NULL,
    CONSTRAINT PK_dept_emp PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT FK_dept_emp_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    CONSTRAINT FK_dept_emp_departments FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no varchar(5) NOT NULL,
    emp_no integer NOT NULL,
    CONSTRAINT PK_dept_manager PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT FK_dept_manager_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    CONSTRAINT FK_dept_manager_departments FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);


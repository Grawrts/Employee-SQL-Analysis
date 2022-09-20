-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/qtHjXQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE "dept_emp"
DROP TABLE "departments"

CREATE TABLE "departments" (
    "dept_no_fk" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
	PRIMARY KEY (dept_no_fk)
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no_fk)
);


CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" VARCHAR(15)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" CHAR(1)   NOT NULL,
    "hire_date" VARCHAR(15)   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" VARCHAR(15)   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL
);



ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");


--DDL (Data Definition Language) Problems
--Create a table named Employees with columns: EmpID (INT), Name (VARCHAR(50)), Age (INT), Department (VARCHAR(30)), Salary (DECIMAL(10,2)).

drop table if exists Employees;
create table Employees(EmpID int, Name varchar(50),Age int, Department varchar(30),Salary decimal(10,2));
select * from Employees;

--Modify the table Employees to add a new column: JoiningDate (DATETIME).

alter table Employees 
add JoiningDate datetime;

--Rename the column Salary in Employees to Monthly_Salary.

exec sp_rename 'Employees.Salary', 'Monthly_Salary', 'COLUMN'; 

--Delete the column JoiningDate from Employees.

alter table Employees
drop column JoiningDate;

--Drop the table Employees.

drop table Employees;

--DML (Data Manipulation Language) Problems
--Insert multiple records into Employees with values of your choice.

insert into Employees(EmpID,Name,Age,Department,Salary) values(1,'Aishu',18,'CSE',12000.00);
insert into Employees(EmpID,Name,Age,Department,Salary) values(5,'Thanu',17,'CSE',14000.00),
(3,'Madhu',20,'Analyst',20000.00),(4,'Sindhu',21,'Scientist',30000.00);
select * from Employees;

--Update salary for all employees in the ‘CSE’ department.

update Employees set Salary = 20000.00 where Department = 'CSE';

--Delete employees who are older than 20 years.

delete from Employees where Age >= 20;

--Retrieve all employees who earn more than a specific amount.

select * from Employees where Salary * 12 > 200000;

--Use an alias to rename the Salary column as Annual_Salary in a SELECT query.
select Salary * 12 as Annual_Salary
from Employees;

--Order of Query Execution Problems
--Write a query to retrieve the top 3 highest-paid employees from Employees, ordering them in descending order of Salary.
select top 3 Name as HPE, (Salary * 12) as 'Highest salary' from Employees
order by Salary desc;

--Find the department-wise average salary and order the result by highest to lowest.

select Department, avg(Salary) as Avg_salary 
from Employees
group by Department
order by Avg_salary desc;

--Retrieve only distinct department names from Employees.

select distinct Department from Employees;

--Filter employees who have ‘Manager’ in their Name, then sort the result in descending order by Salary.
select * from Employees where Name like '%an%'
order by salary desc;
--Use a subquery to get employees who earn more than the average salary of all employees.
select * from Employees where salary > (select avg(Salary) from Employees);




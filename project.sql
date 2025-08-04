create database Employee_Database;
use Employee_Database;
create table Employee(Employee_id int,First_Name varchar (20),Last_Name varchar (15),Salary int, Joining_Date varchar (10),Department varchar (20),primary key (Employee_id));
insert into Employee(Employee_id,First_Name,Last_Name,Salary,Joining_Date,Department)values(1,'venkatesh','S',100000,'08/28/2015','Banking'),
(2,'Ragavi','P',75000,'08/28/2015','Business'),
(3,'Gopinath','C',50000,'03/02/2016','Pharma'),
(4,'Dinesh','G',50000,'03/02/2016','Insurance'),
(5,'Saibabu','E',40000,'07/08/2017','Software'),
(6,'Hasan','S',29000,'07/08/2017','Manufacturing'),
(7,'Divya','P',33000,'07/08/2017','Healthcare'),
(8,'Aravindan','R',40000,'07/08/2017','Healthcare'),
(9,'Sathish','MD',45000,'03/02/2016','Automobile'),
(10,'Prasanth','PKP',34000,'03/02/2016','Insurance'),
(11,'Vijay','R',25684,'03/02/2016','Business'),
(12,'Sivakumar','K',54789,'03/02/2016','Software');


create table Incentive(Employee_Ref_id int,Incentive_date varchar (15),Incentive_Amount int, foreign key(Employee_Ref_id) references Employee (Employee_id));
insert into Incentive(Employee_Ref_id,Incentive_date,Incentive_Amount)values(1,'01-FEB-16',5000),
(2,'01-FEB-16',3000),
(3,'01-FEB-17',4000),
(1,'01-JAN-17',4500),
(2,'01-JAN-17',3500);
select * from Employee;
select * from Incentive;




-- 1.Get all employee detailes from the table.
select * from Employee;

-- 2.Get first_name,Last_name from employee table.
select First_Name,Last_Name from Employee;

-- 3.Get First_name from employee table using alias name "Employee name".
select First_Name Employee_Name from Employee;

-- 4.Get First_Name from employee table in upper case.
select upper(First_Name) from Employee;

-- 5.Get First_Name from employee table in lower case.
select lower(First_Name) from Employee;

-- 6.Get unique department int Employee table.
select distinct Department from Employee;

-- 7.Select first 3 characters of First Name from employee.
select substring(First_Name, 1,3) as First_Name from Employee;

-- 8.Get position of 'a' in name of ragavi from employee table.
select position( 'a' in First_Name) position_of_a_in_Ragavi from Employee where Employee_id = 2;

-- 9.Get first_name from employee table after removing white spaces from the right side.
select rtrim(First_Name) First_Name from Employee;

-- 10.Get first_name from employee table after removing white spaces from the left side.
select ltrim(First_Name) First_Name from Employee;

-- 11.Get lenght of First_Name from Employee.
select length(First_Name) length_of_a_First_Name from Employee;

-- 12.Get First_Name from employee table after replaving 'a' with '$'.
select replace(First_Name,'a','$') from Employee;

-- 13.Get First and last name as single column from employee table separate by a '_'.
select concat(First_Name,' ',Last_Name) full_name from Employee;

-- 14.Get first name, joining year, joining month, joining date from employee table.
select First_Name,SUBSTRING_INDEX(JOINING_DATE, '/', -1) as JOINING_YEAR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(JOINING_DATE, '/', 2), '/', -1) as JOINING_DATE,
    SUBSTRING_INDEX(JOINING_DATE, '/', 1) as JOINING_MONTH from Employee;
   
-- 15.Get all employee details from the employee table order by first name Ascending.
select * from Employee order by First_Name asc;

-- 16.Get all employee details from the employee table order by first name desending.
select * from Employee order by First_Name desc;

-- 17.Get all employee details from the employee table order by first name ascending and salary desending.
select * from Employee order by First_Name asc, Salary desc;

-- 18.Get employee details from employee table whose employee table is 'Dinesh'.
select * from Employee where First_Name = 'Dinesh';

-- 19.Get employee details from employee table whose employee table are 'Dinesh' and 'Roy".
select * from Employee where First_Name = 'Dinesh'or First_Name = 'Roy';

-- 20.Get employee details from employee table whose employee table are not 'Dinesh' and 'Roy".
select * from Employee where First_Name != 'Dinesh' or First_Name !='Roy';

-- 21.Get employee details from employee table whose Frist name starts with S.
select * from Employee where First_Name like 'S%';

-- 22.Get employee details from employee table whose Frist name contains V.
select * from Employee where First_Name like '%v%';

-- 23.Get employee details from employee table whose Frist name ends with S.
select * from Employee where First_Name like '%n';

-- 24.Get employee details from employee table whose Frist name ends with n and name contains 4 letters.
select * from Employee where First_Name like '%n____';

-- 25.Get employee details from employee table whose Frist name starts with J and name contains 4 letters.
select * from Employee where First_Name like 'J____%';

-- 26.Get employee details from employee table whose salary is greater than 60000.
select * from Employee where Salary>60000;

-- 27.Get employee details from employee table whose salary is less than 80000.
select * from Employee where Salary<80000;

-- 28.Get employee details from employee table whose salary is between 50000 and 80000;
select * from Employee where Salary>50000 AND Salary<80000;

-- 29.Get employee details from employee table whose name is Venkatesh and ragavi.
select * from Employee where First_Name = 'Venkatesh'or First_Name = 'Ragavi';

-- 30.Get name of employees from employee table who has % in last name TIP. Escape character for special character in a query.
select * from Employee where Last_Name = '%';

-- 31.Get from employee table after replacing spqcial character with white space.
select;

-- 32.Get department,total salary with respect to a department from employee table.
select Department,sum(Salary) as  total_Salary from Employee group by Department;

-- 33.Get department and total salary with respect to department in employee table in desending order of total salary.
select Department  , sum(Salary) AS total_Salary from Employee group by Department order by sum(Salary) desc;

-- 34.Get department and number employee in department and total salary with respect to department in employee table in desending order of total salary.
Select Department , count(Employee_id),sum(Salary) AS total_Salary from Employee group by Department order by sum(Salary) desc;

-- 34.get department and number employee in department and total salary with respect to department in employee table in desending order of total salary.
select department , count(employee_id),sum(salary) as total_salary from employee group by department order by sum(salary) desc;

-- 35 Get department wise average salary from employee table order by salary assending
select Department , avg(Salary) as average_salary from Employee group by Department order by avg(Salary) asc;

-- 36 get department wise maximum salary from employee table order by salary assending
select Department , max(Salary) as average_salary from Employee group by Department order by max(Salary) asc;

-- 37 Get department wise minimum salary from employee table order by salary assending
select Department , min(Salary) as average_salary from Employee group by Department order by min(Salary) asc;

-- 38 select number of employee joined with respect to year and month table
select substring_index(joining_date, '/', -1) as joining_year,
  substring_index(joining_date, '/', 1) as joining_month,
       count(*) as Employee_count from Employee
group by joining_year, joining_month order by joining_year, joining_month;

-- 39 select department , total salary with respect to total salary greater than 800000
select Department , sum(Salary) total_salary from Employee group by Department having sum(Salary)>800000 order by sum(Salary) desc;

-- 40select first name , incentive amount from employee and incentive table
select t1.First_Name , t2.Incentive_Amount from Employee t1 join Incentives t2 on t1.Employee_id=t2.Employee_Ref_id;

-- 41 select first name , incentive amount from employee and incentive table who have incentive more than 3000
select t1.First_Name , t2.Incentive_Amount from Employee t1 join Incentives_Amount t2 on t1.Employee_id=t2.Employee_Ref_id where Incentive_Amount > 3000;

-- 42 select first name and incentive amount from employeee and incentive table even they not have incentive
select t1.First_Name , t2.Incentive_Amount from Employee t1  left join Incentives t2 on t1.Employee_id=t2.Employee_Ref_id;

-- 43 select first name and incentive amount from employeee and incentive table even they not have incentive than put 0
select t1.First_Name , ifnull(t2.Incentive_Amount,0) from Employee t1 left join Incentives t2 on t1.Employee_id=t2.Employee_Ref_id ;

-- 44 select first name , incentive amount from employee and incentive table  who got incentive using left join
select t1.First_Name , t2.Incentive_Amount from Employee t1  left join Incentives t2 on t1.Employee_id=t2.Employee_Ref_id
where t2.Incentive_Amount is not null ;

-- 45 select max incentive with respect to employee from employee table and incentive table using sub query
select First_Name,(select max(Incentive_Amount) from Incentives where Employee_Ref_id = Employee.Employee_id) as max_Incentive from Employee;

-- 46 select top 2 salary from the table
select Salary top_2_Salary from Employee order by Salary desc limit 2;

-- 47 select top n salary from the table
select Salary top_10_Salary from Employee order by Salary desc limit n;

-- 48 select 2nd highest salary from the table
select Salary 2nd_highest_Salary from Employee limit 1 offset 1 ;

-- 49 select nth highest salary from the table
select Salary nth_highest_value from Employee limit 1 offset n-1 ;


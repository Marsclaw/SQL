comments in python #
comments in sql  --

-- create table 
create table Employee(EID integer,
ename varchar2(100),
salary float,
DOB date,
Job varchar2(100)
);



select * from Employee;

desc Employee;


--Adding one column to the table
Alter table Employee add Manager varchar2(100);

desc Employee;

--Adding Multiple columns to the table
alter table employee add(performance_grade varchar2(10) , City varchar2(100));


-- changing  the datatype of a column

Alter table Employee modify PERFORMANCE_GRADE number;


--Renaming existing column


alter table Employee Rename column PERFORMANCE_GRADE to PERFORMANCE_SCORE ;


-- dropping existing column
alter table employee drop column CITY;

desc employee;

alter table employee drop column PERFORMANCE_SCORE;

desc employee;

-- droping multiple columns
alter table employee drop(JOB,MANAGER);

-- Renaming tables 
alter table employee rename  to employees;
desc employees;

-- droping the table
drop table employees;
desc employees;


--Truncate (Run all the rows/ data)

truncate table employee



----------------------------------------------
DML -(data manuplation language)

--inserting into all columns
insert into Employee(EID,ename,salary,DOB,Job) values (1,'Vamsi',1000.0,'02-DEC-1997','DATA ANALYST');

commit;
--inserting into all columns


insert into Employee values(2,'Rahul',2000,'14-MAR-1997','CYBER');
commit;

--inserting into specified columns
insert into Employee(EID,ENAME,SALARY) values(3,'Gopi',3000.0);


----------------------------


--Display all rows/column
select * from employee;

--Display all rows / specefic columns
select EID,ENAME,SALARY from employee;

--------------------------------
--DIstinct (removes, duplicate)

select distinct ename,salary from employee;
select distinct * from employee;


--------------------------------------

--Count the total number of rows in the table

select count(*) from employee;

--count the  number of values in the dob column

select count(DOB) from employee;

---------------------------------------------

select * from employee
where ename = 'Vamsi' and salary = 1500

select * from employee
where ename = 'Vamsi' and salary = 3000

select * from employee
where ename = 'Vamsi' or salary = 3000

-- where  clauese with greater than   sign
select * from employee
where salary >1500

---- where  clauese with  greater than or equal to sign
select * from employee
where salary >= 1500

select * from employee
where salary >= 1500 and ename = 'Rahul'



-- where  clauese with greater than   sign
select * from employee
where salary >1500

---- where  clauese with  greater than or equal to sign
select * from employee
where salary >= 1500

select * from employee
where salary >= 1500 and ename = 'Rahul'

--selct only null values
select * from employee
where DOB is null;

--selext those records which are not vamsi

select * from employee
where ename <> 'Vamsi'

select * from employee
where ename != 'Vamsi'



select * from employee
where ename != 'Vamsi' or salary = 1000



-- The SQL IN condition (sometimes called the IN operator) allows you to easily test if an expression matches any value in a list of values.
select * from employee
where ename in ('Vamsi','Rahul')

select * from employee where salary in (1500,1000);

-- display records which are not specified in th elist of IN operator
select * from employee
where ename not in  ('Vamsi','Rahul')

-------------------------------------------------

--selct only null values
select * from employee
where DOB is null;

--select only not null values
select * from employee where DOB is not null;


-------------------------------

--between  and operator is used to get the data between the mentioned range ..Both values are inclusive
select * from employee where salary between  2000 and 3000

----------------------------------

--pattern matching 


select * from employee where ename like '%v%'
select * from employee where ename like '%i'

-------------------------------------

Not operator


select *  from employee
where not (ename = 'Vamsi'and salary = 1500)

-----------------------

--ascening order
select * from employee
order by ename 

-- descending order 
select * from employee
order by ename desc


-- descending order of salary
select * from employee
order by salary desc

select * from employee
order by ename , salary desc

---------------------------------------
--update statement

update employee
set JOB = 'MBA HR';
commit;


update employee
set job = 'DATA ANALYST'
where ename = 'Vamsi';


update employee
set job = '.NET'
where ename = 'Ravali' or SALARY = 5000

--------------------------------------------


--delete  specefic rows

delete from employee
where ename = 'Gopi;

--delete all records 

delete from employee;



--delete without where condition is same as truncate ..It deletes all the data ..Truncate is faster than delete


--Truncate
--Tanle gets dropped
--Empty table gets created

--Delete
--Eacha and every record gets deleted


-----------------------------------------------------------------

--Aggregate functions 
-- sum aggregate function
select sum(Salary)
from employee;

--min aggregate function 

select min(salary) "MINIMUM_SALARY"
from employee;

--max aggregate function

select max(salary) 
from employee;

--mean of salary

select avg(salary)
from employee;



select avg(salary) "AVERAGE_SALARY"
from employee;

--count number of rows
select count(salary) "count"
from employee;

-----------------------------------------------------------------------------------

--Aliasing(Changing table name or column name )


select * from employee  emp
where emp.ename = 'Vamsi'


------------------------------------------------------------------------------------

--CTAS COMMAND (Crating a new table with the same structure as existing table)
--no data because of false condition
create table staff as select * from employee  where 1 = 2;
--with data 
create table staff as select * from employee

-----------------------------------------------------------------------------------------


--concatination of two or more tables with duplicates
select * from employee
union all
select * from staff


--concatinating two or more duplicates with out duplicates
select * from employee
union 
select * from staff

-- all the columns in the select statement should be same 

--concatination of two or more tables with duplicates
select * from employee
union all
select * from staff


--concatinating two or more duplicates with out duplicates
select eid,ename from employee
union
select eid,ename from staff
-------------------------------------------------------------------------------------------------------------
--common records between both tables 
select * from employee
intersect
select * from staff

--common records between both tables 
select * from employee
intersect
select * from staff
--------------------------------------------------------------------------------------

--share all the records in employee  except the common records in both the tables 
select * from employee
minus
select * from staff

--share all the records in staff  except the common records in both the tables 
select * from staff
minus
select * from employee

--------------------------------------------------------------------------------------------------------------

-- customer table

create table customer(custid number,
cust_name  varchar2(100),
customer_phone number,
cust_city varchar2(100)
);

create table orders(order_id number,
custid number,
order_date date,
order_item varchar2(100));

insert into   customer values(100,'vamsi',9089880,'priston');
insert into  customer  values(200,'Gopi',97878234,'manchester');

-----------------------------------------------------------------------------------------------
insert into  customer  values(300,'vinay',87866,'london');
insert into  customer  values(400,'Abhi',679786,'priston');
insert into  customer  values(500,'Ravali',9089880,'leeds');
commit;
-------------------------

insert into orders values(1,100,'19-Sep-2022','Bat');

insert into orders values(2,200,'11-Sep-2022','Book');
insert into orders values(3,400,'19-Sep-2022','car');
insert into orders values(4,1000,'19-Sep-2022','Guitar');



-- Now the requirement is i want the personal details of customers , who have ordered.

select c.*,o.*
from customer c , orders o
where c.custid = o .custid

----------------------------------------------------------------------------------------------------

--Now the requirement is i want to find the  personal details of all the customers , who have ordered and who have not orderes
select c.*,o.*
from customer c , orders o
where c.custid = o.custid(+)


------Now the requirement is i want all order details , along with common customerids of the cust table and the order table

select c.*,o.*
from customer c , orders o
where c.custid(+) = o.custid

------------------------------

--Group by / having


create table students (name  varchar2(100), gender  varchar2(2), subject varchar2(100), marks number);

insert into students values('vamsi','M','python', 90);
insert into students values('vamsi','M','java', 80);
insert into students values('vamsi','M','dotnet', 87);
insert into students values('vamsi','M','business', 90);

insert into students values('Gopi','M','python' ,90);
insert into students values('Gopi','M','java', 70);
insert into students values('gopi','M','dotnet', 60);
insert into students values('gopi','M','business', 76);


insert into students values('Vinay','M','python', 50);
insert into students values('vinay','M','java', 76);
insert into students values('vinay','M','dotnet', 68);
insert into students values('vinay','M','business', 76);


insert into students values('Ravali','F','python', 70);
insert into students values('Ravali','F','java' ,90);
insert into students values('Ravali','F','dotnet', 50);
insert into students values('Ravali','F','business', 66);


insert into students values('Nandu','F','python', 73);
insert into students values('Nandu','F','java', 92);
insert into students values('Nandu','F','dotnet', 78);
insert into students values('Nandu','F','business', 66);


select * from students

-- group by gender ,a nd determine the average marks of each gender
select gender,avg(marks)
from students
group by gender

-----
select gender, min(marks)
from students
group by gender

--------------------------
select name , avg(marks)
from students
group by name
---------------------------

select name , max(marks)
from students
group by name 
--------------------------------
-- filtering the data when group by is used ..use having clause...
select name , avg(marks)
from students
group by name
having avg(marks) >= 60

--------------------------------------------

-- inbuilt table by the system

select * from dual



select 2 + 2 "Addition" from dual;

select 7 * 23 "multipiy" from  dual;

---------------------------------------------------


--primary key
-- primary is the key ( a column or combination of columns through  which we can identify the complete row or unique row )
--properties:
--it should be unique
--duplicates are not allowed
--it should not be null
--it  cn be defined on one column or multiple columns


create table customer(custid number primary key,
cust_name  varchar2(100),
customer_phone number,
cust_city varchar2(100)
);

insert into   customer values(100,'vamsi',9089880,'priston');
insert into  customer  values(200,'Gopi',97878234,'manchester');
insert into  customer  values(300,'vinay',87866,'london');
insert into  customer  values(400,'Abhi',679786,'priston');
insert into  customer  values(500,'Ravali',9089880,'leeds');
insert into customer values(600,'ram', 90239294,'birmingham');
commit;



select * from customer;


insert into customer values(null ,'ram', 90239294,'birmingham');
--ORA-01400: cannot insert NULL into ("SQL_PPMSQJSXEVQAHPXEUWHAMGWFW"."CUSTOMER"."CUSTID") ORA-06512: at "SYS.DBMS_SQL", line 1721
insert into   customer values(100,'vamsi',9089880,'priston');
--ORA-00001: unique constraint (SQL_PPMSQJSXEVQAHPXEUWHAMGWFW.SYS_C0096052340) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

---------------------------------------------------------------------------------------------------------------------------

--not null constraint ( doesnot allow null values )

alter table customer modify (customer_phone not null);
insert into customer values(700,'shyam', null,'birmingham');
ORA-01400: cannot insert NULL into ("SQL_PPMSQJSXEVQAHPXEUWHAMGWFW"."CUSTOMER"."CUSTOMER_PHONE") ORA-06512: at "SYS.DBMS_SQL", line 1721

----------------------------------------------------------------------------------------------------------------------------------------

-- check constraints (  checks the condition and allows the values if the condition is true)

create table customer(custid number primary key CHECK(custid < 1000),
cust_name  varchar2(100),
customer_phone number  not null,
cust_city varchar2(100)
);

insert into   customer values(100,'vamsi',9089880,'priston');
insert into  customer  values(200,'Gopi',97878234,'manchester');
insert into  customer  values(300,'vinay',87866,'london');
insert into  customer  values(400,'Abhi',679786,'priston');
insert into  customer  values(500,'Ravali',9089880,'leeds');
insert into customer values(600,'ram', 90239294,'birmingham');
commit;


ORA-01400: cannot insert NULL into ("SQL_PPMSQJSXEVQAHPXEUWHAMGWFW"."CUSTOMER"."CUSTOMER_PHONE") ORA-06512: at "SYS.DBMS_SQL", line 1721

-------------------------------------------------------------------------------------

-- REefer unique constraint

----------------------------------------------------------------------------------------

--concatination operator (||)
select custid || cust_name from customer;


select 'my name is ' || cust_name || '.And my id is ' || custid from customer

-------------------------------------------------------------------------------------------

---sub query ( IF the output of a query servers as input to the next query , it is called as subquery) or A query with in a query is called sub query)
-- find the  max marks for name = vamsi
select max(marks) from students where name = (select  distinct(name) from students where name = 'vamsi')

-------------------------------------------------------------------------------

--partitons

--This is dividing the database into logical segments , so that the data is stored logically and the retrieval is done faster

partition by data

partition by date


--rank is used to display ranks over the column mentioned in the over clause .The duplicae ranks results in skipping of the succeeding ranks.
select name , subject , marks  , rank() over ( order by marks desc )
from students


select name ,subject,marks,rank() over (partition by subject  order by marks desc)
from students



-- dense_rank is used to display all the ranks unlike that of rank
select name , subject , marks  , dense_rank() over ( order by marks desc )
from students

select name ,subject,marks,dense_rank() over (partition by subject  order by marks desc)
from students



----------------------------------------

create  table sales_day (day  number,sales number);  

insert  into sales_day values (1,1000);
insert  into sales_day values (2,20000);
insert  into sales_day values (3,3000);
insert  into sales_day values (4,4000);
insert  into sales_day values (5,5000);
insert  into sales_day values (6,6000);
insert  into sales_day values (7,700);
insert  into sales_day values (8,8000);
insert  into sales_day values (9,9000);
insert  into sales_day values (10,100);
insert  into sales_day values (11,11000);
insert  into sales_day values (12,12000);
insert into sales_day values(13,123);
insert into sales_day values(14,10000);
insert into sales_day values (15 , 15000);
insert into sales_day values (16,13000);


select * from sales_day ;
--lag 
select day,sales, lag(sales) over (order by day) as "Previousday", sales-lag(sales) over (order by day) as "profit"

from sales_day

--lead
select day,sales, lead(sales) over (order by day) as "nextday"

from sales_day

--------------------------------------------

-- nvl has two inputs.if first input is null , it return the second value , otherwise , it return s first value

select nvl(null,'vamsi') from dual;

select  nvl('gopi' , null) from dual;


select * from students

insert into students values ('Ravali','F',null ,90);

select name , gender , nvl(subject , 'python'),marks from students 

------------------------------------------------------------------

-- nvl2  if first value is null , display 3rd value , otherwise display 2nd value
select nvl2( null , 'vamsi because first value is not null' , ' gopi because first value is null')
from dual

-----------------------------------------------------------------------
-- compares  two values , return null if both of them are equal ..if they are unequal it returns first value
select nullif('vamsi','vamsi') from dual

select nullif('vamsi','gopi') from dual

------------------------------------------------------------------------------

--  takes n inputs and returns first not null value
select COALESCE( null, 'vinay', 'vamsi','gopi',null ) from dual

----------------------------------------------------------

-- decode  acts a s if /else condition ..pass if the marks are {90,92,87} ..Fail if other wise
select name , gender , subject ,marks , decode(marks , 90 ,'PASS' , 87 ,'PASS' ,  92 ,'PASS' ,'FAIL') from students 

----------------------------------------------------------------------


select name , marks  , case  when   marks between 80 and 90  then 'Excellent' 
                              when marks between 70 and 80 then ' Very Good' 
                              when marks between 60 and 70  then 'average' 
                              else 'Fail'  end
from students 



select name , marks  , case  when   marks > 70 then 'pass' 
                             else 'Fail'  end  
from students ;

--------------------------------------------------------------------------------------------


select * from students

select upper(name) from students;
select lower(gender) from students;
select initcap(name) from students;


-- changes the case to upper case 
select upper('vamsi') from dual;
select upper('raVali') from dual;

--changes case to lower case
select lower('VAMSI') from dual;


-- it changes first letter to the capital (initial to capital)
select initcap('vamsi') from dual;


------------------------------------------------------------------------------------------------------


-- concatinates only two inputs given to the concat function
select concat('vamsi','krishna') from dual;

select concat(name,gender) from students;


--SUBSTR: Extracts a string of determined length 

substr('string' , starting index , length of the output) from dual

select substr('vamsi',1,3) from dual;

select substr('vamsikrishna' ,3,9) from dual;

-- LENGTH: Shows the length of a string as a numeric value 

select length('vamsikrishna') from dual;

--INSTR: Finds numeric position of a named character 

select instr('vamsikrishna' , 'k') from dual;

-- LPAD: Pads the character value left-justified 

select lpad('vamsi',10,'Z') from dual;

--RPAD : pads the charecter value tot he right 
select rpad('vamsi',10,'Z') from dual;


 -- trim
 
 -- it removes the space on both sides 
 select trim('  vamsi krishna     ') from dual
 
 -- it removes space on the left side 
  select ltrim('  vamsi krishna') from dual
  
  -- it removes  the space on the right side 
   select rtrim('vamsi krishna     ') from dual
 

-- it reverses   the elements present  

select reverse('vamsi') from dual;
 
select reverse('12345') from dual;

--replace 
REPLACE( string1, string_to_replace, replacement_string )
select replace('vamsikrishna', 'vamsi','ravi') from dual


---------------------------------------------------------------------


-- to_date convert our given date to the system date format understood by sql

select to_date('01-JAN-2022' ,'DD-MON-YYYY') from dual;

select to_date('2022-10-01' ,'YYYY-MM-DD') from dual;


-------------------------


select sysdate from dual;



-- to_char conversts the   standard date into the date specified in the format
 SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM dual;


----------------------------------------------------------------------------------------


--ADD_MONTHS

-- adds  the number of months specified  to the date below 
select ADD_MONTHS('01-FEB-22', 2) from dual;

-- find current date#

select sysdate from dual;


-- extract year from the given date
select extract( YEAR from sysdate)  from dual
-- extract month from the given date

select extract(month from sysdate) from dual

-- extract  day from the given date

select extract(day from sysdate) from dual

--LAST_DAY  Gets the last day of the month of a specified date.

select LAST_DAY(sysdate) from dual

select LAST_DAY('23-NOV-2019') from dual


--MONTHS_BETWEEN Return the number of months between two dates.

select MONTHS_BETWEEN(sysdate,'23-NOV-2019' ) from dual

--Get the first weekday that is later than a specified date.
select NEXT_DAY(sysdate,'Friday') from dual

-- generate current day
select sysdate from dual

--generate first day of the particular month 
SELECT TRUNC( SYSDATE, 'MM' ) result FROM dual;
--generatet the first y of the particular year
select trunc(sysdate,'YYYY') from dual
select trunc(to_date('02-DEC-1997','DD-MON-YYYY'),'MM') from dual

----------------------------------------------------------


-- merge  table 

MERGE INTO employees e
    USING hr_records h
    ON (e.id = h.emp_id)
  WHEN MATCHED THEN
    UPDATE SET e.address = h.address
  WHEN NOT MATCHED THEN
    INSERT (id, address)
    VALUES (h.emp_id, h.address);


-----------------------------------------------------



--Home work


Self join

Natural join 

Hierarchical query 






























##1 select * from employees  LIMIT 10;
##2 select emp_no,first_name,last_name from employees
##4 select * from departments
##5 select * from salary
          ##2
##1 SELECT DISTINCT title FROM titles
##2 SELECT DISTINCT gender FROM employees
##3 SELECT DISTINCT dept_name FROM departments
                ##3
##1 select * from employees where first_name='Georgi'
##2 select * from employees where hire_date > '1999-01-01'
##3 select * from salaries where salary>120000
##4 select * from titles where title ='Engineer'
##5 select * from employees where birth_date between 1960-01-01  and 1965-12-31
           ##4
##1 select emp_no, first_name, last_name from employees  order by hire_date
##2 select emp_no, first_name, hire_date from employees order by  hire_date desc limit 20
##3 select * from departments order by dept_name 
         ##5
##1 select * from employees where gender='F' and hire_date >= '2000-01-01'
##2 select * from salaries where salary>=100000 and to_date='9999-01-01'
         ##6
##1 select * from employees where first_name = 'Georgi' or first_name = 'Parto'
##2 select * from titles where title = 'Engineer' or title ='Senior Engineer'
        ##7
##1 select * from employees where  not gender ='M'
##2 select * from departments where  dept_name not like '%sales%'
        ##8
/* CREATE TABLE IF NOT EXISTS student_notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP); */
##1 insert into student_notes (note) values('My first practice note')
##2 insert into student_notes (note) values('My second practice note'),('third')
       ##9
##1 insert into student_notes (note) values(NULL)
##2 select * from student_notes  where note is null 
##3 select * from student_notes  where note is  not null 
       ##10
##1 update student_notes  set  note = 'update' where id =1
##SET SQL_SAFE_UPDATES = 0;
##2 UPDATE student_notes SET note = 'No note provided' WHERE note IS NULL;
      ##11
##1 delete from student_notes  where note = 'No note provided'
##2 delete from student_notes order by id desc limit 1
	  ##12
##1 select * from employees limit 10
##2 select * from salaries where to_date = '9999-01-01' order by salary desc limit 5
    ##13
##1 select count(*) from employees
##2 select min(salary)as minn ,max(salary)as maxx ,avg(salary) as avgg from salaries
##3 select distinct  title from titles
##4 select min(salary)as minn ,max(salary)as maxx ,avg(salary) as avgg from salaries where to_date = '9999-01-01'
    ##14
##1 SELECT MIN(hire_date) AS earliest_hire_date, MAX(hire_date) AS latest_hire_date FROM employees;
##2 SELECT MIN(salary) AS min_current_salary,MAX(salary) AS max_current_salary FROM salaries WHERE to_date = '9999-01-01'
        ##15
##1 SELECT COUNT(*) AS hires_in_1990 FROM employees WHERE YEAR(hire_date) = 1990;
##2 select count(*)as em from titles where  title ='Senior Engineer' and to_date = '9999-01-01'
       ##16
##1 SELECT SUM(salary) AS total_current_salaries FROM salaries WHERE to_date = '9999-01-01';
##2 SELECT emp_no, SUM(salary) AS total_historical_salary FROM salaries WHERE emp_no = 10001;
   ##17
##1 SELECT AVG(salary) AS avg_current_salary FROM salaries WHERE to_date = '9999-01-01';
##2 select avg(salary) , title from salaries join titles on salaries.emp_no=titles.emp_no group by title
     ##B1
##1 select employees.* ,departments.dept_name  from employees join dept_emp on dept_emp.emp_no =employees.emp_no join departments on dept_emp.dept_no=departments.dept_no WHERE dept_emp.to_date = '9999-01-01'
 /* ##2 select employees.first_name ,employees.last_name,departments.dept_name from dept_manager 
join departments on dept_manager.dept_no=departments.dept_no
join employees on employees.emp_no=dept_manager.emp_no
where dept_manager.to_date = '9999-01-01'*/
##3 select em.first_name ,em.last_name , ti.title from employees as em  join titles as ti on em.emp_no = ti.emp_no where ti.to_date = '9999-01-01'
		##b2
/*##1 select dep.dept_name  ,count(*) as employess from departments as dep
 join  dept_emp as dept  on dept.dept_no=dep.dept_no
 where dept.to_date='9999-01-01'
 group by dep.dept_name
 order by count(*)  desc*/
 
 /*##2 select departments.dept_name ,count(salaries.salary) from departments join dept_emp on departments.dept_no =dept_emp.dept_no 
 join salaries on dept_emp.emp_no =salaries.emp_no
 where dept_emp.to_date='9999-01-01'
 group by departments.dept_name*/
 
/* ##3 select  titles.title ,avg(salaries.salary) from titles
 join salaries on titles.emp_no=salaries.emp_no
 where salaries.salary>70000 and salaries.to_date='9999-01-01'
 group by titles.title*/
 
 select departments.dept_name,count(*) as employeess
 ,min(salaries.salary)as minn ,max(salaries.salary)as maxx 
 from employees join salaries on employees.emp_no=salaries.emp_no
 join dept_emp on dept_emp.dept_no=departments.dept_no
 where dept_emp.to_date='9999-01-01'
 group by departments.dept_name
 
 
 
 




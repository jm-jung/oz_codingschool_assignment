-- create table users(
-- 	 id int primary key auto_increment,
--      password varchar(4),
--      name varchar(3),
--      gender Enum('male','female'),
--      email varchar(15),
--      birthday char(6),
--      age tinyint,
--      company enum('samsung','lg','hyundai')
-- );

-- create table board(
-- 	id int primary key auto_increment,
--     title varchar(5),
--     content varchar(10),
--     likes int check(likes between 1 And 100),
--     img char(1) default'c',
--     created date,
--     user_id int,
--     foreign key(user_id) references users(id)
-- );


-- 1. **`employees` 테이블을 생성해주세요**
--     - 속성명 **`id`의** 자료형은 INT입니다. 추가로 자동으로 1씩 증가하도록 설정하고 기본키로 지정합니다.
--     - 속성명 **`name`의** 자료형은 VARCHAR(100)입니다.
--     - 속성명 **`position`의** 자료형은 VARCHAR(100)입니다.
--     - 속성명 **`salary`의** 자료형은 DECIMAL(10, 2)입니다.

-- create table employees(
-- 	id int primary key auto_increment,
-- 	name varchar(100),
--     position varchar(100),
--     salary decimal(10,2)
-- );

-- 1. **직원 데이터를 `employees`에 추가해주세요**
--     - 이름: 혜린, 직책: PM, 연봉: 90000
--     - 이름: 은우, 직책: Frontend, 연봉: 80000
--     - 이름: 가을, 직책: Backend, 연봉: 92000
--     - 이름: 지수, 직책: Frontend, 연봉: 78000
--     - 이름: 민혁, 직책: Frontend, 연봉: 96000
--     - 이름: 하온, 직책: Backend, 연봉: 130000

-- insert into employees (name,position,salary) values
-- ('혜린','PM',90000), 
-- ('은우','frontend',80000), 
-- ('가을','backend',92000), 
-- ('지수','frontend',78000), 
-- ('민혁','frontend',96000), 
-- ('하온','backend',130000)

-- 1. **모든 직원의 이름과 연봉 정보만을 조회하는 쿼리를 작성해주세요**
-- select name, salary from employees;

-- 2. **`Frontend` 직책을 가진 직원 중에서 연봉이 90000 이하인 직원의 이름과 연봉을 조회하세요.**
-- select name, salary from employees where salary<=90000 and position='frontend';

-- 3. **`PM` 직책을 가진 모든 직원의 연봉을 10% 인상한 후 그 결과를 확인하세요.**
-- SET SQL_SAFE_UPDATES = 0;
-- update employees
-- set salary=salary*1.1
-- where position='PM';
-- select * from employees;

-- 4. **모든 `Backend`' 직책을 가진 직원의 연봉을 5% 인상하세요.**
-- SET SQL_SAFE_UPDATES = 0;
-- update employees
-- set salary=salary*1.05
-- where position='backend';
-- select * from employees;

-- 5. **민혁 사원의 데이터를 삭제하세요**
-- delete from employees where name='민혁';

-- 6. **모든 직원을 `position` 별로 그룹화하여 각 직책의 평균 연봉을 계산하세요.**
-- select position, avg(salary) as salary_average from employees group by position;

-- 7. **`employees` 테이블을 삭제하세요.**
-- drop table employees;
--schema

DML
  INSERT
  UPDATE
  DELETE

DDL
  CREATE
  DROP
  ALTER
     --Modify table structure
         --a. Add column
         --b.  remove column
         --c. modify the column
  TRUNCATE


DCL
  GRANT
  REVOKE

TCL
  COMMIT
  ROLLBACK
  SAVEPOINT
  
  
Usecase 1:
   Create new user: SQL_BATCH_20
   
   create table emp
   (id number,
    name varchar2(20),
    salary number);
   
   
select * from tab;

create table customers
(id number primary key,
 name varchar2(30) not null,
 mob_no varchar2(20) unique
 );
 
 --------------------create items table-------------------
 create table items
 (item_id number primary key,
 name varchar2(30) not null,
 unit_price number check(unit_price>0)
 );
 
 ------OR--------------
  create table items
 (
 item_id number ,
 name varchar2(30) not null,
 unit_price number ,
 primary key(item_id),
 check(unit_price>0)
 );
 
 
 --------------create orders table----------
 create table orders
 (order_id number primary key,
  customer_id number references customers(id),
  order_date date not null,
  total_amount number
  );
 
 
 ------------------------order_details----------
 create table order_details(
 order_id number references orders(order_id),
 item_id number,
 quantity number,
 primary key(order_id,item_id),
 foreign key(item_id) references items(item_id)
 );
 
 
 ---populate customers tables
 insert into customers(id, name) values (1,'Jack');
 insert into customers(id, name,mob_no) values (2,'John','+91 1234123412');
 insert into customers values (3,'Jessica','+91 1234123413');
 
 commit;
 
 select * from customers;
 
   create table cust_1
   (id number,
    name varchar2(20)
    );
   
   insert into cust_1 values (100,'a'), (102,'a'),(103,'a'); --not allowed in oracle
   
   select * from cust_1;
    
    --insert more than one row  then insert with subquery
    insert into cust_1(id,name)
    select id,name from customers order by id;
    
    select * from cust_1;
    
    
    --replicata of a table
    create table cust_1_copy
    as
    select * from cust_1;
 
     select * from cust_1_copy; 
     
     create table cust_1_copy1
    as
    select * from cust_1
    where rownum=2;
 
 
 --Drop
 drop table cust_1_copy1;
 
 --modify table cust_1
 alter table cust_1
 add (mob_no number);
 
 alter table cust_1
 drop(name);
 
 alter table cust_1
 modify( id number(6));
 
 alter table cust_1_copy
 modify (name varchar2(30));
 
  Note: DDL and DCL are auto commit;
 
 
    create table emp
   as
   select employee_id as id,last_name name,
   salary , department_id as did
   from hr.employees;
   
   
   select * from emp;
   
 -- commit; 107
   
--  delete 7 row;
     delete emp where rownum<=7;
     
       select count(*) from emp;
  
--  delete 10 row;
      delete emp where rownum<=10;
  
     select count(*) from emp;
     
     savepoint a;
  
--  update the salary with hike of 1000;

       update emp
    set salary = salary+1000;
  
    select * from emp;
  
--  rollback only update or last dml;
-------------------------------------------------  
  rollback to savepoint a;
  
  select count(*) from emp;
  
  rollback;
  
 
 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

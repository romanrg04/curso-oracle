create table papa(id int primary key,nombre varchar2(40),edad int);
create table hijomayor(id int primary key,nombre varchar2(40),edad int);
create table hijomenor(id integer primary key,nombre varchar2(40),edad int);

create or replace trigger dis_papa after insert on papa for each row 
begin
if :new.edad>18 then 
insert into hijomayor values(:new.id , :new.nombre,:new.edad);
else 
insert into hijomenor values(:new.id,:new.nombre,:new.edad);
end if ;
end;
/
insert into papa values(1,'Juan',23);
insert into papa values (2,'Ana',15);
--Hacemos select en PAPA
select*from papa;
select*from hijomayor;
select*from hijomenor;

--Generamos tablas 
create table trabajador(id int 

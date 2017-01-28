
create or replace procedure guardar_persona(my_id out integer,my_nombre in varchar2,my_edad in integer)
as
begin
select sec_persona.nextval into my_id from dual;
insert into persona values(my_id,my_nombre,my_edad);
end;
/
 
 declare 
 valor integer;
 begin 
 guardar_persona(valor,'Juan',23);
 end;
 /
 select * from persona;
 

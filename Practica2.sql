set serveroutput on;
--Recapitulando lo que es un bloque pl sql
declare 
nombre varchar2(20):='Roman Robles';
begin 
dbms_output.put_line(' Buenas Noches ' || nombre);
end ;
/
declare 
edad integer:=22;
dias integer;
status varchar2(12);
begin 
dias:=edad*365;
if dias>10000 then
status:='Viejo';
else status:='Joven';
end if;
dbms_output.put_line('Tu edad en dias es ' || dias || ' Status:' || status);
end ;
/
--Veremos nuestro primer procedimiento almacenado 
create or replace procedure saludar(mensaje IN varchar2)
as 
begin
dbms_output.put_line('Hola Buenas Noches' || mensaje);
end ;
/
--Ejecutamos el procedimiento 
exec saludar('Roman Robles Garcia');
--Generamos la Secuencia
create sequence sec_persona
start with 1
increment by 1
nomaxvalue;
--Generamos la tabla
create table persona(id_persona integer, nombre varchar(20),edad integer, constraint pk_id_persona primary key (id_persona));

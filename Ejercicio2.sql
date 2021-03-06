create table trabajador(seguro_social integer, nombre varchar2(80), paterno varchar(80),
constraint pk_trabajador primary key(seguro_social));


--creamos la secuencia para la nomina
create sequence sec_nomina 
start with 1
increment by 1
nomaxvalue;

--creamos la segunda tabla
create table nomina(id_nomina integer, seguro_social integer,horas_laboradas
integer,fecha_pago date,saldo float,constraint pk_id_nomina 
primary key(id_nomina),constraint fk1_seguro_social 
foreign key(seguro_social)references trabajador(seguro_social));

--procedimiento para guardar trabajador 
create or replace procedure guarda_trabajador(my_id in integer,
my_nombre in varchar2, my_paterno in varchar2)as
begin
insert into trabajador values(my_id,my_nombre,my_paterno);
end;
/
create or replace procedure guardar_nomina(my_id_nomina out integer,my_seguro_social in integer) as
begin 
select sec_nomina.nextval into my_id_nomina from dual;
insert into nomina(id_nomina,seguro_social) values (my_id_nomina,my_seguro_social);
end;
/     
--Ejercicio Guardar los siguientes dos trabajadores con su nomina. 
declare 
valor integer;
 begin 
 --guardar_trabajador(777,'DIANA','ROBLES');
 guarda_trabajador(666,'ROMAN','ROBLES');
 end;
 /
 select * from trabajador;
-- dECLARE 
--VALOR INTEGER;
--BEGIN
--GUARDAR_NOMINA(VALOR,33);
--END;
--/

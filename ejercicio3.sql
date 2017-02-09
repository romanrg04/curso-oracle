--Creamos tabla pelicula 
create table pelicula(id_pelicula int, titulo varchar2(50),sinopsis varchar2(50),
constraint pk_pelicula primary key(id_pelicula));
--Secuencia para Pelicula 
create sequence sec_pelicula
start with 1
increment by 1 
nomaxvalue;
--Creamos tabla salas 
create table sala (id_sala int,id_pelicula int,constraint pk_sala primary key(id_sala),
constraint fk_pelicula foreign key(id_pelicula)references pelicula(id_pelicula));

--Creamos tabla horarios
create table horarios (id_horarios int,id_pelicula int,fecha date,constraint pk_horarios primary key (id_horarios),
constraint fk_pelicula foreign key(id_pelicula) references pelicula(id_pelicula)
);

--Secuencia horarios
 create sequence sec_horarios
 start with 1 
 incremente by 1
 nomaxvalue;
 
 --Procedimientos
 create or replace procedure guardar_pelicula (my_id_pelicula out integer,my_titulo in varchar2,my_sinopsis in varchar2) as 
 begin 
 select sec_pelicula.nextval into my_id_pelicula from dual;
 insert into pelicula values(my_id_pelicula,my_titulo,my_sinopsis);
 end;
 /
 
 create or replace procedure guardar_sala(my_num_sala in integer, my_id_pelicula in integer) as
 begin insert into sala values ( my_num_sala,my_id_pelicula);
 end;
 /
 create or replace procedure guardar_horarios(my_id_horarios out integer,my_id_pelicula in integer,my_fecha in date) as
 begin
 select (sec_horarios.nextval into my_id_horarios from dual;
 insert into horarios values(my_id_horarios, my_id_pelicula,my_fecha);
 end;
 /

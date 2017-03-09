--Crear la tabla 
create table usuario_xxx(id integer,nombre varchar2(30),edad int, constraint pk_id primary key(id));
--Generar el disparador
create or replace trigger disp_usuario_xxx before insert on usuario_xxx for each row  
--Despues del begin va la logica
begin
if :new.edad < 18 then
--RAISE .. LANZA LA EXCEPCION
raise_application_error(-20001,'Eres menor de edad');
end if;
end;
/

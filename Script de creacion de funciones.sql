
DELIMITER $$
CREATE FUNCTION `calcular_fecha` (Date1 date, Date2 date)
RETURNS int
No SQL
BEGIN
	declare result int;
	if date2 != null then
		set result = datedif(day,Date1,Date2);
	else 
		set result = 0;
	end if;
    
RETURN result;
END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION `domicilio_emp` (id int)
RETURNS varchar(100)
Deterministic
BEGIN
	declare result varchar(100);
    declare direc varchar(30);
    declare ciud varchar(30);
    declare pa varchar(30);
    declare idc int;
    declare idp int;
	
    select id_ciudad into idc from direc_emp where id_direc_emp=id;
    select id_pais into idp from direc_emp where id_direc_emp=id;
    
    select direccion into direc from direc_emp where id_direc_emp=id;
    select ciudad into ciud from ciudades where id_ciudad = idc;
    select pais into pa from paises where id_pais = idp;
	
  
	set result = concat(direc, ", ", ciud, ", ",pa);

RETURN result;
END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION `domicilio_cliente` (id int)
RETURNS varchar(100)
Deterministic
BEGIN
	declare result varchar(100);
    declare direc varchar(30);
    declare ciud varchar(30);
    declare pa varchar(30);
    declare idc int;
    declare idp int;
	
    select id_ciudad into idc from direc_cliente where id_direc_cliente=id;
    select id_pais into idp from direc_cliente where id_direc_cliente=id;
    
    select direccion into direc from direc_cliente where id_direc_cliente=id;
    select ciudad into ciud from ciudades where id_ciudad = idc;
    select pais into pa from paises where id_pais = idp;
	
  
	set result = concat(direc, ", ", ciud, ", ",pa);

RETURN result;
END$$
DELIMITER ;


DELIMITER $$
USE `base_de_ciberseguridad`$$
CREATE FUNCTION `confirmacion` ( confirm int, id int)
RETURNS varchar(40)
NO SQL
BEGIN
	declare confirmacion varchar(40);
    
    if confirm = 1 then
		Set confirmacion = concat("Se elimino el cliente con id ",id);
	else 
		Set confirmacion = concat("No se encontro el cliente con id ",id);
	end if;
    
    return confirmacion;
END$$
DELIMITER ;



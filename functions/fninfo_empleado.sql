CREATE OR REPLACE FUNCTION fninfo_empleado(
num_empleado INTEGER)
RETURNS TABLE (nombre_empleado VARCHAR, puesto VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT a.nombre, b.puesto 
	FROM empleados a
	inner join cat_puestos b
	on(a.puesto = b.id)
	WHERE a.empleado = num_empleado;
END;
$$ LANGUAGE plpgsql;
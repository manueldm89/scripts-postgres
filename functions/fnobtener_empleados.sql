CREATE OR REPLACE FUNCTION fnobtener_empleados()
RETURNS TABLE (num_empleado INT, nombre_empleado VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT empleado, nombre FROM empleados;
END;
$$ LANGUAGE plpgsql;
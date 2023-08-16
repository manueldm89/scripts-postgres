CREATE OR REPLACE FUNCTION fn_obtener_numempleado_siguiente()
RETURNS INTEGER AS
$$
DECLARE
    next_empleado INTEGER;
BEGIN

    SELECT nextval('empleado_seq') INTO next_empleado;
    
    RETURN next_empleado;
END;
$$
LANGUAGE plpgsql;
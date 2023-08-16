CREATE OR REPLACE FUNCTION fn_insertar_entregas(
    num_empleado INTEGER,
    num_mes INTEGER,
    entregas INTEGER
) RETURNS INTEGER AS
$$
DECLARE
    result INTEGER;
BEGIN
	result := 0;
    -- Insertar en la tabla entregas
    BEGIN
		IF(SELECT '1' FROM entregas WHERE numero_empleado = num_empleado AND mes = num_mes) THEN
			result := -1;
		ELSE
			INSERT INTO entregas(numero_empleado, mes, cantidad_entregas)
			VALUES (num_empleado, num_mes, entregas);
			result := 1; -- Cambiar a 1 si la inserción fue exitosa
		END IF;
    EXCEPTION
        WHEN OTHERS THEN
            result := 0; -- Mantener en 0 si ocurrió un error
    END;
    
    RETURN result;
END;
$$
LANGUAGE plpgsql;
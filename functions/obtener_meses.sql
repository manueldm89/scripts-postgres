CREATE OR REPLACE FUNCTION fn_insert_update_empleado(
    num_empleado INTEGER,
    nom_empleado VARCHAR(100),
    puesto_empleado INTEGER
) RETURNS INTEGER AS
$$
DECLARE
    result INTEGER;
BEGIN
	result := 0;
    -- Verificar si el número de empleado ya existe
    IF EXISTS (SELECT 1 FROM empleados WHERE empleado = num_empleado) THEN
        -- Realizar la actualización del puesto
        UPDATE empleados
        SET puesto = puesto_empleado,nombre = nom_empleado
        WHERE empleado = num_empleado;

		result := 1;
    ELSE
        -- Insertar un nuevo registro si el número de empleado no existe
        INSERT INTO empleados(empleado, nombre, puesto)
        VALUES (num_empleado, nom_empleado, puesto_empleado);

		result := 1;
    END IF;

	RETURN result;
END;
$$
LANGUAGE plpgsql;
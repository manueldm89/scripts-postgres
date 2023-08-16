CREATE TYPE empleado_sueldo AS (
    sueldo_base NUMERIC(10, 2),
    adicional_entrega NUMERIC(10, 2),
    bono NUMERIC(10, 2),
    isr NUMERIC(10, 2),
    vale_despensa NUMERIC(10, 2),
    total_sueldo NUMERIC(10, 2)
);
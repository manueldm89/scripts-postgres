CREATE OR REPLACE FUNCTION fn_obtener_sueldo(
    num_empleado INTEGER,
    num_mes INTEGER
) RETURNS empleado_sueldo AS
$$
DECLARE
    info_salario empleado_sueldo;
	num_puesto INTEGER;
BEGIN

    info_salario.sueldo_base := 0.00;
    info_salario.adicional_entrega := 0.00;
    info_salario.bono := 0.00;
    info_salario.isr := 0.00;
    info_salario.vale_despensa := 0.00;
    info_salario.total_sueldo := 0.00;
	
	Select puesto into num_puesto from empleados where empleado = num_empleado;

	IF NOT EXISTS(SELECT cantidad_entregas FROM entregas WHERE numero_empleado = num_empleado and mes = num_mes)then
		SELECT
			(tbsp.horasxjornada * tbsp.diasxsemana * 4 * tbsp.basexhora) AS sueldo_base,
			0.00 AS adicional_entrega,
			(tbsp.horasxjornada * tbsp.diasxsemana * 4 * tbsp.bonoxhora) AS bono,
			0.00 AS isr,
			0.00 AS vale_despensa,
			0.00 AS total_sueldo
		INTO info_salario
		FROM tb_sueldosxpuesto as tbsp
		WHERE idpuesto = num_puesto;
	ELSE
		SELECT
			(tbsp.horasxjornada * tbsp.diasxsemana * 4 * tbsp.basexhora) AS sueldo_base,
			((SELECT cantidad_entregas FROM entregas WHERE numero_empleado = num_empleado and mes = num_mes) * tbsp.adicxentrega) AS adicional_entrega,
			(tbsp.horasxjornada * tbsp.diasxsemana * 4 * tbsp.bonoxhora) AS bono,
			0.00 AS isr,
			0.00 AS vale_despensa,
			0.00 AS total_sueldo
		INTO info_salario
		FROM tb_sueldosxpuesto as tbsp
		WHERE idpuesto = num_puesto;
	END IF;
    
	
	info_salario.total_sueldo = info_salario.sueldo_base + info_salario.adicional_entrega + info_salario.bono;
	if(info_salario.total_sueldo > 10000) then
		info_salario.isr = (info_salario.total_sueldo) * (((Select isr from tb_sueldosxpuesto where idpuesto = num_puesto) + 3) / 100);
	else
		info_salario.isr = (info_salario.total_sueldo) * ((Select isr from tb_sueldosxpuesto where idpuesto = num_puesto) / 100);
	end if;
	
	info_salario.vale_despensa = (info_salario.total_sueldo) * ((Select sueldoenvale from tb_sueldosxpuesto where idpuesto = num_puesto) / 100);
	
	info_salario.total_sueldo = info_salario.total_sueldo - info_salario.isr + info_salario.vale_despensa;
	

    -- Retornar el tipo lleno
    RETURN info_salario;
END;
$$
LANGUAGE plpgsql;
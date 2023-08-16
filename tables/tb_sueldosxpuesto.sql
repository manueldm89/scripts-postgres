CREATE TABLE tb_sueldosxpuesto (
    idpuesto integer,
	horasxjornada integer DEFAULT 0,
	diasxsemana integer DEFAULT 0,
	basexhora NUMERIC(10, 2) DEFAULT 00.00,
	adicxentrega NUMERIC(10, 2) DEFAULT 00.00,
	bonoxhora NUMERIC(10, 2) DEFAULT 00.00,
	isr NUMERIC(10, 2) DEFAULT 00.00,
	sueldoenvale NUMERIC(10, 2) DEFAULT 00.00,
	semanasxmes integer DEFAULT 0
);

insert into tb_sueldosxpuesto(idpuesto, horasxjornada, diasxsemana, basexhora, adicxentrega, bonoxhora, isr, sueldoenvale, semanasxmes)
values(1, 8, 6, 30.00, 5.00, 10.00, 9.00, 4.00, 4),
(2, 8, 6, 30.00, 5.00, 5.00, 9.00, 4.00, 4),
(3, 8, 6, 30.00, 5.00, 0.00, 9.00, 4.00, 4);
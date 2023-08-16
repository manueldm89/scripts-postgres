CREATE TABLE cat_puestos (
    id integer NOT NULL PRIMARY KEY,
    puesto VARCHAR(100)
);

INSERT INTO cat_puestos(id, puesto)
VALUES(1, 'chofer'),
(2, 'cargador'),
(3, 'auxiliar');
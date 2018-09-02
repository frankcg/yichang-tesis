SELECT * FROM `dt_cliente` WHERE nombre LIKE '%vea%'
-- INSERT INTO dt_cliente SET IDPERSONA='',NOMBRE=''
SELECT * FROM `dt_cliente_area`;

SELECT * FROM `dt_proveedor` WHERE IDPERSONA IN ('188','191','137');
SELECT * FROM `dt_proveedor_area`;

SELECT * FROM `dt_persona` WHERE DATE(FECHACREACION) = DATE(NOW())
SELECT * FROM `dt_usuario` WHERE IDPERSONA=0121

SELECT * FROM `dt_area` WHERE nombre LIKE '%fina%'

INSERT INTO dt_cliente_area (IDAREA, IDCLIENTE)
SELECT '13', IDCLIENTE FROM `dt_cliente` WHERE DATE(FECHAMOD) = DATE(NOW())
SELECT * FROM 
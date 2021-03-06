SELECT IDAREA, AREA, DATE(NOW()) AS FECHA, SUM(CANT_PREVISTA) AS CANT_PREVISTA, SUM(CANT_REALIZADA) AS CANT_REALIZADA, SUM(CANT_VERAZ) AS CANT_VERAZ,
SUM(CANT_INCONCLUSAS) AS CANT_INCONCLUSAS, ROUND(IFNULL(SUM(CANT_VERAZ)/SUM(CANT_REALIZADA),0)*100,2) AS INDICADOR_CUMPLIMIENTO,
ROUND(IFNULL(SUM(CANT_REALIZADA)/SUM(CANT_PREVISTA),0)*100,2) AS INDICADOR_EFICACIA
FROM (
-- AUTOEVALUACION
SELECT a.IDAREA, a.AREA, COUNT(*) AS CANT_PREVISTA, SUM(CANT_REALIZADA) AS CANT_REALIZADA, SUM(CANT_VERAZ) AS CANT_VERAZ, (SUM(CANT_REALIZADA)-SUM(CANT_VERAZ)) AS CANT_INCONCLUSAS
FROM(
SELECT DISTINCT c.IDAREA, c.NOMBRE AS 'AREA', a.IDPERSONA, IF(d.CALIFICACION IS NOT NULL,1,0) AS CANT_REALIZADA, IF(d.CALIFICACION>80.4,1,0) AS CANT_VERAZ
FROM dt_asignacion a INNER JOIN `dt_persona` b ON a.IDPERSONA=b.IDPERSONA
INNER JOIN `dt_area` c ON b.IDAREA=c.IDAREA
LEFT JOIN `dt_prueba` d ON a.IDASIGNACION=d.IDASIGNACION AND a.IDEVALUACION=d.IDEVALUACION AND a.IDPERSONA=d.IDEVALUADOR
WHERE a.IDEVALUACION=1 AND a.IDPERSONA<>'0000'
) AS a
GROUP BY a.IDAREA, a.AREA 
UNION ALL
-- EVALUACION GERENTE
SELECT a.IDAREA, a.AREA, COUNT(*) AS CANT_PREVISTA, SUM(CANT_REALIZADA) AS CANT_REALIZADA, SUM(CANT_VERAZ) AS CANT_VERAZ, (SUM(CANT_REALIZADA)-SUM(CANT_VERAZ)) AS CANT_INCONCLUSAS
FROM(
SELECT DISTINCT c.IDAREA, c.NOMBRE AS 'AREA', a.IDPERSONA, IF(d.CALIFICACION IS NOT NULL,1,0) AS CANT_REALIZADA, IF(d.CALIFICACION>80.4,1,0) AS CANT_VERAZ
FROM dt_asignacion a INNER JOIN `dt_persona` b ON a.IDGERENTE=b.IDPERSONA
INNER JOIN `dt_area` c ON b.IDAREA=c.IDAREA
LEFT JOIN `dt_prueba` d ON a.IDASIGNACION=d.IDASIGNACION AND a.IDEVALUACION=d.IDEVALUACION AND a.IDGERENTE=d.IDEVALUADOR
WHERE a.IDEVALUACION=1 AND a.IDGERENTE<>'0000'
) AS a
GROUP BY a.IDAREA, a.AREA
UNION ALL
-- EVALUACION COLEGA
SELECT a.IDAREA, a.AREA, COUNT(*) AS CANT_PREVISTA, SUM(CANT_REALIZADA) AS CANT_REALIZADA, SUM(CANT_VERAZ) AS CANT_VERAZ, (SUM(CANT_REALIZADA)-SUM(CANT_VERAZ)) AS CANT_INCONCLUSAS
FROM(
SELECT DISTINCT c.IDAREA, c.NOMBRE AS 'AREA', a.IDPERSONA, IF(d.CALIFICACION IS NOT NULL,1,0) AS CANT_REALIZADA, IF(d.CALIFICACION>80.4,1,0) AS CANT_VERAZ
FROM dt_asignacion a INNER JOIN `dt_persona` b ON a.IDCOLEGA=b.IDPERSONA
INNER JOIN `dt_area` c ON b.IDAREA=c.IDAREA
LEFT JOIN `dt_prueba` d ON a.IDASIGNACION=d.IDASIGNACION AND a.IDEVALUACION=d.IDEVALUACION AND a.IDCOLEGA=d.IDEVALUADOR
WHERE a.IDEVALUACION=1 AND a.IDCOLEGA<>'0000'
) AS a
GROUP BY a.IDAREA, a.AREA
UNION ALL
-- EVALUACION CLIENTE
SELECT a.IDAREA, a.AREA, COUNT(*) AS CANT_PREVISTA, SUM(CANT_REALIZADA) AS CANT_REALIZADA, SUM(CANT_VERAZ) AS CANT_VERAZ, (SUM(CANT_REALIZADA)-SUM(CANT_VERAZ)) AS CANT_INCONCLUSAS
FROM(
SELECT DISTINCT c.IDAREA, c.NOMBRE AS 'AREA', a.IDPERSONA, IF(d.CALIFICACION IS NOT NULL,1,0) AS CANT_REALIZADA, IF(d.CALIFICACION>80.4,1,0) AS CANT_VERAZ
FROM dt_asignacion a INNER JOIN `dt_persona` b ON a.IDCLIENTE=b.IDPERSONA
INNER JOIN `dt_area` c ON b.IDAREA=c.IDAREA
LEFT JOIN `dt_prueba` d ON a.IDASIGNACION=d.IDASIGNACION AND a.IDEVALUACION=d.IDEVALUACION AND a.IDCLIENTE=d.IDEVALUADOR
WHERE a.IDEVALUACION=1 AND a.IDCLIENTE<>'0000'
) AS a
GROUP BY a.IDAREA, a.AREA
UNION ALL
-- EVALUACION PROVEEDOR
SELECT a.IDAREA, a.AREA, COUNT(*) AS CANT_PREVISTA, SUM(CANT_REALIZADA) AS CANT_REALIZADA, SUM(CANT_VERAZ) AS CANT_VERAZ, (SUM(CANT_REALIZADA)-SUM(CANT_VERAZ)) AS CANT_INCONCLUSAS
FROM(
SELECT DISTINCT c.IDAREA, c.NOMBRE AS 'AREA', a.IDPERSONA, IF(d.CALIFICACION IS NOT NULL,1,0) AS CANT_REALIZADA, IF(d.CALIFICACION>80.4,1,0) AS CANT_VERAZ
FROM dt_asignacion a INNER JOIN `dt_persona` b ON a.IDPROVEEDOR=b.IDPERSONA
INNER JOIN `dt_area` c ON b.IDAREA=c.IDAREA
LEFT JOIN `dt_prueba` d ON a.IDASIGNACION=d.IDASIGNACION AND a.IDEVALUACION=d.IDEVALUACION AND a.IDPROVEEDOR=d.IDEVALUADOR
WHERE a.IDEVALUACION=1 AND a.IDPROVEEDOR<>'0000'
) AS a
GROUP BY a.IDAREA, a.AREA
) AS a 
GROUP BY IDAREA, AREA
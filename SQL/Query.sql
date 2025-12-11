SELECT p.nombre, p.apellido, c.fecha, m.nombre AS medico
FROM cita c
INNER JOIN paciente p ON c.id_paciente = p.id_paciente
INNER JOIN medico m ON c.id_medico = m.id_medico;



SELECT p.nombre, f.total
FROM paciente p
LEFT JOIN factura f ON p.id_paciente = f.id_paciente;


SELECT id_paciente, COUNT(*) AS total_citas
FROM cita
GROUP BY id_paciente
HAVING COUNT(*) > 1;


SELECT nombre, apellido
FROM paciente
WHERE id_paciente IN (
    SELECT id_paciente FROM factura
);



WITH Totales AS (
    SELECT id_paciente, SUM(total) AS gasto_total
    FROM factura
    GROUP BY id_paciente
)
SELECT * FROM Totales WHERE gasto_total > 100000;

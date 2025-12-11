INSERT INTO paciente (nombre, apellido, correo, telefono) VALUES
('Juan', 'Perez', 'juan@mail.com', '3001111111'),
('Ana', 'Lopez', 'ana@mail.com', '3002222222');

INSERT INTO medico (nombre, especialidad) VALUES
('Dr Gomez', 'Cardiología'),
('Dr Ruiz', 'Pediatría');

INSERT INTO cita (id_paciente, id_medico, fecha, motivo) VALUES
(1, 1, '2025-10-01', 'Control general'),
(2, 2, '2025-10-02', 'Dolor de garganta');

INSERT INTO servicio (nombre, precio) VALUES
('Consulta', 50000),
('Rayos X', 100000);

INSERT INTO factura (id_paciente, fecha, total) VALUES
(1, '2025-10-05', 150000);

INSERT INTO factura_detalle (id_factura, id_servicio, cantidad) VALUES
(1, 1, 1),
(1, 2, 1);

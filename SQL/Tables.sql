CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE medico (
    id_medico SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(50)
);

CREATE TABLE cita (
    id_cita SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id_paciente),
    id_medico INT REFERENCES medico(id_medico),
    fecha DATE,
    motivo TEXT
);

CREATE TABLE factura (
    id_factura SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id_paciente),
    fecha DATE,
    total NUMERIC(10,2)
);

CREATE TABLE servicio (
    id_servicio SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    precio NUMERIC(10,2)
);

CREATE TABLE factura_detalle (
    id_detalle SERIAL PRIMARY KEY,
    id_factura INT REFERENCES factura(id_factura),
    id_servicio INT REFERENCES servicio(id_servicio),
    cantidad INT
);

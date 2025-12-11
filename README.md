# Sistema de Gestión Médica – Proyecto Final (SQL + MongoDB + Redis)

# Descripción General

Este proyecto implementa un sistema de información para la gestión de pacientes, citas médicas, facturación y documentación clínica.  
La arquitectura utiliza **tres motores de bases de datos de forma integrada**:

- **PostgreSQL** → información transaccional y estructurada
- **MongoDB** → información documental y flexible
- **Redis** → operaciones rápidas en memoria (colas, sesiones, contadores)

El objetivo es demostrar un ecosistema de datos híbrido capaz de soportar flujos médicos reales y necesidades de rendimiento, integridad y flexibilidad.

---

# Estructura del Repositorio

/sql/
modelo_conceptual.pdf
modelo_relacional.pdf
create_tables.sql
insert_data.sql
queries_avanzadas.sql

/mongodb/
diseño_colecciones.md
inserts.json
consultas_aggregation.md

/redis/
comandos_basicos.txt
operaciones_estructuras.txt
casos_de_uso_redis.md

/documentacion/
arquitectura_de_datos.pdf
conexion_entre_las_3_bases.md

README.md

---

# Base de Datos SQL (PostgreSQL)

### Tablas implementadas

- paciente
- medico
- cita
- factura
- servicio
- factura_detalle

Las tablas están normalizadas hasta **3FN**, con claves primarias, foráneas y restricciones adecuadas.  
Los scripts incluidos permiten crear la base, poblarla e incluir consultas avanzadas mediante `JOIN`, `CTE`, subconsultas y agregaciones.

---

# Base de Datos Documental (MongoDB)

Colecciones implementadas:

- **pacientes_perfil**: datos extendidos del paciente
- **notas_medicas**: documentos clínicos, notas y adjuntos
- **inventario_medicamentos**: estructura flexible con proveedores y stock

MongoDB se usa para almacenar información no estructurada o de alta variabilidad, complementando el modelo rígido SQL.

---

# Base de Datos en Memoria (Redis)

Se implementaron estructuras clave para optimizar operaciones en tiempo real:

- **STRING**: contadores, tokens temporales
- **LIST**: cola de pacientes en sala de espera
- **HASH**: sesiones de médicos
- **SET**: médicos disponibles
- **ZSET**: ranking de servicios más utilizados

Incluye ejemplos, comandos y casos de uso en los archivos correspondientes.

---

#Integración entre las Tres Bases

El sistema combina los tres motores en un flujo coordinado:

1. **SQL** registra pacientes, citas y facturas.
2. **Redis** administra colas, sesiones, contadores y rankings.
3. **MongoDB** almacena documentación clínica variable.

La descripción completa de esta integración está en:  
`/documentacion/conexion_entre_las_3_bases.md`

---

# Caso de Uso Integrado Ejemplo

1. Paciente agenda cita → SQL la almacena.
2. Redis aumenta contador y agrega a la cola.
3. Médico atiende y genera una nota → se guarda en MongoDB.
4. Facturación final → SQL y actualización de ranking en Redis.

---

# Trabajo Colaborativo

Incluye:

- Pull Requests
- Issues
- Revisión de código
- División clara entre módulos SQL, MongoDB y Redis
- Comprensión global del sistema por parte de todos los integrantes

---

# Exposición Final

El repositorio contiene la información necesaria para presentar:

- Elevator Pitch
- Modelado SQL completo
- Diseño de colecciones MongoDB
- Estructuras avanzadas Redis
- Integración entre tecnologías
- Consultas complejas y flujos del sistema

---

# Estado del Proyecto

El proyecto está completo e incluye:

- Modelado conceptual y relacional
- Scripts de creación y carga
- Consultas avanzadas
- Colecciones y agregaciones en MongoDB
- Operaciones y estructuras Redis
- Documentación arquitectónica

---

# Autores

Joseph Sebastian Cristiano Beltran - 3203084
Jostyn Nicolas Cristiano Beltran - 3203084

---

# Cómo Ejecutar el Proyecto

Este proyecto contiene múltiples componentes, organizados por motor de base de datos.  
A continuación se describe cómo utilizar cada uno:

## 1. PostgreSQL (SQL)

1. Crear la base de datos en PostgreSQL.
2. Ejecutar el script `create_tables.sql` para generar el esquema.
3. Ejecutar `insert_data.sql` para poblar la base.
4. Probar las consultas en `queries_avanzadas.sql`.

## 2. MongoDB

1. Crear una base de datos (por ejemplo: `clinica_mongo`).
2. Insertar los documentos de prueba usando `inserts.json`.
3. Ejecutar las agregaciones avanzadas de `consultas_aggregation.md`.

## 3. Redis

1. Iniciar el servidor Redis.
2. Probar los comandos básicos usando `comandos_basicos.txt`.
3. Ejecutar las operaciones de cada estructura usando `operaciones_estructuras.txt`.
4. Revisar los casos de uso reales en `casos_de_uso_redis.md`.

## Integración

Las explicaciones completas sobre cómo se conectan SQL + MongoDB + Redis están en:  
`/documentacion/conexion_entre_las_3_bases.md`

---



docker run -d --name redis-final -p 6379:6379 redis
docker ps
docker exec -it redis-final redis-cli

docker exec -it mongodb bash

mongoimport --db proyecto_final --collection productos --file /inserts.json --jsonArray

docker cp "\Escritorio\Bases\Mongo\inserts.json" mongodb:/inserts.json

http://localhost:5000/api/productos

cd proyecto_final
mkdir api
cd api
npm init -y
npm install express mongoose cors

Conexión entre SQL, MongoDB y Redis en el Sistema Médico

1. Introducción

Este documento explica cómo los tres motores de base de datos interactúan dentro del sistema y cómo fluye la información entre ellos.

2. Flujo de Datos Integrado
1. Registro del paciente (SQL + MongoDB + Redis)

SQL guarda los datos básicos del paciente.

MongoDB almacena perfil extendido: alergias, historiales, dirección.

Redis almacena una sesión temporal del paciente al iniciar sesión.

2. Gestión de citas (SQL + Redis)

SQL registra la cita.

Redis actualiza:

citas_hoy (STRING contador)

Lista de espera: cola_atencion (LIST)

Médico disponible: medicos_disponibles (SET)

3. Consulta médica (MongoDB + Redis)

El médico crea una nota médica → MongoDB (notas_medicas).

Redis guarda temporalmente:

Última actividad del médico (HASH)

TTL de sesión.

4. Facturación (SQL + Redis)

La factura y sus detalles se registran en SQL.

Redis mantiene un ranking de servicios más solicitados:

ZSET ranking_servicios

3. Roles de Cada Motor
   SQL – Núcleo del sistema

Información crítica, estructurada y transaccional.

Relaciones entre entidades.

Historial permanente.

MongoDB – Información extendida

Documentos médicos complejos.

Estructuras dinámicas.

Adjuntos, historiales y datos anidados.

Redis – Memoria y tiempo real

Estados volátiles.

Métricas.

Colas.

Ranking.

Sesiones.

TTL.

4. Ejemplo de Integración Completa

Paciente inicia sesión → Redis crea token con TTL.

Paciente solicita cita → SQL registra la cita.

Paciente agregado a lista de espera → Redis (LIST).

Médico atiende cita → Nota médica almacenada en MongoDB.

Servicio facturado → SQL actualiza factura y detalles.

Se actualiza ranking de servicios → Redis (ZSET).

Sesión expira automáticamente → Redis borra KEY con TTL.

5. Conclusión

Los tres motores funcionan de forma complementaria:

SQL garantiza integridad.

MongoDB ofrece flexibilidad.

Redis aporta velocidad.

El sistema logra cubrir necesidades estructuradas, semiestructuradas y de tiempo real en un mismo entorno.

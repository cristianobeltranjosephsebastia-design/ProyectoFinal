# Diseño MongoDB

## 1. Colección: pacientes_perfil
Almacena información extendida del paciente que NO va en SQL.

Ejemplo de documento:
{
  _id: ObjectId,
  id_paciente_sql: Number,
  direccion: String,
  alergias: [String],
  historiales: [
     {
        fecha: Date,
        descripcion: String
     }
  ]
}

**Motivo de uso en MongoDB:**  
La información del perfil del paciente es flexible, semiestructurada y puede crecer sin alterar el esquema SQL.

---

## 2. Colección: notas_medicas
Notas detalladas que los médicos registran durante una consulta.

{
  _id: ObjectId,
  id_cita_sql: Number,
  notas: String,
  tipo: "consulta" | "seguimiento",
  fecha: Date,
  adjuntos: [
      {
         nombre: String,
         url: String
      }
  ]
}

**Motivo de uso:**  
Las notas médicas pueden incluir listas, archivos, texto largo y estructura variable.

---

## 3. Colección: inventario_medicamentos
Control básico del inventario para emergencias.

{
  _id: ObjectId,
  nombre: String,
  categoria: String,
  cantidad: Number,
  proveedores: [
     {
       nombre: String,
       telefono: String
     }
  ]
}

**Motivo de uso:**  
La estructura del inventario cambia frecuentemente y requiere flexibilidad.

# Diseño de Colecciones – Proyecto Final

## 1. Colección: productos
- **Campos:**
  - `_id`: ObjectId
  - `nombre`: String
  - `categoria`: String
  - `precio`: Number
  - `stock`: Number
- **Justificación:**  
  Esta colección almacena productos con una estructura simple, ideal para un esquema documental flexible. MongoDB permite añadir nuevos campos en el futuro sin modificar esquemas rígidos, y facilita consultas por categoría, stock o precio.

---

## 2. Colección: clientes
- **Campos sugeridos:**
  - `_id`: ObjectId
  - `nombre`: String
  - `correo`: String
  - `preferencias`: Documento anidado
- **Justificación:**  
  MongoDB maneja estructuras semiestructuradas como preferencias del cliente sin necesidad de normalizar en múltiples tablas SQL.

---

## 3. Colección: pedidos
- **Campos sugeridos:**
  - `_id`: ObjectId
  - `cliente_id`: ObjectId
  - `fecha`: Date
  - `items`: Array de `{ producto_id, cantidad }`
  - `total`: Number
- **Justificación:**  
  Un pedido es un documento perfecto para MongoDB: contiene listas de productos y datos anidados que en SQL requerirían varias tablas y JOINs.


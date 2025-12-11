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



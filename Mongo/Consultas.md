// Total alergias por paciente
db.pacientes_perfil.aggregate([
  { $project: { totalAlergias: { $size: "$alergias" }, id_paciente_sql: 1 } },
  { $sort: { totalAlergias: -1 } }
]);

// Total de medicamentos por categoría
db.inventario_medicamentos.aggregate([
  { $group: { _id: "$categoria", total: { $sum: 1 } } },
  { $sort: { total: -1 } }
]);

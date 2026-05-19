

// Crear un nuevo estudiante
CREATE (:Estudiante {
  id: 'E001',
  nombre: 'Angel',
  carrera: 'Ingenieria en Sistemas',
  semestre: 4
});

// Crear una nueva inscripción
MATCH (e:Estudiante {id: 'E001'})
MATCH (m:Materia {id: 'M001'})
CREATE (e)-[:INSCRITO_EN {calificacion: 95}]->(m);


// Consultar estudiantes
MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

// Consultar materias
MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;

// Consultar relaciones de inscripción
MATCH (e:Estudiante)-[r:INSCRITO_EN]->(m:Materia)
RETURN e.nombre AS estudiante, m.nombre AS materia, r.calificacion AS calificacion;

// Consultar relaciones de amistad
MATCH (e1:Estudiante)-[:AMIGO_DE]->(e2:Estudiante)
RETURN e1.nombre AS estudiante, e2.nombre AS amigo;


// Modificar semestre
MATCH (e:Estudiante {id: 'E001'})
SET e.semestre = 5
RETURN e;

// Modificar calificación
MATCH (e:Estudiante {id: 'E001'})-[r:INSCRITO_EN]->(m:Materia {id: 'M001'})
SET r.calificacion = 100
RETURN e.nombre AS estudiante, m.nombre AS materia, r.calificacion AS nueva_calificacion;



// Eliminar una relación
MATCH (e:Estudiante {id: 'E001'})-[r:INSCRITO_EN]->(m:Materia {id: 'M001'})
DELETE r;

// Eliminar un nodo
MATCH (e:Estudiante {id: 'E001'})
DETACH DELETE e;
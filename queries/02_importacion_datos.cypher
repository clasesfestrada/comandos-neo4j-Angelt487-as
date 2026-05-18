MATCH (n:Estudiante) RETURN n LIMIT 25;

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/estudiantes.csv'
AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});


----------------------------------------------------------------------------------------------------------------------------------


MATCH (n:Materia) RETURN n LIMIT 25;

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/materias.csv'
AS row

CREATE (:Materia {
  id: row.id,
  nombre: row.nombre,
  area: toInteger(row.area)
});





----------------------------------------------------------------------------------------------------------------------------------


MATCH (n:Profesor) RETURN n LIMIT 25;

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/profesores.csv'
AS row

CREATE (:Profesor {
  id: row.id,
  nombre: row.nombre,
  departamento: toInteger(row.departamento)
});





----------------------------------------------------------------------------------------------------------------------------------


MATCH (n:inscripcion) RETURN n LIMIT 25;

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/inscripciones.csv'
AS row

CREATE (:inscripcion {
  estudiante_id: row.estudiante_id,
  materia_id: toInteger(row.materia_id),
  calificacion: row.calificacion
});





----------------------------------------------------------------------------------------------------------------------------------


MATCH (n:amistades) RETURN n LIMIT 25;

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/amistades.csv'
AS row

CREATE (:amistades {
  estudiante_origen: row.estudiante_origen,
  estudiante_destino: toInteger(row.estudiante_destino)
});





----------------------------------------------------------------------------------------------------------------------------------


MATCH (n:imparticiones) RETURN n LIMIT 25;

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/imparticiones.csv'
AS row


CREATE (:imparticiones {
  profesor_id: row.profesor_id,
  materia_id: toInteger(row.materia_id)
});

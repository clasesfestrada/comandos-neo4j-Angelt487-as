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



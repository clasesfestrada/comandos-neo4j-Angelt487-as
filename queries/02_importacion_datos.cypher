LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/estudiantes.csv'
AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/materias.csv'
AS row
MERGE (m:Materia {id: row.id})
SET m.nombre = row.nombre,
    m.area = row.area;


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-Angelt487-as/refs/heads/main/data/profesores.csv'
AS row
MERGE (p:Profesor {id: row.id})
SET p.nombre = row.nombre,
    p.departamento = row.departamento;


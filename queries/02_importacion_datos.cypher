
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/estudiantes.csv'
AS row

MERGE (e:Estudiante {id: row.id})
SET e.nombre = row.nombre,
    e.carrera = row.carrera,
    e.semestre = toInteger(row.semestre);

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/materias.csv'
AS row

MERGE (m:Materia {id: row.id})
SET m.nombre = row.nombre,
    m.area = row.area;

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/profesores.csv'
AS row

MERGE (p:Profesor {id: row.id})
SET p.nombre = row.nombre,
    p.departamento = row.departamento;



LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/inscripciones.csv'
AS row

MATCH (e:Estudiante {id: row.estudiante_id})
MATCH (m:Materia {id: row.materia_id})

MERGE (e)-[r:INSCRITO_EN]->(m)
SET r.calificacion = toInteger(row.calificacion);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/amistades.csv'
AS row

MATCH (e1:Estudiante {id: row.estudiante1_id})
MATCH (e2:Estudiante {id: row.estudiante2_id})

MERGE (e1)-[:AMIGO_DE]->(e2);



LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/imparticiones.csv'
AS row

MATCH (p:Profesor {id: row.profesor_id})
MATCH (m:Materia {id: row.materia_id})

MERGE (p)-[:IMPARTE]->(m);
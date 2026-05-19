

MATCH (a:Estudiante {nombre: 'Ana'})-[:AMIGO_DE]->(amigo:Estudiante)
RETURN amigo.nombre AS amigos_directos;




MATCH (a:Estudiante {nombre: 'Ana'})-[:AMIGO_DE]->(amigo:Estudiante)
MATCH (amigo)-[:INSCRITO_EN]->(m:Materia)
RETURN amigo.nombre AS amigo, m.nombre AS materia;



MATCH (a:Estudiante {nombre: 'Ana'})-[:AMIGO_DE]->(amigo:Estudiante)
MATCH (amigo)-[:INSCRITO_EN]->(m:Materia)
MATCH (p:Profesor)-[:IMPARTE]->(m)
RETURN amigo.nombre AS amigo,
       m.nombre AS materia,
       p.nombre AS profesor;



MATCH (a:Estudiante {nombre: 'Ana'})-[:AMIGO_DE*1..2]->(conexion:Estudiante)
RETURN DISTINCT conexion.nombre AS conexiones;

MATCH (e:Estudiante)-[r:INSCRITO_EN]->(m:Materia)
WHERE r.calificacion >= 90
RETURN e.nombre AS estudiante,
       m.nombre AS materia,
       r.calificacion AS calificacion;
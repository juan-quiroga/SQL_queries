# Mostrar el nombre de todos los jugadores ordenados alfabéticamente.

select nombre from jugadores order by nombre asc;

# Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras, ordenados por nombre alfabéticamente

select * from jugadores;
select nombre from jugadores where peso>200 and posicion = 'c' order by nombre asc;

# Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.

select * from equipos;
select nombre from equipos where ciudad like 'c%' order by nombre asc;

# Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.

select nombre, nombre_equipo from jugadores order by nombre_equipo asc;

# Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.

select * from estadisticas;
select codigo from jugadores where nombre like 'pau gasol';
select jugador from estadisticas  ;

# Mostrar los puntos por partido del jugador ‘Pau Gasol’.

select e.puntos_por_partido as puntos,  j.nombre as nombre
	from jugadores j, estadisticas e
    where e.jugador = j.codigo and j.nombre like 'pau gasol';

# Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′

select e.puntos_por_partido as puntos
	from jugadores j, estadisticas e
    where e.jugador = j.codigo and j.nombre like 'pau gasol' and temporada like '04/05';
	
    #otra forma
select puntos_por_partido as puntos
	from estadisticas
    inner join jugadores
    on estadisticas.jugador = jugadores.codigo
    and jugadores.Nombre like 'pau gasol' and estadisticas.temporada like '04/05';

# Mostrar el número de puntos de cada jugador en toda su carrera.

select * from estadisticas;

select sum(e.puntos_por_partido) as puntos_totales, j.Nombre
	from estadisticas e, jugadores j
    where e.jugador=j.codigo
    group by j.nombre;

# Mostrar el número de jugadores de cada equipo.

select * from equipos;
select * from jugadores;
select count(*), j.Nombre_equipo 
	from equipos e, jugadores j
    where j.Nombre_equipo=e.Nombre
    group by nombre_equipo;

# Mostrar el jugador que más puntos ha realizado en toda su carrera.

select sum(e.puntos_por_partido) as puntos_totales, j.Nombre
	from estadisticas e, jugadores j
    where e.jugador=j.codigo
    group by j.nombre
    order by sum(e.Puntos_por_partido) desc
    limit 1;

# Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.

select nombre, altura from jugadores order by altura desc limit 1;

select jugadores.Nombre, jugadores.nombre_equipo as equipo, equipos.Conferencia, equipos.Division   
	from equipos 
    inner join jugadores
    on jugadores.Nombre_equipo = equipos.Nombre
    order by jugadores.Altura desc limit 1;

# Mostrar la media de puntos en partidos de los equipos de la división Pacific.

select avg(estadisticas.Puntos_por_partido)
	from equipos 
    inner join estadisticas
    on estadisticas.jugador=jugadores.codigo
    where equipos.division="pacific";
    
# Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor diferencia de puntos.

select * from partidos;
select max(abs(puntos_visitante - puntos_local)) from partidos;
select abs(puntos_visitante - puntos_local) from partidos  order by abs(puntos_visitante - puntos_local) desc limit 1;

# Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante. 
select puntos_local, puntos_visitante, equipo_local as equipo from partidos group by equipo_local ;


    


	
    
    

    
    

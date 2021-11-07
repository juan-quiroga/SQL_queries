# Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select * from oficina;
select codigo_oficina,ciudad,telefono from oficina where pais = "ESPAña";

# Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre,apellido1,apellido2,email from empleado where codigo_jefe=7;

# Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select nombre, puesto from empleado where puesto NOT LIKE 'representante ventas';

# Devuelve un listado con los distintos estados por los que puede pasar un pedido.

select distinct estado from pedido;

# Devuelve un listado con el código de cliente de aquellos clientes que realizaron
# algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de
# cliente que aparezcan repetidos. Resuelva la consulta utilizando la función YEAR de MySQL.

select * from cliente;
select * from pago;


select cliente.codigo_cliente, fecha_pago
from cliente, pago
where YEAR(pago.fecha_pago)='2008';

# Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

select * from pedido;
select pedido.codigo_pedido, pedido.estado, pago.fecha_pago 
	from pedido , pago 
	where pedido.codigo_cliente = pago.codigo_cliente
    and estado ="rechazado" 
    and YEAR(pago.fecha_pago)="2009";

#CONSULTAS MULTITABLA

# Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

select nombre_cliente, empleado.nombre as nombre_empleado, empleado.apellido1 as ap_empleado
	from cliente inner join empleado
    on codigo_empleado_rep_ventas = codigo_empleado;
    
# Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus 
# representantes junto con la ciudad de la oficina a la que pertenece el representante.

select nombre_cliente, empleado.nombre as nombre_empleado, oficina.ciudad
	from cliente inner join empleado on  cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
				 inner join oficina on empleado.codigo_oficina = oficina.codigo_oficina;
                 
                 
# Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

select * from pedido;
select c.nombre_cliente 
	from cliente as c inner join pedido as p on c.codigo_cliente = p.codigo_cliente
	where p.estado LIKE '%pendiente%'  group by c.nombre_cliente;
    
                 
	
    
    
    





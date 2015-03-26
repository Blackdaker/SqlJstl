<%-- 
    Document   : index
    Created on : 25-mar-2015, 22:24:17
    Author     : Miguel
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conexion JSTL sql</title> 
    </head>
    <body>
        <h1>Conexion JSTL con Base de datos Tienda Electrodomesticos</h1>
        <sql:setDataSource  driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/tiendaProducto" user="root" password="mysql" var="con"/>
        <sql:query dataSource="${con}" var="resultado">
            select * from producto; 
        </sql:query> 
            
            
            <ul>
            <c:forEach var="fila" items="${resultado.rows}">
                <li>
                    ID: <c:out value="${fila.id_producto}" /> <br>
                    NOMBRE: <c:out value="${fila.nombre}" /> <br>
                    MARCA: <c:out value="${fila.marca}" /> <br>
                    PRECIO: <c:out value="${fila.precio}" /> <br>
                    CATEGORIA: <c:out value="${fila.categoria}" /> <br>
                    CANTIDAD: <c:out value="${fila.cantidad}" /> <br>
                    <hr>
                </li>
            </c:forEach>
            </ul>
            
            <%--NOTA: Debido a que todas las operaciones estan a la vez, primero ejecutar
            un insertar, luego un modificar y finalmente un eliminar--%>
            
            <%--Operacion para insertar un conjunto de datos en la base de datos--%>
            <sql:update dataSource="${con}" var="resultado">
               insert into producto 
               values ('3', 'Parlantes', 'Sony', '10000', 'Equipos de computo', '8')
            </sql:update>
               
               <%--Operacion para actualizar un archivo de la base de datos, en este caso actualizamos solo el nombre--%>  
            <c:set var="nom" value="Parlantes"></c:set>   
              <sql:update dataSource="${con}" var="resultado">
               update producto set nombre = 'Auriculares' where nombre = ?;
               <sql:param value="${nom}"></sql:param> 
            </sql:update>
            
             <%--Operacion para eliminar un campo de la base de datos, se elimina el archivo desde el ID--%>  
            <c:set var="id" value="3"></c:set>
            <sql:update dataSource="${con}" var="resultado">
                delete from producto where id_producto = ?;
            <sql:param value="${id}"></sql:param>
            </sql:update>
            
</body>
</html>

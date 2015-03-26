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
       
    </body>
</html>

<%-- 
    Document   : index
    Created on : 14 oct. 2020, 18:26:25
    Author     : dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            
        </header>
        
        <main>
            <form name="form1" action="controlador.jsp">
                <label>Usuario: </label>
                <input type="email" name="email" placeholder="email@gmail.com" required>
                <br>
                <label>Contraseña </label>
                <input type="text" name="password" required>
                <input type="submit" name="submLog" value="Aceptar">
            </form>
            
            <form name="form2" action="controlador.jsp">
                <input type="submit" name="registButton" value="Registrarse">
            </form>
            <form name="form3" action="controlador.jsp">
                <input type="submit" name="recoverPass" value="Recuperar contraseña">
            </form>
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>

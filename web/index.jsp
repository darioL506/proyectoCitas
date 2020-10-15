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
        <link rel="stylesheet" type="text/css" href="css/rejillas.css">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            
        </header>
        
        <main class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="row">
                    <div class="col-12">
                        <form name="form1" action="controlador.jsp">
                            <label class="row">
                                <label class="col-12"></label>
                                <label class="col-1"></label>
                                <label class="col-2">Usuario:</label>
                                <input class="col-8" type="email" name="email" placeholder="email@gmail.com" required>         
                                <label class ="col-1"></label>
                                <label class="col-12"></label>
                            </label>
                            <label class="row">
                                <label class="col-12"></label>
                                <label class="col-1"></label>
                                <label class="col-2">Contraseña </label>
                                <input class="col-8" type="text" name="password" required>
                                <label class="col-1"></label>
                                <label class="col-12"></label>
                            </label>
                            <label class="row">
                                <label class="col-5"></label>
                                <input class="col-2" type="submit" name="submLog" value="Aceptar"> 
                                <label class="col-5"></label>
                            </label>                                                      
                        </form>
                    </div>                    
                    <form class="col-6" name="form2" action="controlador.jsp">
                    <input type="submit" name="registButton" value="Registrarse">
                    </form>
                    <form class="col-6" name="form3" action="controlador.jsp">
                        <input type="submit" name="recoverPass" value="Recuperar contraseña">
                    </form>
                </div>                
            </div>
            <div class="col-3"></div>                                    
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>

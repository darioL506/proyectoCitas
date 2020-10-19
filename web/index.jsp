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
        <link rel="stylesheet" type="text/css" href="/css/header.css">
        <script src="https://kit.fontawesome.com/3cf8885432.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <jsp:include page="Comun/header.jsp"/>
        </header>
        
        <main class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="row">
                    <div class="col-12">
                        <form name="form1" action="controlador.jsp">
                            <div class="row">                                
                                <div class="col-12"></div>
                                <div class="col-1"></div>
                                <div class="col-2">Usuario:</div>
                                <input class="col-8" type="email" name="emailLogin" placeholder="email@gmail.com" required>         
                                <div class ="col-1"></div>
                                <div class="col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-12"></div>
                                <div class="col-1"></div>
                                <div class="col-2">Contraseña </div>
                                <input class="col-8" type="password" name="passwordLogin" required>
                                <div class="col-1"></div>
                                <div class="col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-5"></div>
                                <input class="col-2" type="submit" name="submLog" value="Aceptar"> 
                                <div class="col-5"></div>
                            </div>                                                      
                        </form>
                    </div>                    
                    <form class="col-6 row" style="text-align: center" name="form2" action="controlador.jsp">
                        <div class="col-12">¿No tienes cuenta?</div>
                        <div class="col-12"><input type="submit" name="registButton" value="Registrarse"></div>
                    </form>
                    <form class="col-6 row" style="text-align: center" name="form3" action="controlador.jsp">
                        <div class="col-12">¿Te has olvidado de tu contraseña?</div>
                        <div class="col-12"><input type="submit" name="recoverPass" value="Recuperar contraseña"></div>
                    </form>
                </div>                
            </div>
            <div class="col-3"></div>                                    
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>

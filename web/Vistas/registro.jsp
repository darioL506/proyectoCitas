<%-- 
    Document   : registro
    Created on : 18 oct. 2020, 18:40:57
    Author     : dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/rejillas.css">
        <script src="https://kit.fontawesome.com/3cf8885432.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <jsp:include page="../Comun/header.jsp"/>
        </header>
        
        <main class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="row">
                    <div class="col-12">
                        <form name="form1" action="../controlador.jsp">
                            <div class="row">
                                <div class="col-12"></div>
                                <div class="col-1"></div>
                                <label class="col-2">Email </label>
                                <div class="col-1"></div>
                                <input class="col-7" type="email" name="emaiRegist" placeholder="email@gmail.com" required>         
                                <div class ="col-1"></div>
                                <div class="col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-12"></div>
                                <div class="col-1"></div>
                                <label class="col-2">Contraseña </label>
                                <div class="col-1"></div>
                                <input class="col-7" type="password" name="passwordRegist" required>
                                <div class="col-1"></div>
                                <div class="col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-12"></div>
                                <div class="col-1"></div>
                                <label class="col-2">Nombre </label>
                                <div class="col-1"></div>
                                <input class="col-7" type="text" name="nombreRegist" placeholder="Nombre" required>
                                <div class="col-1"></div>
                                <div class="col-12"></div>
                            </div>
                             <div class="row">
                                <div class="col-12"></div>
                                <div class="col-1"></div>
                                <label class="col-2">Apellido </label>
                                <div class="col-1"></div>
                                <input class="col-7" type="text" name="apellRegist" placeholder="Apellido" required>
                                <div class="col-1"></div>
                                <div class="col-12"></div>
                            </div>   
                            <div class="row">
                                <div class="col-12"></div>
                                <div class="col-1"></div>
                                <label class="col-2">Genero: </label>
                                <div class="col-2">
                                    <select name="generoRegist" required>
                                        <option value="m">Hombre</option>
                                        <option value="f">Mujer</option>
                                    </select>                             
                                </div>
                                <div class="col-1"></div>
                                <label class="col-2">Edad</label>
                                <input class="col-2" type="number" name="edadRegist" placeholder="18" min="18" max="120" required>                                
                                <div class="col-12"></div>
                            </div>  
                            <div class="row">
                                <div class="col-5"></div>
                                <input class="col-2" type="submit" name="submRegist" value="Aceptar"> 
                                <div class="col-5"></div>
                            </div>                                                      
                        </form>
                    </div>                                        
                </div>                
            </div>
            <div class="col-3"></div>  
        </main>
    </body>
</html>

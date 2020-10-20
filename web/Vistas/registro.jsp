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
        <jsp:include page="../Comun/estilos.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            
        </header>
        
        <main class="row">
            <div class="col-m-1 col-2"></div>
            <div class="col-m-10 col-8">
                <div class="row">
                    <div class="col-m-12 col-12">
                        <form name="form1" action="../controlador.jsp">
                            <div class="row">
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <label class="col-m-3 col-3">Email </label>                                
                                <input class="col-m-7 col-7" type="email" name="emaiRegist" placeholder="email@gmail.com" required>         
                                <div class ="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <label class="col-m-4 col-4">Contraseña </label>                                
                                <input class="col-m-6 col-6" type="password" name="passwordRegist" required>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                            </div>
                            <div class="row">
                                <div class="col-m-12 col-12"></div> 
                                <div class="col-m-1 col-1"></div>
                                <label class="col-m-3 col-3">Nombre </label>                                
                                <input class="col-m-7 col-7" type="text" name="nombreRegist" placeholder="Nombre" required>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                            </div>
                             <div class="row">
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <label class="col-m-3 col-3">Apellido </label>                                
                                <input class="col-m-7 col-7" type="text" name="apellRegist" placeholder="Apellido" required>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                            </div>   
                            <div class="row">
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <label class="col-m-2 col-2">Genero: </label>
                                <div class="col-m-2 col-2">
                                    <select name="generoRegist" required>
                                        <option value="m">Hombre</option>
                                        <option value="f">Mujer</option>
                                    </select>                             
                                </div>
                                <div class="col-m-1 col-1"></div>
                                <label class="col-m-2 col-2">Edad</label>
                                <input class="col-m-2 col-2" type="number" name="edadRegist" placeholder="18" min="18" max="120" required>                                
                                <div class="col-m-12 col-12"></div>
                            </div>  
                            <div class="row">
                                <div class="col-m-5 col-5"></div>
                                <div class="col-m-2 col-2">
                                    <input type="submit" name="submRegist" value="Aceptar"> 
                                </div>
                                <div class="col-m-5 col-5"></div>
                            </div>                                                      
                        </form>
                    </div>                                        
                </div>                
            </div>
            <div class="col-m-1 col-2"></div>  
        </main>
    </body>
</html>

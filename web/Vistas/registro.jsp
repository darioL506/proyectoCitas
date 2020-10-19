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
                        <form name="form1" action="../controlador.jsp">
                            <label class="row">
                                <label class="col-12"></label>
                                <label class="col-1"></label>
                                <label class="col-2">Email </label>
                                <label class="col-1"></label>
                                <input class="col-7" type="email" name="emaiRegist" placeholder="email@gmail.com" required>         
                                <label class ="col-1"></label>
                                <label class="col-12"></label>
                            </label>
                            <label class="row">
                                <label class="col-12"></label>
                                <label class="col-1"></label>
                                <label class="col-2">Contraseña </label>
                                <label class="col-1"></label>
                                <input class="col-7" type="password" name="passwordRegist" required>
                                <label class="col-1"></label>
                                <label class="col-12"></label>
                            </label>
                            <label class="row">
                                <label class="col-12"></label>
                                <label class="col-1"></label>
                                <label class="col-2">Nombre </label>
                                <label class="col-1"></label>
                                <input class="col-7" type="text" name="nombreRegist" placeholder="Nombre" required>
                                <label class="col-1"></label>
                                <label class="col-12"></label>
                            </label>
                             <label class="row">
                                <label class="col-12"></label>
                                <label class="col-1"></label>
                                <label class="col-2">Apellido </label>
                                <label class="col-1"></label>
                                <input class="col-7" type="text" name="apellRegist" placeholder="Apellido" required>
                                <label class="col-1"></label>
                                <label class="col-12"></label>
                            </label>   
                            <label class="row">
                                <label class="col-12"></label>
                                <label class="col-1"></label>
                                <label class="col-2">Genero: </label>
                                <label class="col-2">
                                    <select name="generoRegist"required>
                                        <option value="m">Hombre</option>
                                        <option value="f">Mujer</option>
                                    </select>                             
                                </label>
                                <label class="col-1"></label>
                                <label class="col-2">Edad</label>
                                <input class="col-2" type="number" name="edadRegist" minlength="2" placeholder="18" required>                                
                                <label class="col-12"></label>
                            </label>  
                            <label class="row">
                                <label class="col-5"></label>
                                <input class="col-2" type="submit" name="submRegist" value="Aceptar"> 
                                <label class="col-5"></label>
                            </label>                                                      
                        </form>
                    </div>                                        
                </div>                
            </div>
            <div class="col-3"></div>  
        </main>
    </body>
</html>

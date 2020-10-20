<%-- 
    Document   : preferencias
    Created on : 19-oct-2020, 9:48:15
    Author     : dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/rejillas.css">
        <link rel="stylesheet" type="text/css" href="../css/header.css">
        <script src="https://kit.fontawesome.com/3cf8885432.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <jsp:include page="../Comun/header.jsp"/>
        </header>
        
        <main class="row">
            <div class="col-m-1 col-2"></div>
            <div class="col-m-10 col-8">
                <div class="col-m-12 col-12"></div>
                <div class="row">
                    <form name="form1" action="../controlador.jsp">
                        <div class="row">
                            <div class="col-m-12 col-12"></div>
                            <div class="col-m-1 col-1"></div>
                            <label class="col-m-4 col-4">¿Buscas una relación seria? </label>
                            <div class="col-m-1 col-1"></div>
                            <div class="col-m-5 col-5">
                                <select name="relPref" required>
                                    <option value="s">Sí</option>
                                    <option value="n">No</option>
                                </select>                             
                            </div>
                            <div class ="col-m-1 col-1"></div>
                            <div class="col-m-12 col-12"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-12 col-12"></div>
                            <div class="col-m-1 col-1"></div>
                            <label class="col-m-4 col-4">¿Cuanto te interesan los deportes? </label>
                            <div class="col-m-1 col-1"></div>
                            <input class="col-m-5 col-5" type="number" name="depPref" placeholder="Entre 0 y 100" min="0" max="100" required>         
                            <div class ="col-m-1 col-1"></div>
                            <div class="col-m-1 col-12"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-12 col-12"></div>
                            <div class="col-m-1 col-1"></div>
                            <label class="col-m-4 col-4">¿Cuanto te interesa el arte? </label>
                            <div class="col-m-1 col-1"></div>
                            <input class="col-m-5 col-5" type="number" name="artPref" placeholder="Entre 0 y 100" min="0" max="100" required>         
                            <div class ="col-m-1 col-1"></div>
                            <div class="col-m-12 col-12"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-12 col-12"></div>
                            <div class="col-m-1 col-1"></div>
                            <label class="col-m-4 col-4">¿Cuanto te interesa la politica? </label>
                            <div class="col-m-1 col-1"></div>
                            <input class="col-m-5 col-5" type="number" name="politPref" placeholder="Entre 0 y 100" min="0" max="100" required>         
                            <div class ="col-m-1 col-1"></div>
                            <div class="col-m-12 col-12"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-12 col-12"></div>
                            <div class="col-m-1 col-1"></div>
                            <label class="col-m-4 col-4">¿Quieres tener hijos? </label>
                            <div class="col-m-1 col-1"></div>
                            <div class="col-m-5 col-5">
                                <select name="hijosPref" required>
                                    <option value="s">Sí</option>
                                    <option value="n">No</option>
                                </select>                             
                            </div>
                            <div class ="col-m-1 col-1"></div>
                            <div class="col-m-12 col-12"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-12 col-12"></div>
                            <div class="col-m-1 col-1"></div>
                            <label class="col-m-4 col-4">¿Que buscas? </label>
                            <div class="col-m-1 col-1"></div>
                            <div class="col-m-5 col-5">
                                <select name="interesPref" required>
                                    <option value="m">Hombres</option>
                                    <option value="f">Mujeres</option>
                                    <option value="b">Ambos</option>
                                </select>                             
                            </div>
                            <div class ="col-m-1 col-1"></div>
                            <div class="col-m-12 col-12"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-5 col-5"></div>
                            <input class="col-m-2 col-2" type="submit" name="submPref" value="Aceptar"> 
                            <div class="col-m-5 col-5"></div>
                        </div> 
                    </form>
                </div>
            </div>
            <div class="col-m-1 col-2"></div>                                    
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 14 oct. 2020, 18:26:25
    Author     : dario
--%>

<%@page import="java.util.Random"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Paths"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Comun/estilos.jsp"/>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <header>
            <jsp:include page="Comun/header.jsp"/>            
        </header>               
        
        <main class="row">
            <div class="col-m-1 col-2"></div>
            <div class="col-m-10 col-8">
                <div class="row">
                    <div class="col-m-12 col-12">
                        <form name="form1" action="controlador.jsp">
                            <div class="row">                                
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-3 col-3">Usuario:</div>
                                <input class="col-m-7 col-7" id="email" type="email" name="emailLogin" placeholder="email@gmail.com" required>         
                                <div class ="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                                <span class="errorMail" aria-live="polite"></span>
                            </div>
                            <div class="row">
                                <div class="col-m-12 col-12"></div>
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-4 col-4" id="paswword">Contraseña </div>
                                <input class="col-m-6 col-6" type="password" name="passwordLogin" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" minlength="8" required >
                                <div class="col-m-1 col-1"></div>
                                <div class="col-m-12 col-12"></div>
                                <span class="errorPass" aria-live="polite"></span>
                            </div>
                            <div class="row">
                                <div class="col-m-5 col-5"></div>
                                <div class="col-m-2 col-2">
                                    <input type="submit" name="submLog" value="Aceptar"> 
                                </div>
                                <div class="col-m-5 col-5"></div>                                
                            </div>
                            <%
                            Random rand = new Random();
                            int a = rand.nextInt((20-1)+1)+1;

                            session.setAttribute("isCaptcha", a);
                            if(a>=10) {
                            %>
                            <div class="row">
                                <div class="col-4 hidden"></div>
                                <div class="g-recaptcha col-m-12 col-4" data-sitekey="6LdGktoZAAAAAHw4sPfKhwzINgAI7ctCVw7x2_Pm"></div>
                                <div class="col-4 hidden"></div>
                            </div>
                            <%}%>
                        </form>                        
                    </div>                     
                    <ul class="col-m-12 col-12 row horizontal-menu">
                        <div class="col-2"></div>
                        <li class="col-m-12 col-4"><a href="Vistas/registro.jsp">¿No tienes cuenta?</a></li>                        
                    
                    
                        <li class="col-m-12 col-4"><a href="">¿Te has olvidado de tu contraseña?</a></li>                        
                        <div class="col-2"></div>
                    </ul>
                </div>                
            </div>
            <div class="col-m-1 col-2"></div>                                    
        </main>
        
        <footer>
            <jsp:include page="Comun/footer.jsp"/>    
        </footer>
    </body>
</html>

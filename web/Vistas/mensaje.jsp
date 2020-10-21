<%-- 
    Document   : mensaje
    Created on : 20-oct-2020, 13:55:44
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
            <jsp:include page="../Comun/header.jsp"/>
        </header>
        
        <main class="row">
            <div class="col-m-1 col-2"></div>
            <div class="col-m-10 col-8">
                <form name="form1" enctype="multipart/form-data" method="POST" action="../subeArchivo.jsp">
                    <div class="col-3">Asunto</div>                    
                    <input class="col-9" type="text" name="asunto" required>
                    <div class="col-12"></div>
                    <div class="col-3">Destinatario</div>                    
                    <input class="col-9" type="text" name="receptor" required>
                    <div class="col-12"></div>
                    <div class="col-3">Subir fuchero</div>
                    <input class="col-6" type="file" name="fichero"/>
                    <div class="col-3"></div>
                    <div class="col-12"></div>                    
                    <textarea class="col-12" name="cuerpo" rows="4" cols="50" placeholder="Tu mensaje va aquí" required></textarea>
                    <div class="col-12"></div>
                    <div class="col-12"><input type="submit" name="sendMail" value="Enviar"></div>
                </form>
            </div>
            <div class="col-m-1 col-2"></div>
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>

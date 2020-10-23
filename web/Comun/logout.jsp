<%-- 
    Document   : logout
    Created on : 23 oct. 2020, 20:09:04
    Author     : dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    

    <body>
        <%
        // for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
         if (session.getAttribute("emailAct")!=null) {                    
           Integer contador = (Integer) application.getAttribute("numerodeUsuarios");
           contador = contador-1;
           application.setAttribute("numerodeUsuarios", contador);
           session.invalidate(); 
           response.sendRedirect(request.getContextPath()+"/index.jsp");
         }
         
        %>
    </body>
</html>

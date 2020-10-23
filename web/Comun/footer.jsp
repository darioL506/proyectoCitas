



<%@page import="java.util.Enumeration"%>
<div class="header footer">        
    <%
    Integer contador = (Integer) application.getAttribute("numerodeUsuarios");
    if(contador == null) {
        contador = 0;
    }
    application.setAttribute("numerodeUsuarios", contador);
    %>    
    <div class="headerNav row">
        <div class="col-4 col-m-4"></div>
        <div class="col-4 col-m-4"></div>
        <div class="col-4 col-m-4">
            Usuarios conectados <%=application.getAttribute("numerodeUsuarios")%>

        </div>
    </div>         
   
</div>



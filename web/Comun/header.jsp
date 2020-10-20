


<div class="header">
    <a href="#default" class="logo">CompanyLogo</a>   
    <% if(request.getServletPath().equals("/index.jsp")){
    %><a class="active" href="index.jsp">Home</a><%
    } else {
        %><a href="../index.jsp">Home</a><%   
    }%>
    <div class="header-right">
        <%if(session.getAttribute("emailAct")!=null) {%>
        <div class="headerNav">
            <div class="dropdown">    

                <button class="dropbtn">
                    <label style="padding: 15px"><%=session.getAttribute("nombreAct")%></label><i class="fa fa-caret-down" aria-hidden="true"></i>
                </button>    

                <div class="dropdown-content">
                    <a href="">Editar perfil</a>
                    <a href="/proyectoCitas/Vistas/preferencias.jsp">Editar preferencias</a>
                    <a href="">Ver amigos</a>                                
                    <a href="#">Cerrar sesion</a>
                </div>
            </div>
        </div> 
        <%}%>
    </div>
</div>



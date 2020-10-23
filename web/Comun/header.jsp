


<div class="header">
    <a href="${pageContext.request.contextPath}/index.jsp" class="logo">CompanyLogo</a>   
    <% if(request.getServletPath().equals("/Vistas/inicio.jsp")){
    %><a class="active" href="${pageContext.request.contextPath}/Vistas/inicio.jsp">Home</a><%
    } else {
        %><a href="${pageContext.request.contextPath}/Vistas/inicio.jsp">Home</a><%   
    }%>
    <div class="header-right">
        <%if(session.getAttribute("emailAct")!=null) {%>
        <div class="headerNav">
            <div class="dropdown-menu">    

                <button class="dropbtn">
                    <label style="padding: 15px"><%=session.getAttribute("nombreAct")%></label><i class="fa fa-caret-down" aria-hidden="true"></i>
                </button>    

                <div class="dropdown-menu-content row">
                    <a class="col-12" href="${pageContext.request.contextPath}/Vistas/inicio.jsp">Perfil</a>
                    <a class="col-12" href="${pageContext.request.contextPath}/Vistas/mensaje.jsp">Nuevo mensaje</a>
                    <a class="col-12" href="">Ver amigos</a>
                    <a class="col-12" href="#">Cerrar sesion</a>
                </div>
            </div>
        </div> 
        <%}%>
    </div>
</div>



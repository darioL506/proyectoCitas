<%-- 
    Document   : controlador
    Created on : 14-oct-2020, 12:29:24
    Author     : dario
--%>

<%@page import="Modelo.Preferencias"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Página de login
            if (request.getParameter("submLog")!=null) {
                ConexionEstatica.nueva();
                
                String email = request.getParameter("emailLogin");
                                
                Usuario aux = ConexionEstatica.login(email,request.getParameter("passwordLogin"));
                
                if(aux!=null) {                   
                    
                    session.setAttribute("emailAct", email);
                    
                    Boolean hasAdmin = ConexionEstatica.getRol(request.getParameter("emailLogin"),0);
                                        
                    if (ConexionEstatica.Get_Preferencias(email)==null) {
                        response.sendRedirect("Vistas/preferencias.jsp");
                    }
                    
                    /*
                    if(hasAdmin) {
                        response.sendRedirect("Vistas/admin.jsp");
                    } else {                    
                        response.sendRedirect("Vistas/valido.jsp");
                    }*/
                }
                
                
                
                ConexionEstatica.cerrarBD();
                
            }
            
            if (request.getParameter("registButton")!=null) {
                response.sendRedirect("Vistas/registro.jsp");
            }
            
            //Página registro
            if (request.getParameter("submRegist")!=null) {
                ConexionEstatica.nueva();
                Usuario aux = ConexionEstatica.login(request.getParameter("emailLogin"),request.getParameter("passwordLogin"));
                if(aux==null) {
                    ConexionEstatica.Insertar_Usuario(request.getParameter("emaiRegist"), request.getParameter("passwordRegist"), request.getParameter("nombreRegist"), request.getParameter("apellRegist"), Integer.parseInt(request.getParameter("edadRegist")), request.getParameter("generoRegist"));
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
            
            //Pagina administrador
            if (request.getParameter("borrarCrud")!=null) {
                ConexionEstatica.nueva();
                String aux = request.getParameter("emailAd");
                System.out.println(aux);
                ConexionEstatica.Borrar_Usuario(request.getParameter("emailAd"));
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
            if (request.getParameter("activCRUD")!=null) {
                ConexionEstatica.nueva();
                ConexionEstatica.Set_Active(request.getParameter("emailAd"), true);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
            if (request.getParameter("desCRUD")!=null) {
                ConexionEstatica.nueva();
                ConexionEstatica.Set_Active(request.getParameter("emailAd"), false);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
            if (request.getParameter("setAdmin")!=null) {
                ConexionEstatica.nueva();
                ConexionEstatica.Set_Rol(request.getParameter("emailAd"), 0);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
            if (request.getParameter("revokeAdmin")!=null) {
                ConexionEstatica.nueva();
                ConexionEstatica.Borrar_Rol(request.getParameter("emailAd"), 0);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/admin.jsp");
            }
            
            //Página preferencias
            if (request.getParameter("submPref")!=null) {
                ConexionEstatica.nueva();
                
                Boolean rel = false;
                Boolean hijos = false;
                
                if(request.getParameter("relPref").equals("s")) {
                    rel = true;
                }
                
                if(request.getParameter("hijosPref").equals("s")) {
                    rel = true;
                }
                                
                if(ConexionEstatica.Get_Preferencias(session.getAttribute("emailAct").toString())!=null ) {
                    ConexionEstatica.Update_Preferencias(session.getAttribute("emailAct").toString(), rel, request.getParameter("depPref"), request.getParameter("artPref"), request.getParameter("politPref"), hijos, request.getParameter("interesPref"));
                    response.sendRedirect("index.jsp");                   
                } else {
                    ConexionEstatica.Insertar_Preferencias(session.getAttribute("emailAct").toString(), rel, request.getParameter("depPref"), request.getParameter("artPref"), request.getParameter("politPref"), hijos, request.getParameter("interesPref"));
                }
                ConexionEstatica.cerrarBD();
            }
            
        %>
    </body>
</html>

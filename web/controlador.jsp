<%-- 
    Document   : controlador
    Created on : 14-oct-2020, 12:29:24
    Author     : dario
--%>

<%@page import="Modelo.VerificarRecaptcha"%>
<%@page import="Modelo.Mensaje"%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Preferencias"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            //Página de login
            if (request.getParameter("submLog")!=null) {
                ConexionEstatica.nueva();
                
                String email = request.getParameter("emailLogin");
                                
                Usuario aux = ConexionEstatica.login(email,request.getParameter("passwordLogin"));
                
                boolean relogin = false;
                
                if(session.getAttribute("emailAct")==null){
                    session.setAttribute("emailAct", " ");
                }
                
                if(email.equals(session.getAttribute("emailAct").toString())) {
                    relogin = true;
                }
                
                //Obtenemos el valor de g-recaptcha-response del reCaptcha
                String gRecaptchaResponse = request.getParameter("g-recaptcha-response");     
                
                boolean verificado = false;
                
                int a = (int) session.getAttribute("isCaptcha");
                
                if(a>=10) {
                    verificado = VerificarRecaptcha.verificar(gRecaptchaResponse);                    
                } else {
                    verificado = true;
                }
                
                if(aux!=null && verificado) {
                    session.setAttribute("emailAct", email);
                    
                    session.setAttribute("nombreAct", aux.getName()+" "+aux.getApellido());
                    
                    
                    Integer contador = (Integer) application.getAttribute("numerodeUsuarios");
                    if (contador == null || contador == 0) {
                        contador = 1;
                    } else {
                        contador = contador + 1;
                    }
                    if(relogin) {
                        contador = contador-1;
                    }
                    application.setAttribute("numerodeUsuarios", contador);

                    Boolean hasAdmin = ConexionEstatica.getRol(request.getParameter("emailLogin"),0);
                                        
                    if (ConexionEstatica.Get_Preferencias(email)==null) {
                        response.sendRedirect("Vistas/preferencias.jsp");
                    } else if(hasAdmin) {
                        response.sendRedirect("Vistas/admin.jsp");
                        session.setAttribute("prefAct", ConexionEstatica.Get_Preferencias(email));
                    } else {                    
                        response.sendRedirect("Vistas/inicio.jsp");
                        session.setAttribute("prefAct", ConexionEstatica.Get_Preferencias(email));
                    }
                                                           
   
                } else {
                    response.sendRedirect("index.jsp");
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
            
            if (request.getParameter("submEdit")!=null) {
                ConexionEstatica.nueva();
                ConexionEstatica.Update_Usuario(session.getAttribute("emailAct").toString(), request.getParameter("passwordRegist"), request.getParameter("nombreRegist"), request.getParameter("apellRegist"), Integer.parseInt(request.getParameter("edadRegist")), request.getParameter("generoRegist"));
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/inicio.jsp");
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
            if (request.getParameter("userPref")!=null) {
                response.sendRedirect("Vistas/preferencias.jsp");
            }
            
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
                    session.setAttribute("prefAct", ConexionEstatica.Get_Preferencias(session.getAttribute("emailAct").toString()));
                    response.sendRedirect("Vistas/inicio.jsp");                   
                } else {
                    ConexionEstatica.Insertar_Preferencias(session.getAttribute("emailAct").toString(), rel, request.getParameter("depPref"), request.getParameter("artPref"), request.getParameter("politPref"), hijos, request.getParameter("interesPref"));
                    session.setAttribute("prefAct", ConexionEstatica.Get_Preferencias(session.getAttribute("emailAct").toString()));
                    response.sendRedirect("Vistas/inicio.jsp");
                }
                ConexionEstatica.cerrarBD();
            }
            
            //Mensajes
            if(request.getParameter("userNewM")!=null) {
                response.sendRedirect("Vistas/mensaje.jsp");
            } 

            if(request.getParameter("userMail")!=null) {
                response.sendRedirect("Vistas/entrada.jsp");
            }  

            //Amigos                        
            if(request.getParameter("sendRequest")!=null) {
                ConexionEstatica.nueva();
                String email2 = request.getParameter("emailF");
                
                boolean isSend = ConexionEstatica.Is_Send(session.getAttribute("emailAct").toString(), email2);
                
                if(!isSend) {
                    ConexionEstatica.Send_Request(session.getAttribute("emailAct").toString(), email2);
                    response.sendRedirect("Vistas/busqueda.jsp");
                }else {
                    session.setAttribute("error", "1");
                    response.sendRedirect("Vistas/busqueda.jsp");
                }                
            }
            
            if(request.getParameter("aceptarF")!=null) {
                ConexionEstatica.nueva();
                String emailF = request.getParameter("emailF");
                ConexionEstatica.Set_Amigo(session.getAttribute("emailAct").toString(), emailF);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/amigos.jsp");
            }
            
            if(request.getParameter("rechazarF")!=null) {
                ConexionEstatica.nueva();
                String emailF = request.getParameter("emailF");
                ConexionEstatica.Delete_Amigo(session.getAttribute("emailAct").toString(), emailF);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/amigos.jsp");
            }
            
        %>
    </body>
</html>

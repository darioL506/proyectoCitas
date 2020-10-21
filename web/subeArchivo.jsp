<%-- 
    Document   : subeArchivo
    Created on : 21-oct-2020, 10:41:42
    Author     : dario
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        LinkedList<String> aux = new LinkedList<>();
                
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        List items = upload.parseRequest(request);

        File fichero = null;
        
        
        
        String ruta = "Archivos";

        for (Object item : items) {
            FileItem uploaded = (FileItem) item;



            if (!uploaded.isFormField()) {

                fichero = new File(ruta, uploaded.getName());

                aux.addFirst(fichero.getName());

                uploaded.write(fichero);
                out.println("Archivo '" + uploaded.getName() + "' subido correctamente.");

            } else {
                String key = uploaded.getFieldName();
                String valor = uploaded.getString();
                aux.add(valor);
            }

        }

        if(fichero == null) {
            aux.addFirst("0");
        }

        ConexionEstatica.nueva();
        ConexionEstatica.Send_Email(aux.get(1), aux.get(3), session.getAttribute("emailAct").toString(), aux.get(2),aux.getFirst());
        ConexionEstatica.cerrarBD();   
        response.sendRedirect("/inicio.jsp");
        %>
    </body>
</html>

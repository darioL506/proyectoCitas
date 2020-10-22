package Modelo;

import Auxiliar.Constantes;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.LinkedList;
import javax.swing.JOptionPane;

public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;


    public static void nueva(){
        try {
         //Cargar el driver/controlador
            //String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "com.mysql.cj.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName("org.mariadb.jdbc.Driver");              
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);
            //Class.forName("com.mysql.jdbc.Driver"); 

            //String URL_BD = "jdbc:mysql://localhost:3306/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+"localhost:3306"+"/"+Constantes.BBDD;
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";
            //String connectionString = "jdbc:mysql://localhost:3306/" + Constantes.BBDD + "?user=" + Constantes.usuario + "&password=" + Constantes.password + "&useUnicode=true&characterEncoding=UTF-8";

            //Realizamos la conexión a una BD con un usuario y una clave.
            //Conex = java.sql.DriverManager.getConnection(connectionString);
            //Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Conex = DriverManager.getConnection(  
                   "jdbc:mariadb://localhost:3306/"+ Constantes.BBDD, Constantes.usuario, Constantes.password); 
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }
    
    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    
    //Gestion de ususarios
    public static Usuario existeUsuario(String email) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM usuario WHERE email = '" + email + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("genero"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }
    
    public static Usuario login(String email, String password) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM usuario WHERE email = '" + email + "' AND pass = '" + password +"'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("genero"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }
    
    public static void Insertar_Usuario (String email, String password, String nombre, String apellido, int edad, String genero) throws SQLException {
        String Sentencia = "INSERT INTO usuario (email, pass, nombre, apellido, edad, genero) "
                + "VALUES ('"+email+"', '"+password+"', '"+nombre+"', '"+apellido+"', "+edad+", '"+genero+"')";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    public static void Borrar_Usuario(String email) throws SQLException {
        String Sentencia = "DELETE FROM usuario WHERE email = '" + email + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    public static void Set_Active(String email, boolean activar) throws SQLException {
        String Sentencia;
        
        if(activar) {
            Sentencia = "UPDATE usuario SET activo = true WHERE email = '"+email+"'";
        } else {
            Sentencia = "UPDATE usuario SET activo = false WHERE email = '"+email+"'";
        }
        
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    /**
     * Usando una LinkedList.
     * @return 
     */
    
    public static LinkedList obtenerUsuariosBasic() {
        LinkedList usuarioBD = new LinkedList<>();
        Usuario usu = null;
        try {
            String sentencia = "SELECT * FROM usuario";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                usu = new Usuario(Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getBoolean("activo"));
                usuarioBD.add(usu);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return usuarioBD;
    }
    
    public static Usuario Get_Usuario(String email) {        
        Usuario usu = null;
        try {
            String sentencia = "SELECT * FROM usuario WHERE email = '"+email+"'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                usu = new Usuario(Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("genero"));                
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return usu;
    }

    
    //Gestion de roles
    public static boolean getRol(String email, int rol) {
        LinkedList<Usuario> usuariosRol = new LinkedList<>();
        Usuario aux = null;
        Boolean hasRol = false;
        try {
            String sentencia = "SELECT * FROM rolusuario "
                    + "WHERE emailUsu = '"+ email +"'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            
            while(Conj_Registros.next()){
                aux =new Usuario(Conj_Registros.getString("emailUsu"), Conj_Registros.getInt("idRol"));
                usuariosRol.add(aux);
            }
                                           
            for(Usuario usu:usuariosRol) {
                if(usu.getRol()==rol) {
                    hasRol = true;
                }
            }
            
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return hasRol;
    }
    
    public static void Set_Rol(String email, int rol) throws SQLException {
        String Sentencia;
        
        if(!getRol(email,rol)) {
            Sentencia = "INSERT INTO rolusuario "
                    + "VALUES (NULL, '"+email+"', "+rol+")";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
        }
                
    }
    
    public static void Borrar_Rol(String email, int rol) throws SQLException {
        String Sentencia = "DELETE FROM rolusuario "
                + "WHERE emailUsu = '" + email + "' AND idRol = "+rol+"";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    //Gestion de preferencias    
    public static Preferencias Get_Preferencias (String email) {
        
        Preferencias pref = null;
        try {
            String sentencia = "SELECT * FROM preferencias "
                    + "WHERE emailUsu = '"+email+"'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()) {
                pref = new Preferencias(Conj_Registros.getString("emailUsu"),Conj_Registros.getBoolean("relacion"),Conj_Registros.getInt("deportes"),Conj_Registros.getInt("arte"),Conj_Registros.getInt("politica"),Conj_Registros.getBoolean("hijos"),Conj_Registros.getString("interes"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return pref;
    }
    
    public static void Insertar_Preferencias (String email, Boolean relacion, String deportes, String arte, String politica, boolean hijos, String interes) throws SQLException {
        try {
            String sentencia = "INSERT INTO preferencias "
                    + "VALUES ('"+email+"', "+relacion+", "+deportes+", "+arte+", "+politica+", "+hijos+", '"+interes+"')";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia); 
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
    }
    
    public static void Update_Preferencias (String email, Boolean relacion, String deportes, String arte, String politica, boolean hijos, String interes) throws SQLException {
        try {
            String sentencia = "UPDATE preferencias SET "
                    + "relacion = "+relacion+", deportes = "+deportes+", arte = "+arte+", politica = "+politica+", hijos = "+hijos+", interes = '"+interes+"' "
                    + "WHERE emailUsu = '"+email+"'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia); 
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
    }
    
    //Gestion de mensajes
    public static void Send_Email (String asunto, String cuerpo, String emisor, String receptor, String nombreArch) throws SQLException {
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            String sentencia ="INSERT INTO mensaje (asunto, cuerpo, emisor, receptor, fecha, fileName) "
                    + "VALUES ('"+asunto+"', '"+cuerpo+"', '"+emisor+"', '"+receptor+"', '"+date.format(formatter)+"', '"+nombreArch+"')";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia); 
        } catch (SQLException ex) {
            
        }
    }
    
    public static LinkedList obtenerMensajesUsu(String mail) throws SQLException {
        LinkedList mensajesBD = new LinkedList<>();
        Mensaje email = null;
        try {
            String sentencia = "SELECT * FROM mensaje WHERE receptor = '"+mail+"' ORDER BY fecha ASC , idMail DESC";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                email = new Mensaje (Conj_Registros.getString("asunto"),Conj_Registros.getString("cuerpo"),Conj_Registros.getString("emisor"),Conj_Registros.getString("receptor"),Conj_Registros.getDate("fecha").toString(),Conj_Registros.getBoolean("leido"),Conj_Registros.getString("fileName"));
                mensajesBD.add(email);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return mensajesBD;
    }
    
    //Amigos
    public static LinkedList Busqueda (Preferencias pref) throws SQLException {
        LinkedList aux = new LinkedList<>();
        String sentencia= "";
        String sentencia2="";
        
        if(pref.getRelacion() && pref.getInteres().equals("m")) {
            if(pref.getDeportes()>=pref.getArte() && pref.getDeportes()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'm' ORDER BY deportes DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'm' ORDER BY deportes DESC";
            }
            if(pref.getArte()>=pref.getDeportes() && pref.getArte()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'm' ORDER BY arte DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'm' ORDER BY arte DESC";
            }
            if(pref.getPolitica()>=pref.getArte() && pref.getPolitica()>=pref.getDeportes()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'm' ORDER BY politica DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'm' ORDER BY politica DESC";
            }
            
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
        }
        
        if(pref.getRelacion() && pref.getInteres().equals("f")) {
            if(pref.getDeportes()>=pref.getArte() && pref.getDeportes()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'f' ORDER BY deportes DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'f' ORDER BY deportes DESC";
            }
            if(pref.getArte()>=pref.getDeportes() && pref.getArte()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'f' ORDER BY arte DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'f' ORDER BY arte DESC";
            }
            if(pref.getPolitica()>=pref.getArte() && pref.getPolitica()>=pref.getDeportes()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'f' ORDER BY politica DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'f' ORDER BY politica DESC";
            }
            
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
        }
        
        if(pref.getRelacion() && pref.getInteres().equals("b")) {
            if(pref.getDeportes()>=pref.getArte() && pref.getDeportes()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 ORDER BY deportes DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 ORDER BY deportes DESC";
            }
            if(pref.getArte()>=pref.getDeportes() && pref.getArte()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 ORDER BY arte DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 ORDER BY arte DESC";
            }
            if(pref.getPolitica()>=pref.getArte() && pref.getPolitica()>=pref.getDeportes()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 1 ORDER BY politica DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 0 ORDER BY politica DESC";
            }
            
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
        }
        
        if(!pref.getRelacion() && pref.getInteres().equals("m")) {
            if(pref.getDeportes()>=pref.getArte() && pref.getDeportes()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'm' ORDER BY deportes DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'm' ORDER BY deportes DESC";
            }
            if(pref.getArte()>=pref.getDeportes() && pref.getArte()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'm' ORDER BY arte DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'm' ORDER BY arte DESC";
            }
            if(pref.getPolitica()>=pref.getArte() && pref.getPolitica()>=pref.getDeportes()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'm' ORDER BY politica DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'm' ORDER BY politica DESC";
            }
            
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
        }
        
        if(!pref.getRelacion() && pref.getInteres().equals("f")) {
            if(pref.getDeportes()>=pref.getArte() && pref.getDeportes()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'f' ORDER BY deportes DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'f' ORDER BY deportes DESC";
            }
            if(pref.getArte()>=pref.getDeportes() && pref.getArte()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'f' ORDER BY arte DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'f' ORDER BY arte DESC";
            }
            if(pref.getPolitica()>=pref.getArte() && pref.getPolitica()>=pref.getDeportes()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 AND interes LIKE 'f' ORDER BY politica DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 AND interes LIKE 'f' ORDER BY politica DESC";
            }
            
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
        }
        
        if(!pref.getRelacion() && pref.getInteres().equals("b")) {
            if(pref.getDeportes()>=pref.getArte() && pref.getDeportes()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 ORDER BY deportes DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 ORDER BY deportes DESC";
            }
            if(pref.getArte()>=pref.getDeportes() && pref.getArte()>=pref.getPolitica()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 ORDER BY arte DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 ORDER BY arte DESC";
            }
            if(pref.getPolitica()>=pref.getArte() && pref.getPolitica()>=pref.getDeportes()) {
                sentencia = "SELECT * FROM preferencias WHERE relacion = 0 ORDER BY politica DESC";
                sentencia2 = "SELECT * FROM preferencias WHERE relacion = 1 ORDER BY politica DESC";
            }
            
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
            while(Conj_Registros.next()){
                Usuario usu = Get_Usuario(Conj_Registros.getString("emailUsu"));
                aux.add(usu);
            }
        }
        
        return aux;
    }
    
}

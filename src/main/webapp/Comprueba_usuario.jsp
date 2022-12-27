<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recoge Datos JSP</title>
</head>
<body>
	
	<%@ page import="java.sql.*" %>
	
	<%
	String usuario = request.getParameter("usuario");
	String contra = request.getParameter("contra");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		Connection myConection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp","root","FirstTrySQL$1998");
		
		PreparedStatement c_preparada = myConection.prepareStatement("SELECT * FROM usuarios WHERE Usuario=? AND Contrasena=?");
		c_preparada.setString(1, usuario);
		c_preparada.setString(2, contra);
		
		ResultSet rs = c_preparada.executeQuery();
		
		if(rs.next()){
            out.println("Inicio de sesión autorizado.");                
        }
		else{
            out.println("No tenemos usuarios registrados con las credenciales que indicaste.");                
		}
	}catch(Exception ex){
		out.println("Ha habido un error al enviar sus datos a la Base de Datos.");
	}
	
	%>
</body>
</html>
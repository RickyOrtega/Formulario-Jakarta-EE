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
	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String usuario = request.getParameter("usuario");
	String contra = request.getParameter("contra");
	String pais = request.getParameter("pais");
	String tecnologia = request.getParameter("tecnologias");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		Connection myConection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp","root","FirstTrySQL$1998");
		
		Statement miStatement = myConection.createStatement();
		
		String instruccionSQL = "INSERT INTO usuarios (Nombre, Apellido, Usuario, Contrasena, Pais, Tecnologia) VALUES ('"+ nombre + "','"+ apellido + "','"+ usuario + "','"+ contra + "','"+ pais + "','"+ tecnologia + "')";
		
		miStatement.executeUpdate(instruccionSQL);
		
		out.println("Registrado con éxito.");
	}catch(Exception ex){
		out.println("Ha habido un error al enviar sus datos a la Base de Datos.");
	}
	
	%>
</body>
</html>
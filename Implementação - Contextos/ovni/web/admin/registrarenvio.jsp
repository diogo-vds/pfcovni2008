<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.math.*" %>
<%@ page import="java.lang.Object"%>
<%@ page import="java.util.Vector" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OVNI.net - Ofertas de outro mundo : Registrar Envio</title>
<style>
@import url("styles/styles.css");
</style>	
</head>
<body>
<div id="geral">

<table style="width:100%">
	<tr>
		<td align="center">

<div id="principal">
<div id="topo" >
<%@ include file="/admin/topo.jsp" %>
</div>     
 <div id="content_full">  

 <!-- Início código -->
<%
	ResultSet rs = null;
	if(request.getAttribute("rs")!= null){
		rs = (ResultSet) request.getAttribute("rs");
		if(rs.next()){ %>
			<form name="enviarpedidos" action="/ovni/RegistrarEnvio" method="post">
			<b>Selecione os Pedidos que deseja enviar</b><br> 
			<input type="checkbox" name="PEDIDO" value="<%=rs.getLong("_codigo")%>">Pedido Nº <%=rs.getLong("_codigo")%><br> <%
			while(rs.next()){				
			%>   
			    <input type="checkbox" name="PEDIDO" value="<%=rs.getLong("_codigo")%>">Pedido Nº <%=rs.getLong("_codigo")%><br>
			<%
			}%><input type="submit" value="enviar"></form>
		<%}else{
			%><b>Teste Nenhum pedido encontrado!</b>
	<%	}
	}else if(request.getAttribute("mensagem")!=null){
		Vector<String> mensagem = (Vector<String>) request.getAttribute("mensagem");
		for(int i = 0; i < mensagem.size(); i++){
			%><br><p align="center"><b>
			<%out.println(mensagem.get(i));%>
			</b></p><%
		}
	}else{
		response.sendRedirect("/ovni/RegistrarEnvio");
	}
%>
<!-- Fim código -->
	
    	</div>
		</td>
	</tr>

</table>
    
    		    <div id="copy">
	    		<%@ include file="/copy.jsp" %>         
	    </div>
</div>
</body>

</html>

		
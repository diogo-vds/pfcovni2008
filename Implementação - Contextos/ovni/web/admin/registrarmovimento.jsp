<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.math.*" %>
<%@ page import="java.lang.Object"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OVNI.net - Ofertas de outro mundo : Registrar Movimentação</title>
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
	<%
		if(request.getAttribute("registro")!=null){
			out.println("<b>"+request.getAttribute("registro"));
		}
		if(request.getAttribute("prod")!=null){
			Produto prod = (Produto) request.getAttribute("prod");
			if(prod.getTitulo()!=null){%>
				<table>
				<form name="form1" action="/ovni/RegistrarMovimento"
					method="post">
						<tr>
							<td>Código:</td><td>
							<%=prod.getCodigo()%></td>
							<input type="hidden" name="codigo" 
								value="<%=prod.getCodigo()%>">
						</tr><tr>
							<td>Titulo:</td><td>
							<%=prod.getTitulo()%>
						</tr><tr>
						<tr>
							<td><select name="tipo">
								<option value="1">Entrada</option>
								<option value="2">Saida</option>
								<option value="3">Devolução</option>
								<option value="4">Doação</option>
							<td><input type="text" name="quantidade"
								size="5" maxlenght="5"></td>
						</tr><tr>
							<td><input type="submit" value="Registrar"></td>
						</tr>
				</table></form>
			<%}else{
				out.println("<b>Produto Não Encontrado!</b>");
			}
			
		}else{%>
			<table>
			<form name="form1" action="/ovni/RegistrarMovimento"
				method="post">
				<tr><td>Digite o Código do Produto:</td>
					<td><input type="text" name="codigo"></td>
					<input type="hidden" name="acao" value="buscar">
					<td><input type="submit" value="ok"></td>
				</tr>
			</form>
			</table>
	<%}
	%>

   	
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

		
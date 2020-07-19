<%@page session="true"%>
<%@ page 
    contentType="text/html; charset=iso-8859-1" 
    pageEncoding="UTF-8" 
    language="java"     
    errorPage="" %>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%
	Usuario oUsuario  = (Usuario) request.getAttribute("Usuario");
	ResultSet rsPedidosDesktop = (ResultSet) request.getAttribute("ResumoPedidosDkTWap");
	ResultSet rsPedidosSMS = (ResultSet)request.getAttribute("ResumoPedidosSMS");
%>
<html>
<head>
    <title> OVNI.net - Administração da Loja</title>
</head>
<body>
<div id="geral">
<table style="width:100%">
	<tr>
		<td align="center">
		
		<div id="principal">
    	 <div id="topo" style="z-index:800">
            	<%@ include file="/admin/topo.jsp" %>
        </div>
        <div id="content_full" style="z-index: 0;text-align: left;">
        	<div style="margin-left: 15%;width:100%;height:100%;font-size:11px">
        		<br>
        		<span class="texto11bold_red" style="font-size: 13px">Resumo de Operações</span><br/>
        		<br/>
				<h1>Produtos</h1>
				<p style="text-align: left"> 
					<span class="texto12bold_green"><%=request.getAttribute("TotalProdutos")%></span> produto(s)cadastrado(s) </p>
				<br/>
					<h1>Pedidos feitos por Browsres</h1>
					<p style="text-align: left">
					<% while(rsPedidosDesktop.next()) {%>
						<span class="texto11bold_red"><%=rsPedidosDesktop.getInt("total") %></span> PEDIDOS COM STATUS <%=rsPedidosDesktop.getString("_descricao") %><br/> 
					<%} %>
					</p>
				<br/><br/>
					<h1>Pedidos feitos por SMS</h1>
					<p style="text-align: left">
					<% while(rsPedidosSMS.next()) {%>
						<span class="texto11bold_red"><%=rsPedidosSMS.getInt("total") %></span> PEDIDOS COM STATUS <%=rsPedidosSMS.getString("_descricao") %><br/> 
					<%} %>
					</p>
			</div>					
        </div> 
    	
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

		
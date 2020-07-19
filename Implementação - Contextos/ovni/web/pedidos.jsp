<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.PedidoDesktopWAP, ovni.negocio.Usuario"%>
<%


	PedidoDesktopWAP pedido = new PedidoDesktopWAP();
	Usuario usu = (Usuario) session.getAttribute("Usuario");
	
	ResultSet oRsPedido;

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Meus Pedidos</title>
		<style>
			@import url("styles/styles.css");
		</style>	
        
        <script language="javascript" src="js/validacoes.js"> </script>
    </head>
<div id="geral">

<table style="width:100%">
	<tr>
		<td align="center">

    <div id="principal">
        <div id="topo" >
            <%@ include file="/topo.jsp" %>
        </div>     
        <div id="content_full">  
		 <%@ include file="/buscaPedido.jsp" %>

<%
	oRsPedido = (ResultSet) request.getAttribute("Pedidos");

	if (oRsPedido != null)
	{
	%>
		<form name="frmDetalhes" method="post" action="/ovni/VisualizarDetalhesPedido">
		<table width="650" align="center" class="borda_cinza">
		
			<tr align="center">
				<th width="15%" >Codigo Pedido</th>
				<th width="15%" >Data Pedido</th>
				<th width="30%" >Status</th>
				<th width="15%" >VisualizarDetalhes</th>
			</tr>
	<%
		String cor ="";
		int iCont = 0;
		while(oRsPedido.next())
		{

		if(iCont % 2 == 0)
		{ cor = "#ffffff";}
		else
		{ cor = "#fafafa";}
		
		%>
			
			<tr style="background-color:<%=cor%>" align="center">
				<td> <%=oRsPedido.getLong("Codigo")%>							</td>
				<td> <%=Util.formatarData(oRsPedido.getDate("Data"))%>	</td>
				<td> <%=oRsPedido.getString("Status")%>				</td>
				<td>
					<input type="hidden" name="sub2" value="<%=oRsPedido.getLong("Codigo")%>">
				 	<input type="submit" name="sub" value="<%=oRsPedido.getLong("Codigo")%>">					
				 </td>
			</tr>
			
		<%
		iCont++;
		}//final do while(oRsPedido.next())
		%>
		</table>
		</form>
		<%
	}//Final do if (oRsPedido != null)
	else
	{
	%>
		<table align="center" width="240">
			<tr>
				<td width="10%" align="right"><img src="imgs/buttons/alerta.png" /></td>
				<td class="erro" width="90%"  align="left">Selecione um item para pesquisa</td>
			</tr>
		</table>
	<%
	}//Final do else
%>
<br><br>
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
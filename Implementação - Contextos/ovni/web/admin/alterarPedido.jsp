<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.Usuario"%>
<%
	Usuario usu = (Usuario) session.getAttribute("Usuario");
	TipoStatusPedido status = new TipoStatusPedido();
	ResultSet oRsStatus;
	oRsStatus = status.retornarTipos();
	int StatusSelecionado = Integer.parseInt(request.getAttribute("Status").toString());
	String Pedido = (String) request.getAttribute("Pedido");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Detalhes Pedido</title>
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
            <%@ include file="/topo.jsp" %>
        </div>     
        <div id="content_full"> 
<br><br>

			<form name="frmAlterar" method="post" action="/ovni/AlterarPedido">
				<input type="hidden" name="Flag" value="Alterar"><br>
					<select name="Status"><%
						while(oRsStatus.next())
						{
							if( oRsStatus.getInt("_Codigo") == StatusSelecionado )
							{
%>
								<option selected value="<%=oRsStatus.getInt("_Codigo")%>">
								<%=oRsStatus.getString("_Descricao")%>
				 				 </option>
<%				 		
							}//fim if( oRsStatus.getInt("_Codigo") == Integer.ParseInt(StatusSelecionado)
							else
							{
%>							
								<option value="<%=oRsStatus.getInt("_Codigo")%>">
								<%=oRsStatus.getString("_Descricao")%>
				 				 </option>
<%				 				 
							}//fim else
						}//Final do while(oRsStatus.next())
%>	
					</select><br>
					<input type="text" maxvalue="13" name="codigoRastreamento"> Insira aqui o codigo do rastreamento<br>
					<input type="submit"><br>
			</form>
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
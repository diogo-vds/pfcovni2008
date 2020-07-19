<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.PedidoDesktopWAP, ovni.negocio.Usuario"%>
<%
	Vector pedidos = (Vector) session.getAttribute("admBuscaPedido");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="Javascript">
function detalhes(posi)
{
	frmDetalhes.posicao.value = posi; 
	frmDetalhes.submit();	
}
</script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Manutenção de pedidos</title>
		<style>
			@import url("styles/styles.css");
		</style>	
        
        <script language="javascript" src="<%=request.getContextPath()%>/js/validacoes.js"> </script>
    </head>
<div id="geral">

<table style="width:100%">
	<tr>
		<td align="center">

    <div id="principal">
        <div id="topo">
            <%@ include file="/admin/topo.jsp" %>
        </div>     
        <div id="content_full">  
		 <%@ include file="/admin/buscaPedido.jsp" %>

<%
	if (pedidos != null)
	{
		if (pedidos.size() > 0)
		{
%>
			<form name="frmDetalhes" method="post" action="/ovni/AlterarPedido">
			<input type="hidden" name="posicao" value="">
			<input type="hidden" name= "flag" value="Detalhes">
			<table width="650" align="center" class="borda_cinza">		
				<tr align="center">
					<th width="15%" >Codigo Pedido	</th>
					<th width="15%" >Data Pedido	</th>
					<th width="30%" >Status			</th>
					<th width="15%" >VisualizarDetalhes</th>
				</tr>
			<%
			for (int iCont = 0; iCont < pedidos.size(); iCont++)
			{
				String cor = (iCont % 2 == 0) ? "#ffffff" : "#fafafa";		
			%>
				<tr style="background-color:<%=cor%>" align="center">
					<td> <%=((PedidoDesktopWAP)pedidos.elementAt(iCont)).getCodigo()%> 							</td>
					<td> <%=Util.formatarData( ((PedidoDesktopWAP)pedidos.elementAt(iCont)).getDataPedido())%>	</td>
					<td> <%=((PedidoDesktopWAP)pedidos.elementAt(iCont)).getTipoStatus().getDescricao()%>		</td>
					<td> <input type="button" value="Detalhes" onClick=detalhes(<%=iCont%>)>					</td>
				</tr>
				
			<%
			}//final do for
		}//final if (pedidos.size() > 0)
		else
		{
		%>		
			<table align="center" width="240">
				<tr>
					<td width="10%" align="right"><img src="<%=ContextPath%>/imgs/buttons/alerta.png" /></td>
					<td class="erro" width="90%"  align="left">Nenhum pedido encontrado</td>
				</tr>
			</table>		
		<%
		}
		%>
			</table>
			</form>
			<%
	}//Final do if (pedidos != null)
	else
	{
	%>
		<table align="center" width="240">
			<tr>
				<td width="10%" align="right"><img src="<%=ContextPath %>/imgs/buttons/alerta.png" /></td>
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
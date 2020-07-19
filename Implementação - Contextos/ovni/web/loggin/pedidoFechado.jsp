<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.PedidoDesktopWAP"%>
<%
	Usuario usu = (Usuario) session.getAttribute("Usuario");        
    PedidoDesktopWAP ped = (PedidoDesktopWAP) request.getAttribute("Pedido");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Finalizar Pedido</title>
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
        <h1> O seu pedido foi realizado com sucesso!!!</h1>
        	O prazo de entrega &eacute de at&eacute cinco dias &uacuteteis ap&oacutes a confirma&ccedil&atildeo do pagamento.
		<table width="300" align="center" class="borda_cinza">
			<tr>
				<th colspan="2"> Dados Gerais</th>
			</tr>
			<tr>
				<td class="label" style="width:10%" align="left">N&uacutemero do Pedido: </td>
				<td style="width:90%"><%=ped.getCodigo()%></td>
			</tr>
			<tr>
				<td class="label">Total do Pedido: </td>
				<td style="width:90%"> <%=Util.formatarDouble(ped.getvalorTotal()+ped.getTipoFormas().getTaxa())%> </td>
			</tr>
			<tr>
				<td class="label">Endere&ccedilo: </td>
				<td style="width:90%"> <%=ped.getEndereco().getRua()%>  </td>
			</tr>
			<tr>
				<td class="label">Receptor: </td>
				<td style="width:90%"> <%=ped.getEndereco().getNomeReceptor()%>  </td>				
			</tr>
<%
	if (!ped.getTipoFormas().isTEF() )
	{
%>
			<tr>
				<td></td>
				<td>
				<form name="frmBoleto" method="get" action="/ovni/ManterBoleto">
					<input type="hidden" name="codigo" value="<%=ped.getCodigo()%>">
			      	<input type="submit" value="Visualizar Boleto">
			    </form>
			    </td>  
    		</tr>
<%
	} //FInal do IF if (ped.getTipoFormas().getCodigo() == 1 )
%>
			
		</table>			
			


        </div>			
      <div id="copy">
    			 <%@ include file="/copy.jsp" %>         
      </div>
    </div>
    </td>
   </tr>
 </table>
</div>
</body></html>
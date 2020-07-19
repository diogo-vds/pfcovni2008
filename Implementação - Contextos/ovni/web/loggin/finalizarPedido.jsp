<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.PedidoDesktopWAP"%>
<%
	ResultSet oRsEndereco = (ResultSet) request.getAttribute("Endereco");
	ResultSet oRsPagamento = (ResultSet) request.getAttribute("Pagamento");


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

<%
if(oRsEndereco != null && oRsPagamento !=null)
{
%>
	<form name="frmFinalizar" method="post" action="/ovni/FinalizarPedidoDesktopWAP">
	<input type="hidden" name="flag" value="concluir">
<%
	if (oRsEndereco.next())
	{
%>

		<table width="578" height="50" align="center" class="borda_cinza">
		<tr>
			<h1>Escolha o Endereco de entrega</h1>
		</tr>
		<tr>

				<td>
					<input type="radio" checked="true" name="OpcaoEndereco" value="<%=oRsEndereco.getInt("CodEndereco")%>"><br>
					<%=oRsEndereco.getString("Rua")%> - <%=oRsEndereco.getString("Numero")%> <br>
					<%=oRsEndereco.getString("Bairro")%> - <%=oRsEndereco.getString("CEP")%><br>
					<%=oRsEndereco.getString("Cidade")%> - <%=oRsEndereco.getString("Estado")%><br>
				</td>
<%
		while(oRsEndereco.next())
		{
%>
				<td>
					<input type="radio" name="OpcaoEndereco" value="<%=oRsEndereco.getInt("CodEndereco")%>"><br>
					<%=oRsEndereco.getString("Rua")%> - <%=oRsEndereco.getString("Numero")%> <br>
					<%=oRsEndereco.getString("Bairro")%> - <%=oRsEndereco.getString("CEP")%><br>
					<%=oRsEndereco.getString("Cidade")%> - <%=oRsEndereco.getString("Estado")%><br>
				</td>
<%	
		}//FINDAL DO WHILE while(oRsEndereco.next())
	}//FINAL DO IF if (oRsEndereco.next())
%>		

		</tr>
		</table>


<br><br><br>
		<table width="578" height="80" align="center" class="borda_cinza">
		<tr>
			<h1>Escolha a Forma de Pagamento</h1>
		</tr>
		<tr>
			<td>
				<input type="radio" checked="TRUE" name="OpcaoPagamento" value="1">Boleto <font color="red"> Adiciona 3 (tr�s) reais no total do pedido</font>
			</td>
		</tr>
		<tr>					
		
			<td>
				<input type="radio" name="OpcaoPagamento" value="2">Cartao Master
				<input type="hidden" name="CodigoBandeira" value="1">
			</td>
			<td>
				<input type="radio" name="OpcaoPagamento" value="3">Cartao Visa
				<input type="hidden" name="CodigoBandeira" value="2">
			</td>

			</tr>
		</table>
		<br><br>
		<table width="578" height="80" align="center" class="borda_cinza">
		<tr>
			<h1>Dados do Cart&atilde;o</h1><font color="red">Preencher somente se a forma de pagamento for cart&atilde;o</font>
		</tr>
		<tr>
			<td class="label">N&uacute;mero do Cart&atilde;o</td> 
			<td style="text-align:left;width:100%;"><input type="text" name="NumeroCartao" maxlength="16" class="text_box" style="width:98%"> </td>
			
			<td class="label">C&oacute;digo de Seguran&ccedil;a</td> 
			<td style="text-align:left;width:40%;"><input type="text" name="NumSegurancaCartao" maxlength="3" class="text_box" style="width:30%"> </td>	
			
			
		</tr>
		<tr>
			<td class="label">Nome Impresso no Cart&atilde;o</td> 
			<td colspan="4" style="text-align:left;width:100%;"><input type="text" name="NomeCartao" class="text_box" style="width:98%"> </td>
		</tr>
		<tr>
			<td class="label">Data de Validade</td> 
			<td tyle="text-align:left;width:100%;">
				<input type="text" name="ValidadeCartaoMes" maxlength="2 "class="text_box" style="width:15%"> &#32; &#47; &#32;
				<input type="text" name="ValidadeCartaoAno" maxlength="2 "class="text_box" style="width:15%">
			</td>			
			<td class="label">Parcelas</td>	
			<td style="text-align:left;width:40%;">
				<select name="NumParcelas">	    					
			    	<option SELECTED value=1>1</option>
			    	<option value=2>2</option>
			    	<option value=3>3</option>
			    </select>
			</td>
		</tr>
		</table>
		
	    <br>
    	<table width="380" cellpadding="3" cellspacing="3" align="center">
        	<tr>
            	<td><a href="default.jsp"><img src="<%=ContextPath%>/imgs/layout/comprar_mais.gif"/></a></td>
                <td><img src="<%=ContextPath%>/imgs/layout/finalizar_pedido.gif"/ onClick="this.document.frmFinalizar.submit()"></td>                                
            </tr>
        </table>
        <br>
        <br>	

		</form>	
<%
}//FINAL DO IF if(oRsEndereco != null && oRsPagamento !=null)

else
{
	response.sendRedirect(ContextPath + "/carrinho.jsp");
}//FINAL DO ELSE DO IF if(oRsEndereco != null && oRsPagamento !=null)
%>

     
</div>
		
		
		</td>
	</tr>

</table>
    
    		    <div id="copy">
	    		<%@ include file="<%=ContextPath%>/copy.jsp" %>         
	    </div>
</div>
</body>

</html>
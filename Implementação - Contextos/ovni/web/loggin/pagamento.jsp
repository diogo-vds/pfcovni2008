<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*"%>
<%@page import="ovni.negocio.*"%>
<%
	Vector pgto = (Vector) request.getAttribute("FormasPagamento");
%>
<html>
<script type="text/javascript" src="js/validacoes.js"></script>
<script language="Javascript">
function atualizaSelecionado(tipoPagamento)
{
	frmPagamento.selecionado.value = tipoPagamento;	
}

function validaPost()
{
	if (frmPagamento.selecionado.value == "true")
	{
		if ( frmPagamento.NumeroCartao.value == "" )
		{
			alert("O campo 'Numero do Cartao' deve ser preenchido");
			document.frmPagamento.NumeroCartao.focus();
			return false;
		}
		if ( frmPagamento.NumSegurancaCartao.value == "" )
		{			
			alert("O campo 'Codigo de Segurança' deve ser preenchido");
			document.frmPagamento.NumSegurancaCartao.focus();
			return false;
		}
		if ( frmPagamento.NomeCartao.value == "" )
		{
			alert("O campo 'Nome Impresso no Cartão' deve ser preenchido");
			document.frmPagamento.NomeCartao.focus();
			return false;
		}
		if ( frmPagamento.ValidadeCartaoMes.value == "" )
		{
			alert("O campo 'Data de Validade' deve ser preenchido");
			document.frmPagamento.ValidadeCartaoMes.focus();
			return false;
		}
		if ( frmPagamento.ValidadeCartaoAno.value == "" )
		{
			alert("O campo 'Data de Validade' deve ser preenchido");
			document.frmPagamento.ValidadeCartaoAno.focus();
			return false;
		}
		if (frmPagamento.ValidadeCartaoMes.value > 12)
		{
			alert("O campo 'Data de Validade' deve ser menor que 12");
			document.frmPagamento.ValidadeCartaoMes.focus();
			return false;
		}
		
		this.document.frmPagamento.submit();
	}
	if ( frmPagamento.selecionado.value == "")
		{
			alert("Informe uma forma de pagamento");
			return false;
		}
	this.document.frmPagamento.submit();	
}
</script>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Escolha uma forma de pagamento</title>
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
        <div id="topo">
            <%@ include file="/topo.jsp" %>
        </div>
        <div id="content_full"> 
			<form name="frmPagamento" method="post" action="/ovni/FinalizarPedidoDesktopWAP">
			<input type="hidden" name="flag" value="revisar">  	        
	        <br><br>     
	           
	        	<table width="200" align="center" class="borda_cinza">
	        		<tr>
	        			<th width="10%"></th>
	        			<th width="40%"></th>
	        			<th width="40%"></th>
	        		</tr>
	        		<tr>
						<h1>Escolha a forma de pagamento: </h1>
					</tr>
					<input type="hidden" name="selecionado" value="">
					<%
						
						for (int iCont = 0; iCont < pgto.size(); iCont++ )
						{
						String sCor = (iCont % 2 == 0 ) ? "#fafafa" : "#ffffff";			
					%> 						      		
				        		<tr style="background-color:#<%=sCor%>">
				        			<td align="left" > <input type="radio" name="OpcaoPagamento" value="<%=((TipoFormaPagamento)pgto.elementAt(iCont)).getCodigo()%>" onClick="atualizaSelecionado(<%=((TipoFormaPagamento)pgto.elementAt(iCont)).isTEF()%>)"> </td>
				        			<td align="right"> <%=((TipoFormaPagamento)pgto.elementAt(iCont)).getDescricao()%> </td> 
				        			<td align="center" class="texto11bold_red""> Taxa:  <%= Moeda.toReal(((TipoFormaPagamento)pgto.elementAt(iCont)).getTaxa())%> R$</td>
				        		</tr>  
			        <%
			        	}//fim do for
			        %>
	        	</table> 
	        	<br><br>
				<table width="578" height="80" align="center" class="borda_cinza">
				
					<tr>
						<h1>Dados do Cart&atilde;o</h1><font color="red">Preencher somente se a forma de pagamento for cart&atilde;o</font>
					</tr>
					<tr>
						<td class="label">N&uacute;mero do Cart&atilde;o</td> 
						<td style="text-align:left;width:100%;"><input type="text" name="NumeroCartao" onKeyPress="return SomenteNumeroComZero(event)" maxlength="16" class="text_box" style="width:98%"> </td>
						
						<td class="label">C&oacute;digo de Seguran&ccedil;a</td> 
						<td style="text-align:left;width:40%;"><input type="text" name="NumSegurancaCartao" onKeyPress="return SomenteNumeroComZero(event)" maxlength="3" class="text_box" style="width:30%"> </td>	
						
						
					</tr>
					<tr>
						<td class="label">Nome Impresso no Cart&atilde;o</td> 
						<td colspan="4" style="text-align:left;width:100%;"><input type="text" name="NomeCartao" class="text_box" style="width:98%"> </td>
					</tr>
					<tr>
						<td class="label">Data de Validade</td> 
						<td tyle="text-align:left;width:100%;">
							<input type="text" name="ValidadeCartaoMes" onKeyPress="return SomenteNumeroComZero(event)" maxlength="2 "class="text_box" style="width:15%"> &#32; &#47; &#32;
							<input type="text" name="ValidadeCartaoAno" onKeyPress="return SomenteNumeroComZero(event)" maxlength="2 "class="text_box" style="width:15%">
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
	
			<table width="380" cellpadding="3" cellspacing="3" align="center">
            	<tr>
                	<td><a href="default.jsp"><img src="imgs/layout/comprar_mais.gif"/></a></td>
                    <td><img src="imgs/layout/finalizar_pedido.gif"/ onClick="validaPost()"></td>                                
                </tr>
            </table> 
            </form>        	             
		</div>			
		</td>
	</tr>
</table>

		<div id="copy">
			<%@ include file="/copy.jsp" %>         
	    </div>
    </div>
</div>
</body>
</html>
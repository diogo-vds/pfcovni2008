<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*"%>
<%@page import="ovni.negocio.*"%>
<%@page import="ovni.util.*"%>
<%

	//Define atributos para o pedido
		PedidoDesktopWAP pedido = (PedidoDesktopWAP) session.getAttribute("oPedido");
		int iPosicao;
		String sDescricao;
		float fValorUnitario;
		float fValorPromocao = 0;
		int iQuantidade;
		float fValorTotalItem;
		float fValorTotalCompra;
		double dValorFrete;	
		
	//Define atributos para os dados do cartao
		CartaoCredito cartao = new CartaoCredito();
		if (session.getAttribute("dadosCartao") != null)
		{	cartao = (CartaoCredito) session.getAttribute("dadosCartao") ;}

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Resumo do Pedido</title>
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
        	<form name="frmResumo" method="Post" action="/ovni/FinalizarPedidoDesktopWAP">
	        	<input type="hidden" name="flag" value="fecharPedido">
	        

			<table width="650" align="center">
				<tr>
					<td class="texto11bold_green"> Produtos do carrinho: </td>
				</tr>
			</table>      
			<table width="650" align="center" class="borda_cinza">
					<tr>
		    			<th width="70%" >Descricao		</th>
                        <th width="15%" >Unitario (R$)	</th>
                        <th width="5%" >Qtd				</th>
                        <th width="10%" >Total(R$)		</th>
			        </tr>
  			        <%
						for (int iCont = 0; iCont < pedido.getNumeroItens(); iCont++ )
						{
							String sCor = (iCont % 2 == 0 ) ? "#fafafa" : "#ffffff";	
							iPosicao = iCont;	
							sDescricao = pedido.getItem(iCont).getProduto().getTitulo();
							fValorUnitario = pedido.getItem(iCont).getProduto().getValor();
							if (pedido.getItem(iCont).getProduto().getValorPromocional() != 0)
								{ fValorPromocao = pedido.getItem(iCont).getProduto().getValorPromocional() ;}
							iQuantidade = pedido.getItem(iCont).getQuantidade();
						    fValorTotalItem = pedido.getItem(iCont).getValorItem();
					%>					
						<tr style="background-color:<%=sCor%>"> 
								<td align="center"> <%=sDescricao%> 					</td>
								<% 	if (pedido.getItem(iCont).getProduto().getValorPromocional() != 0) { 	%>
				    				<td align="center"> <s><%=Moeda.toReal(fValorUnitario)%></s> <b><%=Moeda.toReal(fValorPromocao)%></b></td>
				    			<%}// final do if fValorPromocao
				    			  else { %>
				    			  	<td align="center"> <%=Moeda.toReal(fValorUnitario)%> </td>
				    			 <% }%>
								
								<td align="center"> <%=iQuantidade%> 					</td>
								<td align="center"> <%=Moeda.toReal(fValorTotalItem)%> 	</td>
							</tr>
					<%    
						} // final do for pedido
					%>
				</table>
				<br><br>
				<table width="650" align="center" class="borda_cinza">
					<tr>
						<th width="10%" ></th>
                        <th width="90%" ></th>
					</tr>
					<tr>
						<td class="texto11bold_green"> Endereco: </td> 
						<td align="left"> <%=pedido.getEndereco().getRua()%>, n.<%=pedido.getEndereco().getNumero()%> - <%=pedido.getEndereco().getMunicipio()%> - Bairro <%=pedido.getEndereco().getBairro()%> - CEP <%=pedido.getEndereco().getCep()%> </td>
								
					</tr>
				</table>
				<br><br>
					<table width="650" align="center" class="borda_cinza">
					<tr>
						<th width="20%" ></th>
                        <th width="80%" ></th>
					</tr>
					<tr>
						<td class="texto11bold_green"> Forma de pagamento:			</td> 
						<td align="left"> <%=pedido.getTipoFormas().getDescricao()%></td>								
					</tr>
				</table>
				<br><br>
				<% 
				if (pedido.getTipoFormas().isTEF())
				{
					long numeroCartao = pedido.getCartao().getnumeroCartao();
					int codigoSegura =  pedido.getCartao().getcodigoSeguranca();
					String nomeImpresso = pedido.getCartao().getNomeCartao();
					int dtMesValidade	= pedido.getCartao().getMesValidade();
					int dtAnoValidade	= pedido.getCartao().getAnoValidade();
					int qtdParcelas		= pedido.getCartao().getParcelas();
				%>
					<br>
					<table width="650" align="center">
						<tr>
							<td class="texto11bold_green"> Dados do cartao: </td>
						</tr>
					</table>
					<table width="650" align="center" class="borda_cinza">
						<tr>
							<th width="20%">Numero Cartao	</th>
							<th width="15%">Codigo Seguranca</th>
							<th width="30%">Nome Impresso	</th>
							<th width="15%">Data Validade	</th>
							<th width="10%">Parcelas 		</th>
						</tr>
						<tr>
							<td align="center"> <%=numeroCartao%>						</td>
							<td align="center"> <%=codigoSegura%>						</td>
							<td align="center"> <%=nomeImpresso%>						</td>
							<td align="center"> <%=dtMesValidade%> / <%=dtAnoValidade%> </td>
							<td align="center"> <%=qtdParcelas%>						</td>
						<tr>
					</table>
				
				<%
				}//final do IF
				%>
				<br><br>
				<table width="200" align="center" class="borda_cinza" >
					<tr>
						<th width="65"> </th>
						<th width="35"> </th>
					</tr>
					<tr>
						<td align="right"> Valor Frete: </td>
						<td align="right">  <%= Moeda.toReal(pedido.getValorFrete())%> R$</td>
					</tr>
					<tr>
						<td align="right"> Taxa <%=pedido.getTipoFormas().getDescricao()%>: </td>
						<td align="right"> <%= Moeda.toReal(pedido.getTipoFormas().getTaxa())%> R$</td>
					</tr>
					<tr>
						<td align="right" class="texto11bold_red"> Total do pedido: </td>
						<td align="right"> <%= Moeda.toReal(pedido.getvalorTotal( ) + pedido.getTipoFormas().getTaxa() )%> R$</td>
					</tr>
				</table>							
				<table width="200"  align="right">
                	<tr>
                        <td><img src="<%=ContextPath%>/imgs/layout/finalizar_pedido.gif"/ onClick="this.document.frmResumo.submit()"></td>                                
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
				
				
				
						
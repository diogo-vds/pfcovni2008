<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.Usuario"%>
<%
	Usuario usu = (Usuario) session.getAttribute("Usuario");
	PedidoDesktopWAP pedido = (PedidoDesktopWAP) session.getAttribute("admAlteraPedido");
	int StatusSelecionado = pedido.getTipoStatus().getCodigo();
	
	
	TipoStatusPedido status = new TipoStatusPedido();
	ResultSet oRsStatus;
	oRsStatus = status.retornarTipos();
	
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
            <%@ include file="/admin/topo.jsp" %>
        </div>     
        <div id="content_full"> 
<br><br>
<%
	if (pedido != null)
	{
	%>
		<table width="700" align="center">
			<tr>
				<td class="texto11bold_green"> Dados Gerais </td> 
			</tr>
		</table>
		<table width="710" align="center" class="borda_cinza">
			<tr>
				<th width="07%">Num.					</th>
				<th width="12%">Data Pedido				</th>
				<th width="15%">Data Pagamento			</th>
				<th width="14%">Rastreamento			</th>
				<th width="10%">Pagamento				</th>
				<th width="08%"> Parcelas				</th>
				<th width="10%">Total R$				</th>				
				<th width="13%" >Status					</th>
			</tr>
			<tr style="background-color:#FFFFFF" align="center">
				<td> <%=pedido.getCodigo()%>							</td>
				<td> <%=Util.formatarData(pedido.getDataPedido())%>		</td>
				<td>				
					<% if( pedido.getDataPagamento() !=null) 
						{ out.println(Util.formatarData(pedido.getDataPagamento()));}
					%>	
				</td>
				<td>
					<% if( pedido.getCodigoRastreanemto() !=null) 
						{ out.println(pedido.getCodigoRastreanemto());}
					%>					
				</td>
				<td> <%=pedido.getTipoFormas().getDescricao()%>			</td>
				<td> <%=pedido.getQuantidadeParcelas()%>				</td>
				<td> <%=Moeda.toReal(pedido.getvalorTotal())%>	</td>
				<td> <%=pedido.getTipoStatus().getDescricao()%>			</td>
			</tr>
		</table>
		<br>
		<table width="700" align="center">
			<tr>
				<td class="texto11bold_green"> Itens do pedido </td> 
			</tr>
		</table>
		<table width="710" align="center" class="borda_cinza">
			<tr>
				<th width="58%">Produto		</th>
				<th width="14%">Valor R$	</th>
				<th width="14%">Quantidade	</th>
				<th width="14%">Total R$	</th>
			</tr>			
			<%			
			for (int iCont = 0; iCont < pedido.getNumeroItens(); iCont++)
			{
				String sCor = (iCont % 2 == 0 ) ? "#fafafa" : "#ffffff";
			%>
				<tr style="background-color:<%=sCor%>" >
					<td> <%=pedido.getItem(iCont).getProduto().getTitulo()%> 								</td>
					<td> <%=Moeda.toReal(pedido.getItem(iCont).getValorItem() / pedido.getItem(iCont).getQuantidade())%>	</td>
					<td> <%=pedido.getItem(iCont).getQuantidade()%>											</td>
					<td> <%=Moeda.toReal(pedido.getItem(iCont).getValorItem())%> 							</td>
				</tr>			
			
			<%
			}//final do for
			%>
		</table>
		<br>
		<table width="710" align="center" class="borda_cinza">
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
		<table width="300" align="center" class="borda_cinza">
		<form name="frmAlterarPedido" method="post" action="/ovni/AlterarPedido">
		<input type="hidden" name= "flag" value="Alterar">
			<tr>
				<th width="40%" ></th>
	            <th width="60%" ></th>
			</tr>
			<tr>
				<td class="texto11bold_green"> Codigo de Rastreamento: </td>
				<td align="left"> <input type="text" name="codRastreamento"></td> 										
			</tr>
			<tr>
				<td class="texto11bold_green"> Status do Pedido: </td>
				<td align="left">
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
					</select>
				</td> 										
			</tr>
			<tr>
				<td></td>
				<td align="right"><input type="submit" value="Registrar"></td>
			<tr>
		</form>
		</table>		
		
	<%
	} //final do if
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


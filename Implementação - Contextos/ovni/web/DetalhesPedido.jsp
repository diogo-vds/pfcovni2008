<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.Usuario"%>
<%
	Usuario usu = (Usuario) session.getAttribute("Usuario");
	ResultSet oRsItem = (ResultSet) request.getAttribute("Item");
	ResultSet oRsPedido = (ResultSet) request.getAttribute("Pedido");
	ResultSet oRsEndereco = (ResultSet) request.getAttribute("Endereco");
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
<%
	if (oRsPedido != null)
	{
	%>
		<table width="700" align="center" class="borda_cinza">
		<tr>
			<h1>Dados Gerais</h1>
		</tr>
			<tr>
				<th width="1%" >Pedido</th>
				<th width="15%" >Data Pedido</th>
				<th width="20%" >Data Pagamento</th>
				<th width="20%" >Codigo de Rastreamento</th>
				<th width="10%" >Pagamento</th>
				<th width="5%" >Parcelas</th>
				<th width="5%" >Total</th>				
				<th width="25%" >Status</th>
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
				<td> <%=oRsPedido.getInt("Codigo")%>							</td>
				<td> <%=Util.formatarData(oRsPedido.getDate("DataPedido"))%>	</td>
				<td>				
					<% if( oRsPedido.getDate("DataPagamento")!=null) 
						{ out.println(Util.formatarData(oRsPedido.getDate("DataPagamento")));}
					%>		
				</td>
				<td>
					<% if( oRsPedido.getString("Rastreamento") !=null)
						{ out.println(oRsPedido.getString("Rastreamento")); }
					%> 		
				</td>
				<td> <%=oRsPedido.getString("Pagamento")%>						</td>
				<td> <%=oRsPedido.getString("Parcelas")%>						</td>
				<td> <%=Util.formatarDouble(oRsPedido.getDouble("TotalPedido"))%></td>
				<td> <%=oRsPedido.getString("Status")%>							</td>
			</tr>
<%
				if ( (usu.getTipoUsuario() == 3) || (usu.getTipoUsuario() == 5) )
				{ 
%>
			<tr>
				<td colspan="8">
					<form name="frmAlterarPedido" method="post" action="/ovni/AlterarPedido">
						<input type="hidden" name="CodigoPedido" value="<%=oRsPedido.getInt("Codigo")%>">
						<input type="hidden" name="Status" value="<%=oRsPedido.getString("CodStatus")%>">
						<input type="hidden" name="Flag" value="Recuperar">
						<input type="submit" value="Alterar este pedido">
					</form>
				</td>
			</tr>
<%
				} //Final if ( (usu.getTipo = 3) | (usu.getTipo = 5)
%>
			</table>

		<%
		iCont++;
		
		}//final do while(oRsPedido.next())
		%>
		
		<br><br>
		<%		
	}//Final do if (oRsPedido != null)
	else
	{
	%>
		Sem Pedidos.
	<%
	}//Final do else
	

	if(oRsItem !=null)
	{
%>
		<table width="700" align="center" class="borda_cinza">
		<tr>
			<h1>Itens do Pedido</h1>
		</tr>
		<tr>
				<th width="1%" >Produto</th>
				<th width="15%" >Valor</th>
				<th width="20%" >Quantidade</th>
				<th width="20%" >Total</th>
		</tr>
<%
		String cor ="";
		int iCont = 0;
		while(oRsItem.next())
		{
		if(iCont % 2 == 0)
		{ cor = "#ffffff";}
		else
		{ cor = "#fafafa";}
		
		%>
			<tr style="background-color:<%=cor%>" align="center">
				<td> <%=oRsItem.getString("Produto")%>				</td>
				<td> <%=Util.formatarDouble(oRsItem.getDouble("PrecoUnitario"))%>		</td>
				<td> <%=oRsItem.getInt("Quantidade")%>			</td>
				<td> <%=Util.formatarDouble(oRsItem.getDouble("Total"))%>			</td>
			</tr>
			
<%
		iCont++;
		}//final do while(oRsItem.next())
%>

		</table>	
<%
	}//FINAL DO IF if(oRsItem !=null)
%>
<br><br>
	<table width="700" align="center" class="borda_cinza">
	<tr>
		<h1>Dados do endere�o de entrega</h1>
	</tr>
	<tr>
		<th width="16%" >Logragouro</th>
		<th width="14%" >Numero</th>
		<th width="14%" >CEP</th>
		<th width="14%" >Bairro</th>
		<th width="14%" >Cidade</th>
		<th width="14%" >Estado</th>
		<th width="14%" >Receptor</th>
	</tr>
<%
	oRsEndereco.next();
%>
	<tr align="center">
		<td><%=oRsEndereco.getString("Rua")%>		</td>
		<td><%=oRsEndereco.getString("Numero")%>	</td>
		<td><%=oRsEndereco.getString("CEP")%>		</td>
		<td><%=oRsEndereco.getString("Bairro")%>	</td>
		<td><%=oRsEndereco.getString("Cidade")%>	</td>
		<td><%=oRsEndereco.getString("Estado")%>	</td>
		<td><%=oRsEndereco.getString("Receptor")%>	</td>
	</tr>
	</table>

 
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


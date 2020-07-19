<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*"%>
<%@page import="ovni.negocio.*,ovni.util.*"%>
<%
	TipoProduto oTipo = new TipoProduto();
	Vector _TiposProdutosLista = (Vector) oTipo.BuscarTodosTipos(); 
	Vector listaProdutos = (Vector) session.getAttribute("produtosPromo"); 
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Escolha um Endere&ccedil;o</title>
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
            <%@ include file="/admin/topo.jsp" %>
        </div>        
        <div id="content_full">
        
        <table width="300" align="center" class="borda_cinza">
			<tr>
				<h1>Escolha o tipo de produto para promoção</h1>
			</tr>
			<tr>
			<td>
		        <form name="frmPromocao" method="post" action="/ovni/Promocao">
		        	<input type="hidden" name="flag" value="buscaTipo">
		        	<select style="width:110px" name="tipobusca">
		              	<option value="0">Todas as Lojas</option>
		              		<%      
		              		for(int i=0;i< _TiposProdutosLista.size();i++)
		              		{%>                                 
		                  		 <option value="<%= ((TipoProduto)_TiposProdutosLista.get(i)).getCodigo() %>"><%=((TipoProduto)_TiposProdutosLista.get(i)).getDescricao()%></option>
		                   <%}%>
		              </select>
				 </form>
		        
			</td>  
			<td align="right">
				<input type="image" onClick="frmPromocao.submit()" src="<%=ContextPath%>/imgs/buttons/btnPesquisarMini.gif"/>
			</td>
		    </tr>
		</table>

<%

if (listaProdutos != null)
{
	if (listaProdutos.size() > 0)
	{
	%>
		<form name="frmProdutosEscolhidos" method="post" action="/ovni/Promocao">
		<input type="hidden" name="flag" value="ProdutosEscolhidos">
		<table width="350" align="center" class="borda_cinza">
		<tr>
			<th width="5"> </th>
			<th width="75"> Titulo</th>
			<th width="20"> ValorR$</th>
		</tr>		
	<%
		for (int iCont = 0; iCont < listaProdutos.size(); iCont++)
		{
			String sCor = (iCont % 2 == 0 ) ? "#fafafa" : "#ffffff";
		%>
			<tr style="background-color:<%=sCor%>">
				<td> <input type="checkbox" name="produtoEscolhido" value="<%=iCont%>"></td>
				<td> <%=((Produto)listaProdutos.elementAt(iCont)).getTitulo()%></td>
				<td> <%=Moeda.toReal(((Produto)listaProdutos.elementAt(iCont)).getValor())%> </td>
			</tr>
	
		<%
		}//final do for
		%>
		
		</table>
		<%	
	}//final do if (listaProdutos.size() > 0)
	else
	{
		%> Nenhum produto encontrado <%
	}
} //final do if (listaProdutos != null)
%>
      <input type="submit" value="Selecionar Estes Produtos">
        </form>
        
        
		<br><br>
		<table width="199" align="center" >
			<tr>
				<td align="right"> 
					<form name="frmDadosPromocao" method="post" action="/ovni/Promocao">
	        			<input type="hidden"  name="flag" value="listarPromocoes">
	        			<input type="submit" value="Visualizar Promocoes">
	        		</form>
				</td>
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
</div>
</body>
</html>
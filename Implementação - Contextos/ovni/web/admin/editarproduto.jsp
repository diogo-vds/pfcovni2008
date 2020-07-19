<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Alterar Produto</title>
		<style>
			@import url("styles/styles.css");
		</style>		
<script>
	function Excluir(){
		document.form3.action="/ovni/ExcluirProduto";
			document.form3.submit();
	}
	function Alterar(){
		document.form3.action="/ovni/AlterarProduto";
		document.form3.submit();
	}
	function inserir(){
		window.parent.location="/ovni/inserirproduto.jsp"
	}
	function Pesquisar(){
		document.form1.submit();
	}
</script>
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
	<!-- Form de pesquisa -->

	<%
		if(request.getAttribute("status")!=null){
			out.print("<b>"+request.getAttribute("status"));	
		}
		Produto prod = null;
	%>
	<form method="post" name="form1" action="/ovni/EditarProduto">
      <table align="center" width="400px" class="borda_azul">
           	<tr>
               	<th height="20" colspan="3"> Pesquisar Produtos </th>
            </tr>
                 <tr>
                  	  <td height="28" class="label"> Tipo de Pesquisa:</td>
               		    <td> 
							<input type="hidden" name="acao" value="listar">
                        	<select name="TipoPesquisa" >
                              <option value=0>Titulo</option>
                              <option value=999996>Autor</option>
                              <option value="999997">Código</option>
                   		  </select>
                       </td>
                       <tr>
                    		<td height="30" class="label"> Descrição:</td>
							<td><input type="text" name="Titulo" class="text_box"> </td>
					   </tr>
                    </tr>
                    <tr>
                    	<td colspan="3" align="center">
                          <input type="image" src="<%=ContextPath %>/imgs/buttons/btnPesquisar.gif" onClick="Pesquisar()">&nbsp;&nbsp;
                          <input type="image" src="<%=ContextPath %>/imgs/buttons/btnCancelar.gif" onClick="this.form.reset()" >&nbsp;&nbsp;
                          <a href="inserirproduto.jsp"><img src="<%=ContextPath %>/imgs/buttons/btnInserir.gif"/></a>
                      </td>
                    </tr>                	
                </table>
   		  </form>

	<!-- Exibe a lista de produtos encontrados -->
	<%if("selecionar".equals(request.getAttribute("acao"))){
		%>
			<table>
			<tr>
				
				<td><b>Código</b></td>
				<td><b>Título</b></td>
				<td><b>Autor</b></td>
				<td></td></tr>				
		<%
		Vector<Produto> lista = (Vector) request.getAttribute("lista");
		for(int i=0;i<lista.size();i++){
			prod = lista.get(i);
		%>
		<form name="form2" method="post">
			<input type="hidden" name="acao" value="detalhes">
			<input type="hidden" name="cod" value="<%=prod.getCodigo()%>">
		 <tr>
			<td><%=prod.getCodigo()%></td>
			<td><%=prod.getTitulo()%></td>
			<td><%=prod.getAutorartista()%></td>
			<td><input alt='Detalhes de <%=prod.getCodigo()%>' type="image" 
				onClick="detalhes(<%=prod.getCodigo()%>)" src="imgs/layout/Edit.gif"/>
				</td>
		</tr></form>
		<%}
		%>
			</table>
		<%
	}else if("detalhes".equals(request.getAttribute("acao"))){
		prod = (Produto)request.getAttribute("produto");
		%><!-- Exibe dados do Produto para edição -->
		<form name="form3" method="post">
		<table>
		<input type="hidden" value="<%=prod.getCodigo()%>" name="codigo">
		<tr>
 			 	<td class="label"> Titulo</td>
 				<td> <input type="text" name="titulo" class="text_box" style="width:98%" value="<%=prod.getTitulo()%>"></td>
 				<td class="label">Resumo</td>
 				<td> <input type="text" name="resumo" class="text_box" value="<%=prod.getResumo()%>"></td>
 			</tr>
 			<tr>
 				<td class="label"> Peso</td>
 				<td> <input type="text" name="peso" class="text_box" value="<%=prod.getPeso()%>"></td>
 				<td class="label"> Valor</td>
 				<td> <input type="text" name="valor" class="text_box" value="<%=prod.getValor()%>"></td>
 			</tr>
			<tr>
 				<td class="label"> Unidade</td>
 				<td> <input type="text" name="unidade" class="text_box" value="<%=prod.getUnidade()%>"></td>
  				<td class="label"> IPI</td>
 				<td> <input type="text" name="ipi" class="text_box" value="<%=prod.getIpi()%>"></td>
 			</tr>	
 			<tr>
 				<td class="label"> Icms</td>
 				<td> <input type="text" name="icms" class="text_box" value="<%=prod.getIcms()%>"> </td>
 				<td class="label"> ClassFiscal</td>
 				<td> <input type="text" name="classfiscal" class="text_box" value="<%=prod.getClassfiscal()%>"></td>
 			</tr>
 			<tr>
 				<td class="label"> Procedencia</td>
 				<td> <input type="text" name="procedencia" class="text_box" value="<%=prod.getProcedencia()%>"></td>
 				<td class="label"> PaisOrigem</td>
 				<td> <input type="text" name="paisorigem" class="text_box" value="<%=prod.getPaisorigem()%>"></td>
 			</tr>
  			<tr>
 				<td class="label"> Ano Lancamento</td>
 				<td> <input type="text" name="anolancamento" class="text_box" value="<%=prod.getAnolancamento()%>"></td>
 				<td class="label"> Autor Artista</td> 
 				<td> <input type="text" name="autorartista" class="text_box" value="<%=prod.getAutorartista()%>"></td>
 			</tr>
 			<tr>
 				<td class="label"> Idioma</td>
 				<td> <input type="text" name="idioma" class="text_box" value="<%=prod.getIdioma()%>"></td>
 				<td class="label"> Fornecedor</td>
 				<td> <input type="text" name="fornecedor" class="text_box" value="<%=prod.getFornecedor()%>"></td>
 			</tr>
 			<tr>
 				
				<td colspan="4" align="center" ><b>Detalhes Especificos </td>
				
 			</tr>
			<tr>
			<%
				Vector<DetalhesEspecificos> detalhes = prod.getDetalhesEspecificos();
				request.getSession().setAttribute("detalhes",detalhes);
				for(int i=0;i<detalhes.size();i++){
					if(i%2==0){
						%></tr><tr>
					<%}%>
 				<td class="label"> <%=detalhes.get(i).getCaracteristica() %></td>
 				<td> <input type="text" name="<%=i%>" class="text_box" value="<%=detalhes.get(i).getConteudo()%>"></td>
			<%}%>
			
			</tr><tr>
              	<td colspan="2" align="center">
                   <input type="image" src="imgs/buttons/btnAlterar.gif" onClick="Alterar()">
                   <input type="image" src="imgs/buttons/btnDeletar.gif" onClick="Excluir()">
				   <input type="image" src="imgs/buttons/btnCancelar.gif" onClick="this.form.reset()" >
                </td>				
            </tr></table></form>            	
	<%}

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

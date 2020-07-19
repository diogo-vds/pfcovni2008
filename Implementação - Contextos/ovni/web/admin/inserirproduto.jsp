<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="ovni.negocio.Produto" %>
<%@ page import="util.*"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.math.*" %>
<%@ page import="java.lang.Object"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Cadastro de Produtos</title>
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

	<%
		Produto prod;
		String acao;
		Vector<DetalhesEspecificos> detalhes;
		Vector<Object> campos = (Vector<Object>)request.getAttribute("campos");
		if(request.getAttribute("status")==null){
			acao = "tipo";
			request.setAttribute("acao",acao);
			response.sendRedirect("/ovni/InserirProduto");
		}else{
			String status = (String)request.getAttribute("status");
			if("tipo".equals(status)){
				%>	 
					<form name="formtipo" action="/ovni/InserirProduto" method="post">
					<table>
					  <tr>
						<td><b>Tipo de Produto:</b></td>
						<td><select name="tipo">
							<%
								acao = "genero";							
								for(int i=0;i<campos.size();i++){
							%>
								<option value="<%=campos.get(i)%>">
									<%i++;%>
									<b><%=campos.get(i)%></b>
								</option>
								<%}%>
							</select>
							<input type="hidden" name="acao" value="<%=acao%>">
						</td>
						<td><input type="submit" value="Ok"></td>
					  </tr>
					  </table>
				    </form>
			<%}else if("genero".equals(status)){
				%>	
				<form name="formgenero" action="/ovni/InserirProduto" method="post">
				<table>
				  <tr>
					<td><b>Gênero:</b></td>
					<td><select name="genero">
						<%
							acao = "categoria";
							for(int i=0;i<campos.size();i++){
						%>
							<option value="<%=campos.get(i)%>">
								<%i++;%>
								<b><%=campos.get(i)%></b>
							</option>
							<%}%>
						</select>
						<input type="hidden" name="acao" value="<%=acao%>">
					</td>
					<td><input type="submit" value="Ok"></td>
				  </tr>
				  </table>
			    </form>
			<%}else if("categoria".equals(status)){
				%>	
				<form name="formcategoria" action="/ovni/InserirProduto" method="post">
				<table>
				  <tr>
					<td><b>Categoria:</b>
					<select name="categoria">
						<%
							acao = "inserir";
							for(int i=0;i<campos.size();i++){
						%>
							<option value="<%=campos.get(i)%>">
								<%i++;%>
								<b><%=campos.get(i)%></b>
							</option>
							<%}%>
						</select>
						<input type="hidden" name="acao" value="<%=acao%>">
					</td>
				  </tr> 
			<tr>
 			 	<td class="label"> Titulo</td>
 				<td> <input type="text" name="titulo" class="text_box" ></td>
 				<td class="label">Resumo</td>
 				<td> <input type="text" name="resumo" class="text_box"></td>
 			</tr>
 			<tr>
 				<td class="label"> Peso</td>
 				<td> <input type="text" name="peso" class="text_box"></td>
 				<td class="label"> Valor</td>
 				<td> <input type="text" name="valor" class="text_box"></td>
 			</tr>
			<tr>
 				<td class="label"> Unidade</td>
 				<td> <input type="text" name="unidade" class="text_box"></td>
  				<td class="label"> IPI</td>
 				<td> <input type="text" name="ipi" class="text_box"></td>
 			</tr>	
 			<tr>
 				<td class="label"> Icms</td>
 				<td> <input type="text" name="icms" class="text_box"> </td>
 				<td class="label"> ClassFiscal</td>
 				<td> <input type="text" name="classfiscal" class="text_box"></td>
 			</tr>
 			<tr>
 				<td class="label"> Procedencia</td>
 				<td> <input type="text" name="procedencia" class="text_box"></td>
 				<td class="label"> PaisOrigem</td>
 				<td> <input type="text" name="paisorigem" class="text_box"></td>
 			</tr>
  			<tr>
 				<td class="label"> Ano Lancamento</td>
 				<td> <input type="text" name="anolancamento" class="text_box"></td>
 				<td class="label"> Autor Artista</td> 
 				<td> <input type="text" name="autorartista" class="text_box"></td>
 			</tr>
 			<tr>
 				<td class="label"> Idioma</td>
 				<td> <input type="text" name="idioma" class="text_box"></td>
 				<td class="label"> Fornecedor</td>
 				<td> <input type="text" name="fornecedor" class="text_box"></td>
 			</tr> 			
 			<tr>
 				<td colspan="4" align="center"><b>Detalhes Especificos </td>

 			</tr>
			<tr>			
		<%
			detalhes =(Vector<DetalhesEspecificos>) request.getSession().getAttribute("detalhes");
			acao = "imagem";  
			for(int i=0;i<detalhes.size();i++){
				if(i%2==0){
					%></tr><tr><%	
				}%>
				<td class="label"><%=detalhes.get(i).getCaracteristica()%></td>
				<td><input type="text" class="text_box" name="<%=i %>"></td>	
			<%}
		%>	
			</tr><tr><td><input type="submit" value="Ok"></td></tr>
			</table></form>
<!--		 Espaço para upload de imagens -->
		<%
		}else if("imagem".equals(status)){
			out.print("<b>Enviar Imagem");
			String codprod = (String)request.getAttribute("prod");
			request.getSession().setAttribute("codprod",codprod);
			//Espaço reservado ao código de upload de imagens!!!%>
			<form method="POST" action="/ovni/Upload?acao=<%=codprod %>" enctype="multipart/form-data">   
			   <input type="file" name="arquivo">   
			   <input type="submit" value="Salvar">   
			</form>  

	<%	}else{%>
			
	  <%}
		}
	%>
	
  </div> 
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
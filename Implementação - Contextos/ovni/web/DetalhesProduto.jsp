<%@page session="true"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="ovni.negocio.*,ovni.util.*"%>
<%

	Produto _Produto = (Produto) request.getAttribute("Produto");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OVNI.net - Ofertas de outro mundo - Detalhes do Produto</title>
	<style>
		@import url("styles/styles.css");
	</style>

    <style type="text/css" media="screen">
    <!--
		UL.tabNavigation {
		    list-style: none;
		    margin: 0;
		    padding: 0;
		}

		UL.tabNavigation LI {
		    display: inline;
		}

		
		
		UL.tabNavigation LI A:focus {
			outline: 0;
		}
		
		div.tabs > div h2 {
			margin-top: 0;
		}

		#first {
		    background-color: #fff;
		    border-top:1px solid #6B6BCB;
		    padding: 3px 3px 3px 3px;
		}

		#second {
		    background-color: #fff;
		   	border-top:1px solid #F55524;
		   	padding: 3px 3px 3px 3px;
		}
		
		.tabs
		{
			width:70%;
		}
	

	-->
    </style>
    
	<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8">
		$(function () {
			var tabContainers = $('div.tabs > div');
			tabContainers.hide().filter(':first').show();
			
			$('div.tabs ul.tabNavigation a').click(function () {
				tabContainers.hide();
				tabContainers.filter(this.hash).show();
				$('div.tabs ul.tabNavigation a').removeClass('selected');
				$(this).addClass('selected');
				return false;
			}).filter(':first').click();
		});
	</script>
	
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
<div id="menu">
<%@ include file="/menu.jsp" %>                 
</div>       
<div id="content">

	<br/><br/>
	<img src="imgs/layout/detalhes_produto.gif"">
		<br/>
	<br/> 
	<form action="/ovni/InserirCarrinho" method="post">					

	<table width="450"  class="tab_form" align="center">
	<tr>
	<td rowspan="4" class="imagem_vitrine" ><img src="<%=_Produto.getURLImagem()%>" /> </td>
	<td class="texto19bold_green"><%=_Produto.getTitulo()%></td>
	</tr>
	<tr>					
	<td valign="top" class="texto11normal_gray"><%=_Produto.getAutorartista()%></td>
	</tr>			
	<tr>					
	<td class="texto17bold_red">
	
		<%if(_Produto.getValorPromocional() == 0){  %>
	
			R$ <%=_Produto.getValor()%>
			
		<%}else{ %>
		
			<div class="texto19bold_green" style="font-size:12px">de R$ <strike> <%=_Produto.getValor()%> </strike></div><br>
			por R$ <%=_Produto.getValorPromocional()%> <br>
		
		<%} %>
	
	
	</td>
	</tr>
	<tr>					
	<td><div align="right">
	<input name="image" type="image" onClick="this.form.submit()" src="./imgs/buttons/btnComprar.gif" alt='Comprar'/>
	</div></td>	
	</tr>
	<tr>
	<td colspan="2" class="texto12bold_green" >Detalhes</td>
	</tr>
	<tr>
	<td class="td_detalhes">Peso:</td>
	<td><div align="left"><%= _Produto.getPeso()%></div></td>
	</tr>
	<tr>
	<td class="td_detalhes">Procedência:</td>
	<td><div align="left"><%=_Produto.getProcedencia()%></div></td>
	</tr>
	<tr>
	<td class="td_detalhes">País:</td>
	<td><div align="left"><%=_Produto.getPaisorigem()%></div></td>
	</tr>
	<tr>
	<td class="td_detalhes">Lançamento:</strong></td>
	<td><div align="left"><%=_Produto.getAnolancamento()%></div></td> 
	</tr>
	<tr>
	<td class="td_detalhes">Idioma:</td>
	<td><div align="left"><%=_Produto.getIdioma()%></div></td> 
	</tr>
	
	<tr>
	<td height="30px" valign="top" class="td_detalhes">Resumo:</td>
	<td height="30px" valign="top"><div align="left"><%=_Produto.getResumo()%></div></td> 
	</tr>
	<tr>
	<td colspan="2" height="10px"><input type="hidden" name="Codigo_Produto" value="<%=_Produto.getCodigo()%>"></td>		                                    
	</tr>
	</table>
	</form>
	
	<form name="avaliar" action ="/ovni/AvaliarProduto" method="post">
	<div align="right">
	<%
		long codprod = _Produto.getCodigo();
		request.getSession().setAttribute("codigoproduto", codprod);
		String acao = "verificar";
		request.getSession().setAttribute("acao", acao);
		%>
	<input type="hidden" name="codigoproduto" value="<%=_Produto.getCodigo()%>">
	<input name="image" type="image" onClick="this.form.submit()" src="./imgs/buttons/btnAvaliarProduto.gif" alt='Avaliar <%=_Produto.getTitulo()%>'/>
	</div>
	</form>
	
	    <div class="tabs" style="text-align:left">
        <ul class="tabNavigation">
            <li><a href="#first" ><img src="/ovni/imgs/buttons/tabDetalhes.gif"/></a></li>
            <li><a href="#second" ><img src="/ovni/imgs/buttons/tabAvaliacoes.gif"/></a></li>
        </ul>
        <div id="first">
           <p>            
            <table>
            <tr>
			<td class="td_detalhes">Categoria:</td>
			<td><div align="left"><%=_Produto.getDescricao_categoria()%></div></td> 
			</tr>
			<tr>
			<td class="td_detalhes">Gênero:</td>
			<td><div align="left"><%=_Produto.getDescricao_genero()%></div></td> 
			</tr>
            <% //Detalhes Especificos %>
			<% int i = 0; %>
			<% while(i < _Produto.getDetalhesEspecificos().size()) {%>
			<tr>
			<td  class="td_detalhes"><%=((DetalhesEspecificos)_Produto.getDetalhesEspecificos().get(i)).getCaracteristica()%>:</td>
			<td ><div align="left"><%=((DetalhesEspecificos)_Produto.getDetalhesEspecificos().get(i)).getConteudo()%></div></td>								 		
			</tr>
			<%i++;}%>
            </table>
            
            </p>
        </div>
        <div id="second">
            <p>
            	<% //Avalições %>
				<% if(_Produto.getAvaliacoes().size() != 0 ) { %>
              	  <%for(int j=0;j<_Produto.getAvaliacoes().size();j++){ %>
              			<div style="text-align:left;">"<%=((Avaliacao)_Produto.getAvaliacoes().get(j)).getAvaliacao()%>"</div>
              			<div style="text-align:right;">por <%=((Avaliacao)_Produto.getAvaliacoes().get(j)).getUsuario()%></div><br>
               		<%} %>
               	<% }else{ %>
               		<div class="texto11bold_red" style="text-align">Nenhum cliente opinou por este produto</div>
               	<% } %>
            </p>
        </div>
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

		
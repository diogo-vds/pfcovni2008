
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.negocio.*" %>
<%
			int TotalItens = 0;
            TipoProduto oTipo = new TipoProduto();
            Vector _TiposProdutosLista = (Vector) oTipo.BuscarTodosTipos();            
            Carrinho oCarrinho = (Carrinho) session.getAttribute("oCarrinho");
            
            if(oCarrinho != null)TotalItens = oCarrinho.getNumeroItens();
%>

<%
	//Recupera o Nome do Contexto
	String ContextPath = request.getContextPath();
%>

<html>
<head>
	<style>@import url(<%=ContextPath%>/styles/styles.css);</style>
    
    <%
		int  TipoProd = 0;
		String  css = ""; 
		if(request.getParameter("tipo") != null )TipoProd = Integer.parseInt(request.getParameter("tipo"));			
    
   		switch(TipoProd)
   		{
   			//CSS para tipos de produtos
			case 1 : css = "<style>@import url(" + ContextPath + "/styles/livro.css);</style>";break;
			case 2 : css = "<style>@import url(" + ContextPath + "/styles/dvd.css);</style>";break;
			case 3 : css = "<style>@import url(" + ContextPath + "/styles/cd.css);</style>";break;
			default : css = "<style>@import url(" + ContextPath + "/styles/default.css);</style>";break;
   		}
		
	 %>
	 
	 <%=css %>
    
    
    <script>
		function popUp(url)
		{
			window.open(url,'','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=420,height=300');  
		}
		
	</script>
	<script type="text/javascript" src="js/wz_tooltip.js"></script>
</head>
<body>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="topo_esq"></td>
            <td class="topo_cent" align="right">
            <div style="float:left;padding-left:17px;height:100%;">
            	<a href="<%=ContextPath%>/default.jsp"><img src="<%=ContextPath%>/styles/imagens/logo.jpg"/> </a>           
            </div>            
            <div style="float:right;text-align:right;height:100%;">
           	  <table align="right" width="470px" cellpadding="3" cellspacing="3">
                	<tr>
                    	<!-- Avaliações -->
                   	  <td width="7%" nowrap> <a onClick="popUp('/ovni/VisualizarAvaliacoes')" href="#"><img src="<%=ContextPath%>/imgs/buttons/btnAvaliarSite.gif"/></a></td>
                        <td width="19%" nowrap style="text-align:left"> <a onClick="popUp('/ovni/VisualizarAvaliacoes')" href="#"> Avaliações do Site </a></td>
                        
                      <!-- Meus Dados -->
                      <td width="7%" nowrap> <a href="<%=ContextPath%>/VisualizarUsuario"><img src="<%=ContextPath%>/imgs/buttons/btnMeusDados.gif"/></a></td>
                      <td width="14%" nowrap style="text-align:left"> <a href="<%=ContextPath%>/VisualizarUsuario">Meu Cadastro</a></td>
                       
                         <!-- Central do Usuário-->                        
                      <td width="7%" nowrap> <a href="<%=ContextPath%>/loggin/central_usuario.jsp"><img src="<%=ContextPath%>/imgs/buttons/btnCentralUsuario.gif"/></td>
                     	 <td width="17%" nowrap style="text-align:left"> <a href="<%=ContextPath%>/loggin/central_usuario.jsp"> Central de Usuário</a> </td>
                         
                         <%
							//Mostrar Sair somente para usuários logados		
							if(session.getAttribute("Usuario") != null) 
							{
	 					  %>
                      <td width="5%" nowrap><a href="<%=ContextPath%>/acesso.jsp"><img src="<%=ContextPath%>/imgs/buttons/btnSair.gif"/></a></td>
                           <td width="7%" nowrap style="text-align:left"><a href="<%=ContextPath%>/acesso.jsp"> Sair</a></td>
                           <%}%>
                         
                </tr>
              </table><br/><br/><br/>
              
              <table>
              	<tr>
              		<td>
              		<form action="/ovni/PesquisarProdutos" method="get">
              <table align="right" cellpadding="0" cellspacing="0" width="370px" >
                	<tr>                    	
                   	  <td class="pesq_esq"></td>
              <td class="pesq_cent" valign="middle">
              BUSCAR
                <input type="text" name="parambusca" style="width:90px">             
              <select style="width:110px" name="tipobusca">
              	<option value="0">Todas as Lojas</option>
              		<%      
              		for(int i=0;i< _TiposProdutosLista.size();i++)
              		{%>                                 
                  		 <option value="<%= ((TipoProduto)_TiposProdutosLista.get(i)).getCodigo() %>"><%=((TipoProduto)_TiposProdutosLista.get(i)).getDescricao()%></option>
                   <%}%>
              </select>
              </td>
               <td class="pesq_cent" valign="middle" width="40px">
               	<input type="image" onClick="this.form.submit()" src="<%=ContextPath%>/imgs/buttons/btnPesquisarMini.gif"/>
               <td class="pesq_dir"></td>
              </tr></table>
           	  </form>
              		</td>
              		<td  width="280px">
              		 <table align="right" cellpadding="3" cellspacing="3" >
                	<tr>                    	
                   	  <td width="15%" nowrap> <a href="<%=ContextPath%>/VisualizarCarrinho"><img src="<%=ContextPath%>/imgs/buttons/btnCarrinho.gif"/></a></td>
              <td width="85%" nowrap style="text-align:left;font-size:17px;font-weight:bold">Meu Carrinho [<%=TotalItens %>] <%if(TotalItens == 1) {%> item <%}else{ %> itens <%} %></td></tr></table>
              		
              		</td>
              	</tr>
              </table>
              
                           
             
              
            </div>
            </td>
            <td class="topo_dir"></td>
        </tr>
    </table>
      <div style="width:100%;" class="menu_cent">
      	<div style="text-align:left;padding-left:5px;padding-top:2px">
      	            <%
      	          for(int i=0;i< _TiposProdutosLista.size();i++)
            		{            			
                    %>                                 
                    <a href="/ovni/MontarVitrine?tipo=<%=((TipoProduto)_TiposProdutosLista.get(i)).getCodigo()%>"><%=((TipoProduto)_TiposProdutosLista.get(i)).getDescricao()%></a>&nbsp;&nbsp; 
                    <%}%>
                    </div>
      
      </div>      
            
</body>
</html>



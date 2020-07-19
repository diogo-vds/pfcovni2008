<%-- 
    Document   : vitrine
    Created on : 12/05/2008, 13:27:11
    Author     : Leo
--%>    
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="ovni.negocio.Vitrine"%>
<%@page import="ovni.negocio.Produto"%>


<%
			Vector vtProdutos =  new Vector();
			Vitrine oVit = new Vitrine();
									
			//Verifica se existe um resulset para montar vitrine
			if(request.getAttribute("vtPesquisaProdutos") != null)
			{
				vtProdutos = (Vector) request.getAttribute("vtPesquisaProdutos");
			}
			else
			{
				vtProdutos = (Vector) oVit.MontarVitrineDefault();
			}
			
			
           //Enquanto existir registros, listar produts

            if (vtProdutos.size() != 0) 
            {                
           %>
           
  Foram encontrados <%@page import="javax.xml.soap.Detail"%>
<%@page import="com.sun.xml.internal.messaging.saaj.soap.ver1_1.Detail1_1Impl"%>
<%@page import="ovni.negocio.DetalhesEspecificos"%>
<strong><%=vtProdutos.size() %></strong> produto(s) para a <strong>"<%=parampesquisa%>"</strong>         
           
  <table style="width:100%">      
		           <%
		           	int cont = 0;
		           	for(int i=0;i<vtProdutos.size();i++)
		                {
		                	cont++;
		                
		                %>
		                    <td style="width:25%">                    
		                        <form action="/ovni/VisualizarDetalhesProduto" method="get" name="<%=((Produto)vtProdutos.get(i)).getCodigo()%>">
		                             <div class="centro">
		                             	
		                             	                               
		                                <div style="width:100%;float:left;position:relative;vertical-align: top;">
		                                	<div  style="z-index:3">
		                                	<img src="<%=((Produto)vtProdutos.get(i)).getURLImagem()%>"/>
		                                	<div>
		                                	<%if(((Produto)vtProdutos.get(i)).getValorPromocional() != 0) { %>
		                                	<div style="width:50%;float:right;position:absolute;vertical-align: top;top:0;z-index:400">		                                	
		                                		<img src="<%=ContextPath%>/imgs/layout/golden_offer.png" alt="Produto em Promoção"/>
		                                	</div>	
		                               	<%} %>
		                                	 
		                                </div>
		                                <div class="texto12bold_green" style="clear:both"><%=((Produto)vtProdutos.get(i)).getTitulo()%></div>
		                                <div class="texto11normal_gray"><%=((Produto)vtProdutos.get(i)).getAutorartista()%></div>
		                                
		                                <%if(((Produto)vtProdutos.get(i)).getValorPromocional() == 0) { %>
		                                
		                                <div class="texto11bold_red">R$ <%=((Produto)vtProdutos.get(i)).getValor() %></div>
		                                <%}else{ %>
		                                 <div class="texto11normal_gray">de R$ <strike> <%=((Produto)vtProdutos.get(i)).getValor() %></strike></div>
		                                 <div class="texto11bold_red">R$ <%=((Produto)vtProdutos.get(i)).getValorPromocional() %></div>
		                                 <%} %>
		                                
		                                <div><input onmouseover="Tip('<b>Comprar <%=((Produto)vtProdutos.get(i)).getTitulo()%> </b>', WIDTH, 180, FADEIN, 400, FADEOUT, 400,BGCOLOR,'#FFFFFF',BORDERCOLOR,'#516A1B',FONTCOLOR,'#516A1B',OPACITY,78)" onmouseout="UnTip()" type="image" onClick="this.form.submit()" src="/ovni/imgs/buttons/btnComprar.gif"/>&nbsp;<img src="/ovni/imgs/buttons/btnAvalClientes.gif" onmouseover="TagToTip('avID<%=((Produto)vtProdutos.get(i)).getCodigo()%>', WIDTH, 300, FADEIN, 400, FADEOUT, 400,BGCOLOR,'#FFFFFF',BORDERCOLOR,'#F55524',OPACITY,78)" onmouseout="UnTip()" />&nbsp;<img src="/ovni/imgs/buttons/btnDetalhesProduto.gif" onmouseover="TagToTip('spID<%=((Produto)vtProdutos.get(i)).getCodigo()%>', WIDTH, 300, FADEIN, 500, FADEOUT, 500,BGCOLOR,'#FFFFFF',BORDERCOLOR,'#6B6BCB',OPACITY,78)" onmouseout="UnTip()" /><br /><br /></div>
		                                
		                                <input type="hidden" name="Codigo_Produto" value="<%=((Produto)vtProdutos.get(i)).getCodigo()%>">
		                                
		                                <span id="spID<%=((Produto)vtProdutos.get(i)).getCodigo()%>" style="text-align:left;font-size:10px;font-family:Arial">
		                                	<b>Detalhes de <%=((Produto)vtProdutos.get(i)).getTitulo()%></b><br><br>
		                                	
		                                	<strong>Artista:</strong> <%=((Produto)vtProdutos.get(i)).getAutorartista()%><br>
		                                	<strong>Peso:</strong> <%= Util.formatarDouble(((Produto)vtProdutos.get(i)).getPeso(),3)%> Kg<br>
		                                	<strong>Procedência:</strong> <%=((Produto)vtProdutos.get(i)).getProcedencia()%><br>
		                                	<strong>Categoria:</strong> <%=((Produto)vtProdutos.get(i)).getDescricao_categoria()%><br>
		                                	<strong>Ano:</strong> <%=((Produto)vtProdutos.get(i)).getAnolancamento()%><br>
		                                	<strong>Gênero:</strong> <%=((Produto)vtProdutos.get(i)).getDescricao_genero()%><br><br>
		                                	<div align="right" class="texto11bold_red" style="font-size:17px">R$ <%=((Produto)vtProdutos.get(i)).getValor()%></div>
		                                	
		                                </span>
		                               
		                               <span id="avID<%=((Produto)vtProdutos.get(i)).getCodigo()%>" style="text-align:left;font-size:10px;font-family:Arial">
		                                	<b style="color:#F55524">Avaliações para <%=((Produto)vtProdutos.get(i)).getTitulo()%></b><br><br>
		                                	
		                                	<% if(((Produto)vtProdutos.get(i)).getAvaliacoes().size() != 0 ) { %>
		                                	<% int inicio = 0;%>
		                                	<% int limite = 3;%>
		                                	<% 
		                                		if(((Produto)vtProdutos.get(i)).getAvaliacoes().size() < 3) limite = ((Produto)vtProdutos.get(i)).getAvaliacoes().size(); 	%>	
		                                		<%
		                                		for(int j=0;j<limite;j++){ %>
		                                			<div style="text-align:left;">"<%=((Avaliacao)((Produto)vtProdutos.get(i)).getAvaliacoes().get(j)).getAvaliacao()%>"</div>
		                                			<div style="text-align:right;">por <%=((Avaliacao)((Produto)vtProdutos.get(i)).getAvaliacoes().get(j)).getUsuario()%></div><br>
		                                		
		                                		<%} %>
		                                	
		                                	<% }else{ %>
		                                		<div class="texto11bold_red" style="text-align">Nenhum cliente opinou por este produto</div>
		                                	<% } %>
		                                </span>
		 
		                                 
		                            </div>                   
		                        </form>                   
		                 <%
		                 if(cont % 4 == 0){
		                 %>                        </td></tr><tr>
		                 <%}
		                 else{%>
		                   </td>
		                 <%}
		                  //cont++;
		                 }
						 %>
		                 
		                 
		        </tr>
		        </table>
		                 
		                 <%
						 
		            }
		            else 
		            {
		            %>
		                <br />
		                <br/>
		                <table align="center" width="350">
		                	<tr>
		                    <td width="20%"><img src="imgs/buttons/erro.gif"/></td>
		                    <td class="erro" width="80%" style="font-size:22px;text-align:center">Nenhum Produto encontrado! </td>
		                    </tr>
		                </table>
		                <br/>
		                <p>
		                	Clique <a href="default.jsp"> aqui</a> para retornar </p>
		                <br />
		                <br/>
		                     
		                
		            <%}%>
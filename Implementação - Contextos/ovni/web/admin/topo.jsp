
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.negocio.*" %>
<%
	//Recupera o Nome do Contexto
	String ContextPath = request.getContextPath();
%>

	<style>@import url(<%=ContextPath%>/styles/styles.css);</style>    
    <style>@import url(<%=ContextPath%>/styles/default.css);</style>
    
    <style>
		
		*{
			font-family:Verdana, Arial, Helvetica, sans-serif;
			font-size:11px;
		}
		
		#nav {width:100%};
		#nav, #nav ul{margin:0;padding:0;list-style-type:none;list-style-position:outside;position:relative;line-height:1.5em;}
		#nav a{display:block;padding:0px 5px;color:#333;text-decoration:none;}
		#nav a:hover{background-color:#eaeaea;color:#333;}
		#nav li{float:left;position:relative; border:1px solid #999999;text-align: left}
		#nav ul {position:absolute;display:none;width:12em;top:18px;font-size:10px;}
		#nav li ul a{width:16em;height:auto;float:left;background-color:#CCCCCC; color:#666666;}
		#nav ul ul{top:auto; background-color:#CCCCCC;} 
		#nav li ul ul {left:16em;margin:0px 0 0 10px;background-color:#CCCCCC;}
		#nav li:hover ul ul, #nav li:hover ul ul ul, #nav li:hover ul ul ul ul{display:none;}
		#nav li:hover ul, #nav li li:hover ul, #nav li li li:hover ul, #nav li li li li:hover ul{display:block;}
	
    </style>
        
    <script>
		function popUp(url)
		{
			window.open(url,'','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=420,height=300');  
		}
		
	</script>
	<script type='text/javascript' src='<%=ContextPath%>/js/jquery.js'></script>
	<script type='text/javascript' src='<%=ContextPath%>/js/validadoes.js'></script>
		<script type="text/javascript" src="<%=ContextPath%>/js/wz_tooltip.js"></script>
	<script>
		function mainmenu(){
		$(" #nav ul "). css({display: "none"});
		$(" #nav li").hover(function(){
		$(this).find('ul:first').css({visibility: "visible",display: "none"}).show(200);
		},function(){
		$(this).find('ul:first').css({visibility: "hidden"});
		});
		}
		
		$(document).ready(function(){ 
		mainmenu();
		});
	</script>

    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="topo_esq"></td>
            <td class="topo_cent" align="right">
            <div style="float:left;padding-left:17px;height:100%;">
            	<a href="<%=ContextPath%>/Administracao"><img src="<%=ContextPath%>/styles/imagens/logo_adm.jpg"/> </a>           
            </div>            
            <div style="float:right;text-align:right;height:100%;">          	   
                         
                  <table align="right" width="210px" cellpadding="3" cellspacing="3">
                	 <tr>
                       	  <!-- Meus Dados -->
	                      <td width="7%" nowrap> <a href="<%=ContextPath%>/VisualizarUsuario"><img src="<%=ContextPath%>/imgs/buttons/btnMeusDados.gif"/></a></td>
	                      <td width="14%" nowrap style="text-align:left"> <a href="<%=ContextPath%>/VisualizarUsuario">Meu Cadastro</a></td>
                   		  <td width="5%" nowrap><a href="<%=ContextPath%>/acesso.jsp"><img src="<%=ContextPath%>/imgs/buttons/btnSair.gif"/></a></td>
                          <td width="7%" nowrap style="text-align:left"><a href="<%=ContextPath%>/acesso.jsp"> Sair</a></td>
                     </tr>
                     </table>
                     
            </div>
	            
            </td>
            <td class="topo_dir"></td>
        </tr>
    </table>
      <div class="menu_cent" style="width:100%">
      		<ul id="nav">
			<li><a href="#">Cadastros</a>
				<ul>
			        <li><a href="#">Produtos</a>
			        	<ul style="padding-left: 18px;">
			        		<li><a href="<%=ContextPath %>/admin/inserirproduto.jsp">Inserir Produtos</a></li>
			        		<li><a href="<%=ContextPath %>/admin/editarproduto.jsp">Alterar Produto</a></li>
			        	</ul>
			        </li>
			        <li><a href="<%=ContextPath %>/admin/promocao.jsp">Promoções</a></li>	
			        <li><a href="<%=ContextPath %>/admin/visualizarfornecedor.jsp">Fornecedores</a></li>
			        <li><a href="<%=ContextPath %>/DadosEmpresa">Dados da Empresa</a></li>
			    </ul>
			</li>
			<li><a href="#">Relatórios</a>
				<ul>
			        <li><a href="<%=ContextPath %>/GerarRelatorio?tipo=desktop" target="_blank">Vendas Desktop</a></li>
			        <li><a href="<%=ContextPath %>/GerarRelatorio?tipo=sms" target="_blank">Vendas SMS</a></li>
			    </ul>
			</li>
			<li><a href="#">Pagamentos</a>
				<ul>
			        <li><a href="<%=ContextPath %>/admin/pagamentos.jsp">Confirmar Pagamentos</a></li>
			    </ul>
			</li>
			<li><a href="#">Pedidos</a>
				<ul>
			        <li><a href="<%=ContextPath %>/admin/pedidos.jsp">Manutenção de Pedidos</a></li>
			    </ul>
			    	<ul>
			        <li><a href="#">Enviar Pedidos à Clientes</a></li>
			    </ul>
			
			</li>
			<li><a href="#">Movimentação</a>
				<ul>
			        <li><a href="<%=ContextPath %>/admin/registrarmovimento.jsp">Registrar Movimentação</a></li>
			        <li><a href="<%=ContextPath %>/admin/registrarenvio.jsp">Registrar Envio</a></li>
			    </ul>
			    	<ul>
			        <li><a href="#">Relatório de Movimentos</a></li>
			    </ul>
			</li>
			<li><a href="#">SMS</a>
			    <ul>
			    	<li><a href="<%=ContextPath%>/ControleSMS">Simular SMS</a>
			     </ul>
			</li>
			<li><a href="<%=ContextPath %>/default.jsp">Retornar para Loja</a>
			    
			</li>
			</ul>
      	
      
      </div>      
           


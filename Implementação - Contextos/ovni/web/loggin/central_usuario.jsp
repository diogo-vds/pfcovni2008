<%@page session="true"%>
<%@ page 
    contentType="text/html; charset=iso-8859-1" 
    pageEncoding="UTF-8" 
    language="java"     
    errorPage="" %>
 
<%@ page
	import="java.util.*,java.sql.*,java.io.*,ovni.util.*,ovni.negocio.*"%>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title> OVNI.net - Ofertas de outro mundo : Central do Usuario </title>
    
    <style>@import url(../styles/styles.css);</style>
</head>
<body>
<script type="text/javascript" src="scripts/wz_tooltip.js"></script>
<div id="geral">

<table style="width:100%">
	<tr>
		<td align="center">


    <div id="principal">
        <div id="topo" >
            <%@ include file="../topo.jsp" %>
        </div>
         <div id="content_full">
         
         <table align="center" width="618">
 			<tr>
            	<td>
                	<!-- Meu Registro -->
                	<img src="<%=ContextPath%>/imgs/layout/meus_registro.gif"/>
                    <ol>
                    	<li><a href="<%=ContextPath%>/VisualizarUsuario" class="texto11bold_green"> Dados Pessoais </a></li>
                        <li><a href="<%=ContextPath%>/loggin/pedidos.jsp" class="texto11bold_green"> Meus Pedidos</a></li>
                        <li><a href="<%=ContextPath%>/avaliaratendimento.jsp" class="texto11bold_green">Avaliar Site</a></li>
					</ol><br><br>
					<h1 class="texto11bold_green"> Pesquisa de Boletos</h1>	
						<%
								ResultSet rs = null;
								long codigo = 0;
								
								if(request.getAttribute("rsLista")!=null){
									rs = (ResultSet) request.getAttribute("rsLista");
									if(rs.next()){
										%>											
											<form action="/ovni/ManterBoleto" method="post" target="_blank">
											  <table style="width:300px; border:1px solid #efefef">
													<tr>
														<td style="width: 40%; text-align:right;font-weight:bold">Código do Pedido:</td>
														<td style="width: 30%; text-align:right;font-weight:bold"><select name="codigo" style="width: 100%; text-align:right">
															<option value="<%=rs.getLong("_numeroPedido")%>" >
																<%=rs.getLong("_numeroPedido") %>						
															</option>
										<%
										while(rs.next()){%>
														<option value="<%=rs.getLong("_numeroPedido")%>">
														<%=rs.getLong("_numeroPedido") %>						
														</option>						
										<%}%>		
														</select></td>
														<td style="width: 30%; text-align:left;font-weight:bold"><input type="submit" value="Imprimir"></td>
													</tr>
											   </table> 	
											</form>											
										<%
										
									}else{
										out.println("Nenhum boleto em aberto!!!");
									}}else{
										response.sendRedirect("/ovni/ManterBoleto");
									} %> 						 
                    
                </td>
           
         </table>         
         	</div>
		
		
		</td>
	</tr>

</table>
    
 <div id="copy">
<%@ include file="../copy.jsp" %>         
</div>
</div>
</body>
</html>





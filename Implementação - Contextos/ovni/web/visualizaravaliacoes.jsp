<%@page session="true"%>
<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">   
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@page import="ovni.negocio.Usuario"%>
<% 	ResultSet rsAvaliacao = (ResultSet)request.getAttribute("AvaliacoesSite");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Avaliações</title>
		<style>
			@import url("styles/styles.css");
			
			#avaliacao
			{
				font-size:12px;
				color:#00274F;
				text-decoration:none;
				font-weight:bold;
				padding-left:15px;
			}
			
			#usuario
			{
				font-size:11px;
				color:#00274F;
				text-decoration:none;
				text-align:right;
				padding-right:15px;
			}
			
		</style>
    </head>
 <body>   
 
  <div id="geral" style="height:400px;background-image: url(imgs/buttons/bgAvaliacoes.gif);background-repeat: no-repeat">        
                                          
                                                <br/>      
                        	 	<%
                        			if(rsAvaliacao!= null)
    								{    								
    						 	%>
                        				<% while(rsAvaliacao.next()) 
    								   		{ %>                                           
                                            	<div id="avaliacao">
                                                	"<%= rsAvaliacao.getString("Descricao")%>"
                                                </div>
                                            	<div id="usuario">
                                                	<em><%= rsAvaliacao.getString("Nome")%> em <%= Util.formatarData(rsAvaliacao.getDate("DataAvaliacao"))%></em>
												</div>                                          
                                                <br/>

							 	 		 <% } %>
							 	 <% } %>
		                          <center>
                                <input align="" type="image" src="imgs/buttons/btnFechar.gif" value="Voltar" onClick="window.close()">
                                </center>						
                                </div>
      
</body>
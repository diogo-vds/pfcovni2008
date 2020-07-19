<%@page session="true"%>
<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">   
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*,java.util.Vector" %>
<%@page import="ovni.negocio.Endereco"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> OVNI.net - Enderecos </title>
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
        <div id="content_full"><br/>
  
   		  <form action="/ovni/PesquisarEndereco" method="post" name="form1">
      <table align="center" width="400px" class="borda_azul">
                	<tr>
                    	<th height="20" colspan="2"> Pesquisar Endereco </th>
                  </tr>
                    <tr>
                   	  <td height="28" class="label"> Tipo de Pesquisa:</td>
               		    <td> 
                        	<select name="TipoPesquisa" >
                              <option value=0>Todos</option>
                              <option value=1>Rua</option>
                              <option value=2>Tipo Endereco</option>
                   		  </select>
                       </td> 
                       <tr>
                       <%
                       		HttpSession sessao = request.getSession(true);
    				   %>
                       		<td><input type="hidden" name="Codigo" value=<%=sessao.getAttribute("CodigoObjeto")%>></td>                         		                      	                                                                  			
                            <td><input type="hidden" name="TipoObjeto" value=<%=sessao.getAttribute("TipoObjeto")%>></td> 
                       </tr>                        
                    </tr>
                    <tr>
                    	<td height="30" class="label"> Descrição:</td>
                      <td><input type="text" name="Pesquisar" class="text_box"> </td>
                    </tr>
                    <tr>
                    	<td colspan="2" align="center">
                         	<input type="image" src="imgs/buttons/btnPesquisar.gif" onClick="this.form.submit()">&nbsp;&nbsp;
                          	<input type="image" src="imgs/buttons/btnCancelar.gif" onClick="this.form.reset()" >&nbsp;&nbsp;
                          <a href="inserirendereco.jsp"><img src="imgs/buttons/btnInserir.gif"/></a>                              
                      </td>
                    </tr>                	
                </table>
   		  </form>	                
                	<br>
		    		<!-- Carregar -->
		    		<%   
		    			Vector vctEndereco =  new Vector();
                        
                     	//Enquanto existir registros, listar Enderecos
                    	if(request.getAttribute("Endereco") != null)
    					{   
    						vctEndereco = (Vector) request.getAttribute("Endereco");
    				%>
          <br> <br> 
                     <table width="705" align="center" class="borda_cinza">
							<tr>
                                <th width="206">Rua</th>                                                                    			
                                <th width="45">Numero</th>
                                <th width="115">Bairro</th>
                                <th width="100">Municipio</th>
                                <th width="42">Estado</th>
                                <th width="80">Tipo Endereco</th>
                          <%if(sessao.getAttribute("TipoObjeto") == "U")
						  {%>       
                                <th width="65">End.Padrao</th>
                          <%} 
						  else 
						  {%> 
							  	
						  <%}%>     
                    	  <th width="20"></th></tr> 
                    		
                    <%
                        //
                           int cont = 1;
					       for (int i=0; i<vctEndereco.size(); i++ )
						   {                                         
                              	cont++;
                              	Endereco oEndereco = new Endereco();
                                oEndereco = (Endereco) vctEndereco.get(i);
                        %>      
                    <form action="/ovni/VisualizarDetalhesEndereco" method="post" name="<%=cont%>" value="1">
 					  	
                        	<!-- Zebrar Grid de Enderecos -->
                            <%if(cont % 2 == 0)
                              {%> 
                            	<tr style="background-color:#fafafa"> 
							<%} 
							  else 
							  {%> 
                            	<tr style="background-color:#ffffff"> 
							<%}%>
								
                                <td width="206" style="padding-right:2%;text-align:right" class="texto11bold_green"><%=oEndereco.getRua()%></td>                                                                    			
                                <td width="45" align="right" style="padding-right:2%"><%=oEndereco.getNumero()%></td>
                                <td width="115" style="padding-right:2%;text-align:right" class="texto11bold_green"><%=oEndereco.getBairro()%></td>
                                <td width="100" style="padding-right:2%;text-align:right" class="texto11bold_green"><%=oEndereco.getMunicipio()%></td>
                                <td width="42" style="padding-right:2%;text-align:right" class="texto11bold_green"><%=oEndereco.getEstado()%></td>
                                <td width="80" style="padding-right:2%;text-align:right" class="texto11bold_green"><%=oEndereco.getDescTipoEndereco()%></td>
                               
                                <%if(sessao.getAttribute("TipoObjeto") == "U")
						  		{%>       
                                   <td width="65" style="padding-right:2%;text-align:right" class="texto11bold_green">
                                   <%if(oEndereco.getEndCelular() == true)
									{%> 
										<img src="<%=ContextPath%>/imgs/buttons/confirm.png"/>
									<%} 
								  	else 
							  		{%> 
							  	
									<%}%>	</td>
                               <%} 
						  		else 
						  		{%>  
								<%} %>                                
                                
                                <td width="20"><input alt='Alterar Dados de <%= oEndereco.getDescTipoEndereco()%>' type="image" onClick="this.form.submit()" src="imgs/layout/Edit.gif"/></td>
                                <td><input type="hidden" name="CodigoEndereco" value="<%= oEndereco.getCodigo()%>"> </td>                        		                      	                                                                  			
                       			<td><input type="hidden" name="TpObjeto" value=<%=sessao.getAttribute("TipoObjeto")%>></td>   
                               </tr>  
                    </form>
                    <%
                       	  }
					%>
                    </table>
          <%		
					}
					else
					{
                    %>
          <div align="center" class="erro"> Escolha Tipo de Pesquisa!!! </div>
                  <%}%>
        		<br/><br/><br/>
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

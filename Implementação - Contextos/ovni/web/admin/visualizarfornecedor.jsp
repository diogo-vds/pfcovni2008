<%@page session="true"%>
<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">   
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*,java.util.Vector" %>
<%@page import="ovni.negocio.Fornecedor"%>
<%
	Usuario usu = (Usuario) session.getAttribute("Usuario");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> OVNI.net - Fornecedores </title>
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
        <div id="content_full"><br/>
  
   		  <form action="/ovni/PesquisarFornecedor" method="post" name="form1">
      <table align="center" width="400px" class="borda_azul">
                	<tr>
                    	<th height="20" colspan="2"> Pesquisar Fornecedores </th>
                  </tr>
                    <tr>
                   	  <td height="28" class="label"> Tipo de Pesquisa:</td>
               		    <td> 
                        	<select name="TipoPesquisa" >
                              <option value=0>Todos</option>
                              <option value=1>Nome Fantasia</option>
                              <option value=2>CNPJ</option>
                              <option value=3>Razao Social</option>
                   		  </select>
                       </td>
                    </tr>
                    <tr>
                    	<td height="30" class="label"> Descrição:</td>
                      <td><input type="text" name="Pesquisar" class="text_box"> </td>
                    </tr>
                    <tr>
                    	<td colspan="2" align="center">
                         	<input type="image" src="<%=ContextPath%>/imgs/buttons/btnPesquisar.gif" onClick="this.form.submit()">&nbsp;&nbsp;
                          	<input type="image" src="<%=ContextPath%>/imgs/buttons/btnCancelar.gif" onClick="this.form.reset()" >&nbsp;&nbsp;
                          <a href="<%=ContextPath%>/admin/inserirfornecedor.jsp"><img src="<%=ContextPath%>/imgs/buttons/btnInserir.gif"/></a>                            
                      </td>
                    </tr>                	
                </table>
   		  </form>	                
                	<br>
		    		<!-- Carregar -->
		    		<%   
		    			Vector vctFornecedor =  new Vector();
                        
                     	//Enquanto existir registros, listar Fornecedores
                    	if(request.getAttribute("Fornecedores") != null)
    					{   
    						vctFornecedor = (Vector) request.getAttribute("Fornecedores");
    				%>
          <img src="<%=ContextPath%>/imgs/layout/fornecedores.gif"/><br> <br> 
                     <table width="705" align="center" class="borda_cinza">
							<tr>
                                <th width="206">Raz�o Social</th>                                                                    			
                                <th width="95">CNPJ</th>
                                <th width="189">Contato</th>
                                <th width="42">DDD</th>
                                <th width="130">Telefone Principal</th>
                                <th width="15"></th>
                    		</tr> 
                    <%
                        //
                           int cont = 1;
					       for (int i=0; i<vctFornecedor.size(); i++ )
						   {                                         
                              	cont++;
                              	Fornecedor oFornecedor = new Fornecedor();
                                oFornecedor = (Fornecedor) vctFornecedor.get(i);
                        %>      
                    <form action="/ovni/VisualizarDetalhesFornecedor" method="post" name="<%=cont%>" value="1">
 					  	
                        	<!-- Zebrar Grid de Fornecedores -->
                            <%if(cont % 2 == 0)
                              {%> 
                            	<tr style="background-color:#fafafa"> 
							<%} 
							  else 
							  {%> 
                            	<tr style="background-color:#ffffff"> 
							<%}%>
                                <td width="206" style="padding-right:2%;text-align:right" class="texto11bold_green"><%=oFornecedor.getRazaoSocial()%></td>                                                                    			
                                <td width="95" align="right" style="padding-right:2%"><%=oFornecedor.getCnpj()%></td>
                                <td width="189" align="right" style="padding-right:2%" class="texto11bold_red"><%=oFornecedor.getContato()%></td>
                                <td width="42" align="right" style="padding-right:2%" class="texto11bold_red"><%=oFornecedor.getDDD()%></td>
                                <td width="130" align="right" style="padding-right:2%" class="texto11bold_red"><%=oFornecedor.getTelefonePrincipal()%></td>
                                <td width="15"><input alt='Detalhes de <%= oFornecedor.getRazaoSocial()%>' type="image" onClick="this.form.submit()" src="imgs/layout/Edit.gif"/>
                                <input type="hidden" name="Codigo" value="<%= oFornecedor.getCodigo()%>"> </td> 
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


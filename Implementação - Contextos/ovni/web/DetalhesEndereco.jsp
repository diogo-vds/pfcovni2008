<%@page session="true"%>
<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">   
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*,java.util.Vector" %>
<%@page import="ovni.negocio.TipoEndereco"%>
<%@page import="ovni.negocio.Endereco"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Detalhes Endereco</title>
		<style>
			@import url("styles/styles.css");
		</style>	
		<script>
                <!--					
                    function Alterar()
					{
						document.form1.action= "AlterarEndereco";
            			document.form1.submit();
        			}
		
					function Excluir()
					{
						document.form1.action= "ExcluirEndereco";
            			document.form1.submit();
					}
					
					function Inserir()
					{
						document.location.href='inserirendereco.jsp';			
        			}
					
					function Redirect()
					{
						document.location.href='visualizarendereco.jsp';			
        			}        			
        			
                //-->
                </script>
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
        <div id="content_full">  
          
		               <form name="form1" method="post" action="/ovni/PesquisarEndereco">                                                   
                          
                 	<!-- Carregar Form Endereo -->   
						<%   
		    					HttpSession sessao = request.getSession(true);
		    					
		    					Endereco oEndereco =  new Endereco();
                        
                        	    if(sessao.getAttribute("DetalhesEndereco") != null)
    							{
    								oEndereco = (Endereco) sessao.getAttribute("DetalhesEndereco");    								
    				    %>	
                        <br/>
                              <table class="borda_cinza" style="width:600px;">
            	<tr>
                	<td rowspan="14"> <img src="imgs/buttons/form_enderecos.gif"/></td>
                    <td height="29" colspan="2" class="texto19bold_green" style="text-align:center" > Detalhe do Endereço 
                    	<input type="hidden" name="CodigoEndereco" value="<%=oEndereco.getCodigo()%>"> 
                    </td>
                </tr>
            	<tr>
                	<td class="label">Logradouro:</td>
                    <td style="width:65%;text-align:left">
                    <input type="text" name="Rua" class="text_box" width="300px" maxlength="200" value="<%=oEndereco.getRua()%>"></td>
            	<tr>
                	<td class="label">Número</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Numero" class="text_box" onkeypress='return SomenteNumeroComZero(event)' value="<%=oEndereco.getNumero()%>" width="100px" maxlength="4">                    </td>
            	<tr>
                	<td class="label">Complemento:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Complemento" class="text_box" width="150px" maxlength="150" value="<%=oEndereco.getComplemento()%>">                    </td>
            	<tr>
                	<td class="label">Bairro:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Bairro" class="text_box" width="80px" maxlength="50"  value="<%=oEndereco.getBairro()%>">                    </td>
            	<tr>
                	<td class="label">CEP:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Cep" class="text_box" onkeypress='return SomenteNumeroComZero(event)'  value="<%=oEndereco.getCep()%>" width="100px" maxlength="8">                    </td>
            	<tr>
                	<td class="label">Caixa Postal:</td>
                    <td style="width:65%;text-align:left">
                    	 <input type="text" name="CaixaPostal" onkeypress='return SomenteNumeroComZero(event)' class="text_box" width="50px" value="<%=oEndereco.getCaixaPostal()%>" maxlength="10">                    </td>
            	<tr>
                	<td class="label">Cidade:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Municipio" class="text_box" width="80px" maxlength="20"  value="<%=oEndereco.getMunicipio()%>">                    </td>
            	<tr>
                	<td class="label">Estado:</td>
                    <td style="width:65%;text-align:left">
                    		<input type="text" name="Estado" class="text_box" value="<%=oEndereco.getEstado()%>"  width="30px" maxlength="2" >
                        </td>
            	<tr>
                	<td class="label">País:</td>
                    <td style="width:65%;text-align:left"><input type="text" name="Pais" class="text_box" width="80px" maxlength="15"  value="<%=oEndereco.getPais()%>"></td>
                    	
            	<tr>
               	   <td class="label">Nome Receptor:</td>
                   <td style="width:65%;text-align:left">
                   	   <input type="text" name="NomeReceptor" class="text_box" width="280px" maxlength="15"   value="<%=oEndereco.getNomeReceptor()%>">                   </td>
            	<tr>
               	   <td class="label">Referência Entrega:</td>
                   <td style="width:65%;text-align:left">
                   			   <input type="text" name="ReferenciaEntrega" class="text_box" width="300px" maxlength="150" value="<%=oEndereco.getReferenciaEntrega()%>">
                   </td>
                               
                <tr>                   
                   <%if(oEndereco.getEndCelular() == true)
				     {%> 
                          	<td class="texto11bold_red" width="300px" maxlength="150">Endereço Padrão de Entrega</td>
                          	<td style="width:150%;text-align:left">
				   <%} 
					 else 
					 {%> 
                            <td class="label">Padrao de Entrega</td>
                   			<td style="width:65%;text-align:left">
                            <input type="checkbox" name="EndCelular" value="true"> </td> 
			       <%}%> 
                            		
               <tr>                            	
                            <td><input type="hidden" name="CodigoObjeto" value="<%=oEndereco.getCodigoObjeto()%>"> </td> 
                            <td><input type="hidden" name="TipoObjeto" value="<%=oEndereco.getTipoObjeto()%>"> </td>     
            	
               <tr>
                	<td class="label">&nbsp;</td>
                    <td style="width:65%;text-align:left">
                    			<input type="button" value="Registrar" onclick="Alterar()"><input type="button" value="Excluir" onclick="Excluir()"><input type="button" value="Voltar" onClick="Redirect()">               </td>
           	
           	
           	
           	</table>         
                        
                        
                        
                        
                     </form>
                     									
                            		<% } else { %>
			    <% }%>
		
<br><br>
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
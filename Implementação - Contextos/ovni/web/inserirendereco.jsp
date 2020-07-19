<%@page session="true"%>
<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">   
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*,java.util.Vector" %>
<%@page import="ovni.negocio.Fornecedor"%>
<%@page import="ovni.negocio.TipoEndereco"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> OVNI.net - Cadastro de Endereços </title>
		<style>
			@import url("styles/styles.css");
		</style>
		<script>
                <!--					
                    function Redirect() 
                    {
                        document.form1.action= "visualizarendereco.jsp";
            			document.form1.submit();
                    }
                    
                    function Valor() 
                    {
                        document.form1.EndCelular.value= "true";
                    }
                //-->
                </script>
                <script language="javascript" src="js/validacoes.js"> </script>
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
        <br>
        <br><!-- Carregar Form -->
          
        <!-- Carregar Form -->
          <form name="form1" method="post" action="/ovni/InserirEndereco">
             
            <table class="borda_cinza" style="width:600px;">
            	<tr>
                	<td rowspan="14"> <img src="imgs/buttons/form_enderecos.gif"/></td>
                    <td height="29" colspan="2" class="texto19bold_green" style="text-align:center" > Inserir Endereços </td>
                <tr>
                	<td class="label">Tipo:</td>
                    <td style="width:65%;text-align:left">                    
                    	<div align="left">
                        	 	  <%
                        	 		Vector vctTipoEndereco =  new Vector();
                        	 		HttpSession sessao = request.getSession(true);
                        	 		if(sessao.getAttribute("TipoEndereco") != null)   
									{   
    									vctTipoEndereco = (Vector) sessao.getAttribute("TipoEndereco");
    						 	%>
                        	 	  <select name="TipoEndereco" width="100px" maxlength="8">
                        	 	    <br>
                        	 	      <% for (int i=0; i<vctTipoEndereco.size(); i++ )
										   {                                         
                                            	TipoEndereco oTipoEndereco = new TipoEndereco();
                                            	oTipoEndereco = (TipoEndereco) vctTipoEndereco.get(i);
                                        %>
                        	 	    <option value="<%=oTipoEndereco.getCodigo()%>"><%=oTipoEndereco.getDescricao()%></option>                        			   							
                        	 	        <% } %>
                      	 	    </select>
                       	 	     <% } %>
                      	 	    </div>                    </td>
            	<tr>
                	<td class="label">Logradouro:</td>
                    <td style="width:65%;text-align:left">
                    <input type="text" name="Rua" class="text_box" width="300px" maxlength="200">                    </td>
            	<tr>
                	<td class="label">Número</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Numero" class="text_box" onkeypress='return SomenteNumeroComZero(event)' width="100px" maxlength="4">                    </td>
            	<tr>
                	<td class="label">Complemento:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Complemento" class="text_box" width="150px" maxlength="150">                    </td>
            	<tr>
                	<td class="label">Bairro:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Bairro" class="text_box" width="80px" maxlength="50">                    </td>
            	<tr>
                	<td class="label">CEP:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Cep" class="text_box" onkeypress='return SomenteNumeroComZero(event)' width="100px" maxlength="8">                    </td>
            	<tr>
                	<td class="label">Caixa Postal:</td>
                    <td style="width:65%;text-align:left">
                    	 <input type="text" name="CaixaPostal" onkeypress='return SomenteNumeroComZero(event)' class="text_box" width="50px" maxlength="10">                    </td>
            	<tr>
                	<td class="label">Cidade:</td>
                    <td style="width:65%;text-align:left">
                    	<input type="text" name="Municipio" class="text_box" width="80px" maxlength="20">                    </td>
            	<tr>
                	<td class="label">Estado:</td>
                    <td style="width:65%;text-align:left">
                    	<select name="Estado"  width="100px" maxlength="8">
                                	      <option value="AC">AC</option> 
                                	      <option value="AL">AL</option> 
                                	      <option value="AP">AP</option> 
                                	      <option value="AM">AM</option> 
                                	      <option value="BA">BA</option> 
                                	    
                                	      <option value="CE">CE</option> 
                                	      <option value="DF">DF</option> 
                                	      <option value="ES">ES</option> 
                                	      <option value="GO">GO</option> 
                                	      <option value="MA">MA</option> 
                                	      <option value="MT">MT</option> 
                                	    
                                	      <option value="MS">MS</option> 
                                	      <option value="MG">MG</option> 
                                	      <option value="PA">PA</option> 
                                	      <option value="PB">PB</option> 
                                	      <option value="PR">PR</option> 
                                	      <option value="PE">PE</option> 
                                	    
                                	      <option value="PI">PI</option> 
                                	      <option value="RJ">RJ</option> 
                                	      <option value="RN">RN</option> 
                                	      <option value="RS">RS</option> 
                                	      <option value="RO">RO</option> 
                                	      <option value="RR">RR</option> 
                                	    
                                	      <option value="SC">SC</option> 
                                	      <option value="SP" selected="true">SP</option> 
                                	      <option value="SE">SE</option> 
                                	      <option value="TO">TO</option>
                              	    </select>                    </td>
            	<tr>
                	<td class="label">País:</td>
                    <td style="width:65%;text-align:left"><input type="text" name="Pais" class="text_box" width="80px" maxlength="15" value="Brasil"></td>
                    	
            	<tr>
               	   <td class="label">Nome Receptor:</td>
                   <td style="width:65%;text-align:left">
                   	   <input type="text" name="NomeReceptor" class="text_box" width="280px" maxlength="15">                   </td>
            	<tr>
               	   <td class="label">Referência Entrega:</td>
                   <td style="width:65%;text-align:left">
                   			   <input type="text" name="ReferenciaEntrega" class="text_box" width="300px" maxlength="150">
                                               </td>
            	<tr>
                 <td class="label">Padrão de Entrega</td>
                 <td style="width:65%;text-align:left">
                     <input type="checkbox" name="EndCelular" onclick="Valor()"> 
                     <input type="hidden" name="CodigoObjeto" value="<%=sessao.getAttribute("CodigoObjeto")%>"> 
                     <input type="hidden" name="TipoObjeto" value=<%=sessao.getAttribute("TipoObjeto")%>>   
                      </td>    	
            	<tr>
                	<td class="label">&nbsp;</td>
                    <td style="width:65%;text-align:left">
                    		  <input type="button" src="imgs/buttons/btnRegistrar.gif" value="Registrar" onClick="this.form.submit()">&nbsp;&nbsp;   
                              <input type="reset" src="imgs/buttons/btnCancelar.gif" value="Cancelar" onClick="this.form.reset()">&nbsp;&nbsp;   
                              <input type="button" src="imgs/buttons/btnFinalizar.gif" value="Finalizar" onClick="Redirect()">                    
                    </td>
           	</table>           
            
          </form>       	
          <br>
        <br>
            
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

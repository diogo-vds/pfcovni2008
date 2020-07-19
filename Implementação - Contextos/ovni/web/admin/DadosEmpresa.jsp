<%@page session="true"%>
<%@ page 
    contentType="text/html; charset=iso-8859-1" 
    pageEncoding="UTF-8" 
    language="java"     
    errorPage="" %>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*,ovni.negocio.Empresa" %>
<%
	Empresa oEmp  = (Empresa) request.getAttribute("Empresa");
%>
<html>
<head>
    <title> OVNI.net - Dados da Empresa</title>
    <script>
                <!--					
                    function Redirect()
					{
						document.location.href="/ovni/Administracao";			
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
    	 <div id="topo" style="z-index:800">
            	<%@ include file="/admin/topo.jsp" %>
        </div>
        <div id="content_full" style="z-index: 0;text-align: left;">
           <br/>	 
        	<!-- Carregar Form -->
          <form name="form1" method="post" action="/ovni/AtualizarEmpresa">
            <table width="600px" height="354px" align="center" class="borda_cinza">
<td width="10%" rowspan="20">
                                	
                       <img src="<%=ContextPath%>/imgs/buttons/form_empresa.gif"/>                        </td>
                            <tr>
                              <td colspan="2" class="texto19bold_green" style="text-align:center">Dado da Empresa  </td>
                            </tr>                           
                            <tr>
                                <td class="label">Nome Fantasia:</td>
                              <td ><input type="text" name="NomeFantasia" class="text_box" style="width:80%" maxlength="100" value="<%=oEmp.getNomeFantasia()%>"></td>
                          </tr>                           
                            <tr>
                                <td class="label">Razão Social:</td>
                                <td><input type="text" name="RazaoSocial"  class="text_box" style="width:70%" maxlength="100" value="<%=oEmp.getRazaoSocial()%>" ></td>
                            </tr>
                            <tr>
                                <td class="label">CNPJ: </td>
                                <td><input type="text" name="CNPJ" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" value="<%=oEmp.getCNPJ()%>" maxlength="20"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Inscrição Estadual: </td>
                                <td><input type="text" name="InscricaoEstadual" style="width:50%" class="text_box" value="<%=oEmp.getInscricaoEstadual()%>" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="label">Inscrição Municipal: </td>
                                <td><input type="text" name="InscricaoMunicipal" style="width:50%" class="text_box" value="<%=oEmp.getInscricaoMunicipal()%>" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20"></td>
                            </tr>
                       		 <tr>
                                <td class="label">Endereço:</td>
                                <td ><input type="text" name="Endereco" class="text_box" style="width:80%" maxlength="100" value="<%=oEmp.getEndereco()%>"></td>
                            </tr>
                       		   <tr>
                                <td class="label">Número: </td>
                                <td><input type="text" name="Numero" style="width:40%" value="<%=oEmp.getNumero()%>" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" maxlength="30"></td>    
                            </tr>
                               <tr>
                                <td class="label">Complemento: </td>
                                <td><input type="text" name="Complemento" style="width:70%" value="<%=oEmp.getComplemento()%>" class="text_box" maxlength="50"></td>    
                            </tr>
                             <tr>
                                <td class="label">Bairro: </td>
                                <td><input type="text" name="Bairro" style="width:50%" value="<%=oEmp.getBairro()%>" class="text_box" maxlength="50"></td>    
                            </tr>
                            <tr>
                                <td class="label">Cidade: </td>
                                <td><input type="text" name="Municipio" style="width:80%" value="<%=oEmp.getMunicipio()%>" class="text_box" maxlength="50"></td>    
                            </tr>
                            <tr>
                                <td class="label">Estado: </td>
                                <td><input type="text" name="Estado" style="width:20%" value="<%=oEmp.getEstado()%>" class="text_box" maxlength="s"></td>    
                            </tr>
                            <tr>
                                <td class="label">CEP: </td>
                                <td><input type="text" name="CEP" style="width:20%" value="<%=oEmp.getCEP()%>" class="text_box" maxlength="8"></td>    
                            </tr>
                              <tr>
                                <td class="label">País: </td>
                                <td><input type="text" name="Pais" style="width:50%" value="<%=oEmp.getPais()%>" class="text_box" maxlength="30"></td>    
                            </tr>                            
                            <tr>
                                <td class="label">DDD:</td>
                                <td><input type="text" name="DDD" style="width:20%" value="<%=oEmp.getDDD()%>" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="3"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Telefone Principal: </td>
                                <td><input type="text" name="TelefonePrincipal" style="width:50%"  value="<%=oEmp.getTelefonePrincipal()%>"  class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8"></td>                                
                            </tr>
                            <tr>
                                <td class="label">DDD (Fax):</td>
                                <td><input type="text" name="DDDFax" style="width:20%" value="<%=oEmp.getDDDFax()%>" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="3"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Fax: </td>
                                <td><input type="text" name="Fax" style="width:50%"  value="<%=oEmp.getFax()%>"  class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8"></td>                                
                            </tr>
                          
                            <tr>
                            	<td height="35" colspan="2" align="center">
                           	    <input type="submit" value="Registrar">&nbsp;&nbsp;
                                    <input type="reset" value="Limpar">&nbsp;&nbsp;
                                    <input type="button" value="Cancelar" onClick="Redirect()">
                                
                                </td>
                          </tr>                 
                        </table>
          </form>  
        	<br/>
        				
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

		
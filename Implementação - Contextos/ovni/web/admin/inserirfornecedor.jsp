<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="util.*"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.util.Vector"%>
<%@ page import="java.math.*" %>
<%@ page import="java.lang.Object"%>
<html>
<title> OVNI.net - Cadastro de Fornecedores </title>
<head>
		<style>
			@import url("../styles/styles.css");
		</style>	
					 <script language="javascript" src="<%=request.getContextPath()%>/js/validacoes.js"> </script>
                <script>
                <!--					
                    function Validar() 
                    {
                        if (document.form1.NomeFantasia.value == "") {
                            alert ("É necessário preencher o Nome Fantasia do Fornecedor.");
                            document.form1.NomeFantasia.focus(); }		    
                        else if (document.form1.RazaoSocial.value == "") {
                            alert ("É necessário preencher a Razao Social do Fornecedor.");
                            document.form1.RazaoSocial.focus(); }
                        else if (document.form1.Cnpj.value == "") {
                            alert ("É necessário preencher o CNPJ do Fornecedor.");
                            document.form1.Cnpj.focus(); }
                        else if (document.form1.InscrEstadual.value == "") {
                            alert ("É necessário preencher a Inscrição Estadual.");
                            document.form1.InscrEstadual.focus(); }
                        else if (document.form1.InscrMunicipal.value == "") {
                            alert ("É necessário preencher a Inscrição Municipal.");
                            document.form1.InscrMunicipal.focus(); }
                         else if (document.form1.CEI.value == "") {
                            alert ("É necessário preencher o CEI.");
                            document.form1.CEI.focus(); }
                        else if (document.form1.Contato.value == "") {
                            alert ("É necessário preencher o nome do Contato");
                            document.form1.Contato.focus(); }
                        else if (document.form1.Cargo.value == "") {
                            alert ("É necessário preencher o cargo do contato");
                            document.form1.Cargo.focus(); }
                        else if (document.form1.DDD.value == "") {
                            alert ("É necessário preencher o DDD.");
                            document.form1.DDD.focus(); }
                        else if (document.form1.TelefonePrincipal.value == "") {
                            alert ("É necessário preencher o telefone principal.");
                            document.form1.TelefonePrincipal.focus(); }
                        else if (document.form1.Ramal.value == "") {
                            alert ("É necessário preencher o Ramal");
                            document.form1.Ramal.focus(); }
                        else if (document.form1.Fax.value == "") {
                            alert ("É necessário preencher o FAX");
                            document.form1.Fax.focus(); }
                        else if (document.form1.TelefoneOpcional.value == "") {
                            alert ("É necessário preencher o telefone opcional");
                            document.form1.TelefoneOpcional.focus(); }
                        else if (document.form1.Celular.value == "") {
                            alert ("É necessário preencher o celular");
                            document.form1.Celular.focus(); }
                        else if (document.form1.Email.value == "") {
                            alert ("É necessário preencher o email");
                            document.form1.Fax.focus(); }
                        else
                        {
                            document.form1.submit(); 
                     	}                            
                    }
                    
                    function Redirect()
					{
						document.location.href='/admin/visualizarfornecedor.jsp';			
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
        <div id="content_full">
        <br>        <br>
         <!-- Carregar Form -->
          <form name="form1" method="post" action="/ovni/InserirFornecedor">
            <table width="600px" height="354px" align="center" class="borda_cinza">
			<td width="10%" rowspan="20">
                                	<img src="<%=ContextPath%>/imgs/buttons/form_fornecedores.gif"/>                        </td>
                            <tr>
                              <td colspan="2"><input type="hidden" name="Codigo"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Nome Fantasia:</td>
                              <td ><input type="text" name="NomeFantasia" class="text_box" style="width:80%" maxlength="20"></td>
                          </tr>                           
                            <tr>
                                <td class="label">Razão Social:</td>
                                <td><input type="text" name="RazaoSocial"  class="text_box" style="width:70%" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="label">CNPJ: </td>
                                <td><input type="text" name="Cnpj" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" onBlur="ValidarCNPJ(document.form1.Cnpj)"  maxlength="14">
                                (somente números)</td>
                            </tr>                           
                            <tr>
                                <td class="label">Inscr. Estadual: </td>
                                <td><input type="text" name="InscrEstadual" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="label">CEI:</td>
                                <td><input type="text" name="CEI" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20"></td>
                            </tr>                           
                            <tr>    
                                <td class="label">Inscr. Municipal:</td>
                                <td><input type="text" name="InscrMunicipal" style="width:40%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="label">Contato: </td>
                                <td><input type="text" name="Contato" style="width:60%" class="text_box" maxlength="15"></td>    
                            </tr>                           
                            <tr>
                                <td class="label">Cargo: </td>
                                <td><input type="text" name="Cargo" style="width:70%" class="text_box" maxlength="20"></td>	    	
                            </tr>
                            <tr>
                                <td class="label">DDD:</td>
                                <td><input type="text" name="DDD" style="width:40%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="3"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Telefone Principal: </td>
                                <td><input type="text" name="TelefonePrincipal" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8"></td>                                
                            </tr>
                            <tr>
                                <td class="label">Ramal: </td>
                                <td><input type="text" name="Ramal" style="width:30%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="10"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Telefone Recados: </td>
                              <td><input type="text" name="TelefoneOpcional" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8"></td>
                            </tr>              
                            <tr>
                                <td class="label">Fax:  </td>
                                <td><input type="text" name="Fax" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Celular:</td>
                                <td><input type="text" name="Celular" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8"></td>                                
                            </tr>
                            <tr>
                                <td class="label">Email: </td>
                                <td><input type="text" name="Email" onBlur="ValidarEmail(this.form.Email)" class="text_box" style="width:60%"></td>                               
                            </tr> 
                            <tr>
                            	<td height="35" colspan="2" align="center">
                           	    <input type="button" onClick="Validar(this)" value="Registrar">&nbsp;&nbsp;
                                    <input type="reset" value="Limpar">&nbsp;&nbsp;
                                    <input type="button" value="Cancelar" onClick="Redirect()">
                                
                                </td>
                          </tr>                 
                        </table>
          </form>  
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




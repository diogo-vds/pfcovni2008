<%@page session="true"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*,java.sql.*,java.io.*,ovni.util.*,java.util.Vector" %>
<%@page import="java.text.*,java.util.*" %>
<%@page import="ovni.negocio.*,ovni.util.*"%>
<%@page import="ovni.negocio.Fornecedor"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes do Fornecedor</title>
		<style>
			@import url("styles/styles.css");
		</style>
                <script type="text/javascript">        
				<!--	
					function Alterar()
					{
						document.form1.action= "AlterarFornecedor";
            			document.form1.submit();
        			}
		
					function Excluir()
					{
						document.form1.action= "ExcluirFornecedor";
            			document.form1.submit();
					}
					
					function Redirect()
					{
						document.location.href='visualizarfornecedor.jsp';			
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
        <div id="topo" style="z-index:800">
            <%@ include file="/admin/topo.jsp" %>
        </div>
        <div id="content_full"><br />
		<%   
			Vector vctFornecedor =  new Vector();
                       
            // Enquanto existir registros, listar Fornecedores
            if(request.getAttribute("DetalhesFornecedor") != null)
    		{   
    			vctFornecedor = (Vector) request.getAttribute("DetalhesFornecedor");  
                int cont = 1;
				for (int i=0; i<vctFornecedor.size(); i++ )
				{                                         
                   	cont++;
                  	Fornecedor oFornecedor = new Fornecedor();
                    oFornecedor = (Fornecedor) vctFornecedor.get(i);
        %>     
          <form action="" method="post" name="form1">					
			<table align="center" width="600" class="borda_cinza">
            			<td width="10%" rowspan="20">
                                	<img src="imgs/buttons/form_fornecedores.gif"/>                        </td>
                            <tr>
                        <tr>
                          <td colspan="2" class="texto12bold_green" align="center">Detalhes de Fornecedores 
                            <input type="hidden" name="Codigo" value="<%=oFornecedor.getCodigo()%>"></td>
                        </tr>
                       
                        <tr>
                            <td class="label">Nome Fantasia:</td>
                            <td style="text-align:left"><input type="text" name="NomeFantasia" class="text_box" style="width:80%" maxlength="20" value="<%=oFornecedor.getNomeFantasia()%>"> </td>        	
                        </tr>
                        <tr>
                            <td class="label">Razão Social:</td>
                            <td style="text-align:left"><input type="text" name="RazaoSocial" class="text_box" style="width:70%" maxlength="20" value="<%=oFornecedor.getRazaoSocial()%>"></td>	    	 
                        </tr>
                        <tr>	
                            <td class="label">CNPJ:</td>
                            <td style="text-align:left"><input type="text" name="Cnpj" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20" value="<%=oFornecedor.getCnpj()%>"></td>                           
                        </tr>
                        <tr>	    	
	     	            <td class="label">Inscrição Estadual:</td>
                            <td style="text-align:left"><input type="text" name="InscrEstadual" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20" value="<%=oFornecedor.getInscrEstadual()%>"></td>
                        </tr>
                        <tr>
                            <td class="label">CEI:</td>
                            <td style="text-align:left"><input type="text" name="CEI" value="<%=oFornecedor.getCEI()%>" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20"></td>
                        </tr> 
                        <tr>
                            <td class="label">Inscrição Municipal:</td>
                            <td style="text-align:left"><input type="text" name="InscrMunicipal" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="20" value="<%=oFornecedor.getInscrMunicipal()%>"></td>
                        </tr>
                        <tr>             
                            <td class="label">Contato:</td>
                            <td style="text-align:left"><input type="text" name="Contato" style="width:60%" class="text_box" maxlength="15" value="<%=oFornecedor.getContato()%>"></td>    
                        </tr>
                        <tr>
                            <td class="label">Cargo:</td>
                            <td style="text-align:left"><input type="text" name="Cargo" style="width:70%" class="text_box" maxlength="20" value="<%=oFornecedor.getCargo()%>"></td>    
                        </tr>
                        <tr>    
                            <td class="label">DDD:</td>
                            <td style="text-align:left"><input type="text" name="DDD" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="3" value="<%=oFornecedor.getDDD()%>"></td>	    	
                        </tr>
                        <tr>
                            <td class="label">Telefone Principal:</td>
                            <td style="text-align:left"><input type="text" name="TelefonePrincipal" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8" value="<%=oFornecedor.getTelefonePrincipal()%>"></td>
                        </tr>
                        <tr>
                            <td class="label">Ramal:</td>
                            <td style="text-align:left"><input type="text" name="Ramal" style="width:30%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="10" value="<%=oFornecedor.getRamal()%>"></td>
                        </tr>
                        <tr>
                            <td class="label">Telefone Recados:</td>
                            <td style="text-align:left"><input type="text" name="TelefoneOpcional" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8" value="<%=oFornecedor.getTelefoneOpcional()%>"></td>
                        </tr>
                        <tr>
                            <td class="label">Fax:</td>                        
                            <td style="text-align:left"><input type="text" name="Fax" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8" value="<%=oFornecedor.getFax()%>"></td>
                        </tr>
                        <tr>
                            <td class="label">Celular:</td>
                            <td style="text-align:left"><input type="text" name="Celular" style="width:50%" class="text_box" onKeyPress="return SomenteNumeroComZero(event)" maxlength="8" value="<%=oFornecedor.getCelular()%>"></td>	    	       
                        </tr>
                        <tr>
                            <td class="label">Email:</td>
                            <td style="text-align:left"><input type="text" name="Email" onBlur="ValidarEmail(this.form.Email)" class="text_box" style="width:60%" value="<%=oFornecedor.getEmail()%>"></td>
                        </tr>  
                        <tr>
                        	<td colspan="2" align="center">
                            <input type="button" value="Cancelar" onClick="Redirect()">&nbsp;&nbsp;
                            <input type="submit" value="Registrar" onClick="Alterar()">&nbsp;&nbsp;  
                            <input type="submit" value="Excluir" onClick="Excluir()">&nbsp;&nbsp;
                            
                            </td>
                        </tr>                      
            </table> 
                            
          </form>									
			    <%}%>						
         <% } else { %>
         			<br>
					<br>
						<h1 align="center"><font color="Red">Você não tem acesso a esta página</font></h1>
					<br>		
					<br>
			    <% }%>
        <br />
                	</div>
		
		
		</td>
	</tr>

</table>
    
    		    <div id="copy">
	    		<%@ include file="/copy.jsp" %>         
	    </div>
</div>
</body>
                                                              
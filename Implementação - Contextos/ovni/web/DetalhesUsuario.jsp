<%@page session="true"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@page import="java.text.*,java.util.*" %>
<%@page import="ovni.negocio.*,ovni.util.*"%>

<%
	Usuario oUsuario  = (Usuario) request.getAttribute("Usuario");
	
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ovni.Net - Detalhes de <%=oUsuario.getNome()%></title>
		<style>
			@import url("styles/styles.css");
		</style>
                <script type="text/javascript">        
				<!--	
					
				
					function Alterar()
					{
						document.form1.action= "AlterarUsuario";
            			document.form1.submit();
        			}
		
					function Excluir()
					{
						document.form1.action= "ExcluirUsuario";
            			document.form1.submit();
					}
					
					function Redirect()
					{
						document.location.href='central_usuario.jsp';			
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
        				<br />
                        <form action="" method="post" name="form1">
                        <input type="hidden" name="Codigo" value="<%=oUsuario.getCodigo()%>">					
						<table width="578" height="393" align="center" class="borda_cinza">
						<input type="hidden" name="TipoUsuario" value="<%=oUsuario.getTipoUsuario() %>" >
<tr>
                            	<td width="58" rowspan="20">
                                	<img src="imgs/buttons/meu_cadastro.gif"/>                        </td>
                   	    </tr>                            
                   	  <tr>
	    					 	<td class="label"> Nome:</td>
    					 	  <td style="text-align:left;width:100%;"><input type="text" name="Nome" value="<%=oUsuario.getNome()%>" class="text_box" style="width:98%"> </td>
					    </tr>
	   						<tr>	
           						<td class="label"> CPF:  </td>
       						  <td style="text-align:left;width:100%;"><input type="text" name="Cpf" value="<%=oUsuario.getCPF()%>" onBlur="ValidarCPF(this.form.Cpf)" maxlength="11" onKeyPress='return SomenteNumeroComZero(event)' class="text_box" style="width:40%">       						  
   						      (ex;000000000)  </td>
					    </tr>
	   						<tr>
	        					<td class="label"> RG:   </td>
        					  <td style="text-align:left;width:100%;"><input type="text" name="Rg" value="<%=oUsuario.getRG()%>" maxlength="9" onkeypress='return SomenteNumeroComZero(event)' class="text_box" style="width:40%">   </td>
   					    </tr>
	   						<tr>
	    						<td class="label"> Orgao Emissor: </td>
    						  <td style="text-align:left;width:100%;"><input type="text" name="OrgaoEmissor" value="<%=oUsuario.getOrgaoEmissor()%>" class="text_box" style="width:20%"></td>
					    </tr>
	   						<tr>
	   							<td class="label"> Naturalidade: </td>
   							  <td style="text-align:left;width:100%;"><input type="text" name="Naturalidade" value="<%=oUsuario.getNaturalidade()%>" class="text_box" style="width:40%"></td>
   					    </tr>
	   						<tr>  
	    						<td class="label"> Sexo: </td>
   						  <td style="text-align:left;width:100%;">                          
                          
	    							<select name="Sexo" style="width:25%">                                      
                                    	 <% if(oUsuario.getSexo().equals("M")){ %>
	    									<option value="M" selected>Masculino</option>
	    									<option value="F">Feminino</option>
                                         <%}else{%>
                                         	<option value="M">Masculino</option>
	    									<option value="F"  selected>Feminino</option>
                                         <%}%>
	    							</select>
	    					</td>	
					    </tr>	    	
	   						<tr>
	        					<td class="label">Data Nascimento: </td>	   	 
   						  <td style="text-align:left;width:100%;">
	    						<input type="text" name="Data" value="<%=Util.formatarData(oUsuario.getDataNascimento())%>" maxlength="10" class="text_box" style="width:30%">	
	    				</td>
					    </tr>	    	
	   						<tr>
       							<td class="label"> DDD: </td>
   							  <td style="text-align:left;width:100%;"><input type="text" name="DDD" value="<%=oUsuario.getDDD()%>" maxlength="3" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:15%"> 
   							  (ex: 011)</td>
				      </tr>	    	
	   						<tr>		
            					<td class="label"> Telefone Principal: </td>
           					  <td style="text-align:left;width:100%;"><input type="text" name="TelefonePrincipal" value="<%=oUsuario.getTelefonePrincipal()%>" maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%"> 
           					  (ex: 0000000) </td>
       				    </tr>	    	
	   						<tr>
            					<td class="label"> Ramal: </td>
           					  <td style="text-align:left;width:100%;"><input type="text" name="Ramal" value="<%=oUsuario.getRamal()%>" maxlength="5" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:15%"></td>	   
					    </tr>	    	
	   						<tr>
       							<td class="label"> Telefone Recados: </td>
   							  <td style="text-align:left;width:100%;"><input type="text" name="TelefoneOpcional" value="<%=oUsuario.getTelefoneOpcional()%>" maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%">						        (ex: 0000000) </td>
					    </tr>       
       						<tr> 
	    						<td class="label"> Fax:  </td>
    						  <td style="text-align:left;width:100%;"><input type="text" name="Fax" value="<%=oUsuario.getFax()%>" maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%">   						        (ex: 0000000) </td>	    	    	       
					    </tr>	    	
	   						<tr>
       							<td class="label"> Celular: </td>
   							  <td style="text-align:left;width:100%;"><input type="text" name="Celular" value="<%=oUsuario.getCelular()%>" maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%">						        (ex: 0000000) </td>	
					    </tr>
	   						<tr>              
            					<td height="24" class="label"> E-Mail: </td>
           					  <td style="text-align:left;width:100%;"><input type="text" readonly name="Email" value="<%=oUsuario.getEmail()%>" maxlength="200" onBlur="ValidarEmail(this.form.Email)" class="text_box" style="width:70%"> </td>  
           				  </tr>	  
                          				
                      <tr>  
            					<td colspan="2" align="center">
                            <input type="image" src="imgs/buttons/btnCancelar.gif" value="Cancelar" onClick="Redirect()">&nbsp;&nbsp;
                              <input type="image" src="imgs/buttons/btnRegistrar.gif" value="Registrar" onClick="Alterar()">&nbsp;&nbsp;   
                              <input type="image" src="imgs/buttons/btnDeletar.gif" value="Excluir" onClick="Excluir()"></td>   
   						  </tr>      
                       	  </table> 
          </form>		<br /><br />	
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



                                                              
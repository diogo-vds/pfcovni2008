<%@page session="true"%>
<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">   
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@page import="ovni.negocio.Usuario"%>
<% 	Usuario oUsuario  = (Usuario) session.getAttribute("Usuario"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Levando voc� as Alturas : Inserir Avaliacao Atendimento</title>
		<style>
			@import url("styles/styles.css");
		</style>	
		<script>
                <!--					
                    function Alterar()
					{
						document.form1.action.value = "AlterarEndereco";
            			document.form1.submit();
        			}
		
					function Excluir()
					{
						document.form1.action.value = "ExcluirEndereco";
            			document.form1.submit();
					}
					
					function Inserir()
					{
						document.form1.action = "InserirAvaliacaoSite";
            			document.form1.submit();			
        			}
					
					function Redirect()
					{
						document.location.href="/loggin/central_usuario.jsp";			
        			}        			
        			
                //-->
                </script>
    </head>
<div id="geral">

<table style="width:100%">
	<tr>
		<td align="center" >

    <div id="principal">
        <div id="topo" >
            <%@ include file="/topo.jsp" %>
        </div>     
        <div id="content_full">  
<body>
            <table class="principal" cellspacing=0 cellpadding=0>	
		
		<tr>
                    <td align="center" height="22px"></td>						
        </tr>        
		<tr><td><br><br></td></tr>
		<td valign="top">
		    		<!-- Carregar Form -->
                        <!-- Carregar Form -->
          <form name="form1" method="post">
            <table width="600" height="354" align="center" class="borda_cinza">
				<td width="10%" rowspan="20"></td>
                            <tr>
                               <td colspan="2"><input type="hidden" name="Codigo"></td>
                            </tr>                           
                            <tr>
                              <td ><input type="hidden" name="Usuario" class="text_box" style="width:80%" maxlength="20" value="<%= oUsuario.getNome()%>"></td>
                            </tr>                           
                            <tr>
                                <td class="label">Avaliacao:
                                <textarea name="Avaliacao"></textarea></td>
                            </tr>                            
                            <tr>
                            	<td height="35" colspan="2" align="center">
                           	    	<input type="button" value="Registrar" onClick="Inserir()" >&nbsp;&nbsp; 
                                    <input type="reset" value="Limpar">&nbsp;&nbsp;
                                    <input type="button" value="Cancelar" onClick="Redirect()">
                                </td>
                          </tr>                 
                        </table>
          </form>   <br>        <br>
          
          
          
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
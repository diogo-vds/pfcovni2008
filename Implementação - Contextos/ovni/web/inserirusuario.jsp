<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="util.*"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.util.Vector"%>
<%@ page import="java.math.*" %>
<%@ page import="java.lang.Object"%>
<% 	ResultSet rsTipoUsuario = (ResultSet)request.getAttribute("TipoUsuario");%>
<html>
<title> OVNI.net - Cadastro de Usuários </title>
<head>
		<style>
			@import url("styles/styles.css");
		</style>	
                <script>
                <!--	
				    function Redirect()
					{
						document.location.href='central_usuario.jsp';			
        			}
					
					function ValidarForm()
					{
						var str = "";
						
						if(document.form.Nome.value == "")str += "Nome deve ser preenchido<br>";
						
						if(document.form.Cpf.value == "") str += "CPF deve ser preenchido<br>";
						
						if(document.form.Rg.value == "")  str += "RG deve ser preenchido<br>";
						
						if(document.form.Email.value == "") str += "Email deve ser preenchido<br>";
						
						if(document.form.Senha.value == "") str += "Senha deve ser preenchida<br>";
						
						if(document.form.Senha.value != document.form1.ConfSenha.value) str += "Senha deve ser confiram <br>";
						
						if(str != "")
						{
							alert(str);
						}
						else
						{
							document.form.submit();
						}
					
					}					
					
                //-->
                </script>
                <script language="javascript" src="js/validacoes.js"> </script>
</head>
 <body>
<div id="geral">
    <div id="principal">
        <div id="topo" >
            <%@ include file="/topo.jsp" %>
        </div>
        <div id="content_full">
        
            			<br />
						<%
                            if (request.getAttribute("valido") == "nao" | request.getAttribute("valido") == null ) {
                        %>
         				 <form name="Validar" method="post" action="/ovni/InserirUsuario">
								<table width="300" align="center" class="borda_cinza">								
                                    <tr>
                                    	<th colspan="2" width="100%"> Verificar disponibilidade </th>
                                    </tr>
                                    <tr>
                                         <td class="label" width="20%"> Email:</td>
                                         <td width="80%">
                                         		<input type="text" name="ValidaEmail"  maxlength="200" onBlur="ValidarEmail(this.form.ValidaEmail)" class="text_box" style="width:95%">
                                         </td>
                                    </tr>
                                    <tr>
                                      <td  width="100%" colspan="2" align="center">
                                      		<input type="hidden" name="acao" value="1"><input type="submit" value="Verificar">
                                       </td>
                                    </tr>
                                </table>
                        </form>
                        
                        			<%
                          				  if (request.getAttribute("valido") == "nao" && request.getAttribute("valido") != null ) 
										  {
                        			%>
                                        <table align="center" width="140">
                                            <tr>
                                                <td width="10%" align="right"><img src="imgs/buttons/alerta.png" /></td>
                                                <td class="erro" width="90%"  align="left">Email já cadastrado</td>
                                            </tr>
                                        </table>
                                    <%	  }	%>
                                <br/>
                                <br/>
                                <%
                                    }
                                    else
                                    {
                                %>
                        
                        
        		<form name="form" method="post" action="/ovni/InserirUsuario">
                       						<table width="610" height="393" align="center" class="borda_cinza">
<tr>
                            	<td width="10%" rowspan="22">
                                	<img src="imgs/buttons/meu_cadastro.gif"/>                        </td>
               	    </tr>
                          	<tr>
                        		<td colspan="2"><input type="hidden" name="TipoUsuario" value=1>                        	</tr> 
   	      <tr>
	    					 	<td class="label" nowrap> Nome:</td>
	 	    <td style="text-align:left;width:60%;"><input type="text" name="Nome"  class="text_box" style="width:95%" onBlur="Requerido(this.form.Nome)"></td>
					    </tr>
	   						<tr>	
           						<td class="label" nowrap> CPF:  </td>
       						  <td style="text-align:left;width:60%;"><input type="text" name="Cpf" onBlur="ValidarCPF(this.form.Cpf)" maxlength="11" onKeyPress='return SomenteNumeroComZero(event)' class="text_box" style="width:40%">       						  
   						      (ex;000000000) </td>
					    </tr>
	   						<tr>
	        					<td class="label" nowrap> RG:   </td>
        					  <td style="text-align:left;width:60%;"><input type="text" name="Rg"  maxlength="9" onKeyPress='return SomenteNumeroComZero(event)' class="text_box" style="width:40%"></td>
   					    </tr>
	   						<tr>
	    						<td class="label" nowrap> Orgao Emissor: </td>
    						  <td style="text-align:left;width:60%;"><input type="text" name="OrgaoEmissor"  class="text_box" style="width:20%"></td>
					    </tr>
		  <tr>
	   							<td class="label" nowrap> Naturalidade: </td>
   							  <td style="text-align:left;width:60%;"><input type="text" name="Naturalidade"  class="text_box" style="width:40%"> </td>
   					    </tr>
	   						<tr>  
	    						<td class="label" nowrap> Sexo: </td>
   						  <td style="text-align:left;width:60%;">
	    							<select name="Sexo" style="width:25%">
   								    <option value="M">Masculino</option>
	    								<option value="F">Feminino</option>
	    							</select>    						  </td>	
					    </tr>	    	
	   						<tr>
	        					<td class="label" nowrap>Data Nascimento: </td>	   	 
   						  <td style="text-align:left;width:60%;">
	    							<select name="Dia">	    						
	    								<option value=0></option>
	    								<option value=01>01</option><option value=02>02</option>
	    								<option value=03>03</option><option value=04>04</option>
	    								<option value=05>05</option><option value=06>06</option>
	    								<option value=07>07</option><option value=08>08</option>
	    								<option value=09>09</option><option value=10>10</option>
	    								<option value=11>11</option><option value=12>12</option>
	    								<option value=13>13</option><option value=14>14</option>
	    								<option value=15>15</option><option value=16>16</option>
	    								<option value=17>17</option><option value=18>18</option>
	    								<option value=19>19</option><option value=20>20</option>
	    								<option value=21>21</option><option value=22>22</option>
	    								<option value=23>23</option><option value=24>24</option>
	    								<option value=25>25</option><option value=26>26</option>
	    								<option value=27>27</option><option value=28>28</option>
	    								<option value=29>29</option><option value=30>30</option>
	    								<option value=31>31</option>	    		
	    					  		</select>

	    							<select name="Mes">	    					
	    								<option ></option>
	    								<option value=0>Janeiro</option><option value=1>Fevereiro</option>
	    								<option value=2>Março</option><option value=3>Abril</option>
	    								<option value=4>Maio</option><option value=5>Junho</option>
	    								<option value=6>Julho</option><option value=7>Agosto</option>
	    								<option value=8>Setembro</option><option value=9>Outubro</option>
	    								<option value=10>Novembro</option><option value=11>Dezembro</option>
	    					  		</select>

	    							<select name="Ano">
	    								<option value=0></option>
	    								<option value=1950>1950</option><option value=1951>1951</option>
	    								<option value=1952>1952</option><option value=1953>1953</option>
	    								<option value=1954>1954</option><option value=1955>1955</option>
	    								<option value=1956>1956</option><option value=1957>1957</option>
	    								<option value=1958>1958</option><option value=1959>1959</option>
	    								<option value=1960>1960</option><option value=1961>1961</option>
						    			<option value=1964>1964</option><option value=1965>1964</option>
	    								<option value=1966>1966</option><option value=1967>1966</option>
	    								<option value=1968>1968</option><option value=1969>1968</option>
	    								<option value=1960>1960</option><option value=1971>1971</option>
	    								<option value=1972>1972</option><option value=1973>1973</option>
	    								<option value=1974>1974</option><option value=1975>1975</option>
	    								<option value=1976>1976</option><option value=1977>1977</option>
	    								<option value=1978>1978</option><option value=1979>1979</option>
	    								<option value=1980>1980</option><option value=1981>1981</option>
	    								<option value=1982>1982</option><option value=1983>1983</option>
	    								<option value=1984>1984</option><option value=1985>1985</option>
	    								<option value=1986>1986</option><option value=1987>1987</option>
	    								<option value=1988>1988</option><option value=1989>1989</option>
	    								<option value=1990>1990</option><option value=1991>1991</option>
	    								<option value=1994>1994</option><option value=1995>1995</option>
	    								<option value=1996>1996</option><option value=1997>1997</option>
	    								<option value=1998>1998</option><option value=1999>1999</option>
	    								<option value=2000>2000</option><option value=2001>2001</option>    		    		
	    					  		</select>     				 		  </td>
					    </tr>	    	
	   						<tr>
       							<td class="label" nowrap> DDD: </td>
   							  <td style="text-align:left;width:60%;"><input type="text" name="Ddd" maxlength="3" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:15%"> 
   							  (ex: 011) </td>
				      </tr>	    	
	   						<tr>		
            					<td class="label" nowrap> Telefone Principal: </td>
           					  <td style="text-align:left;width:60%;"><input type="text" name="TelefonePrincipal"  maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%"> 
           					  (ex: 0000000) </td>
       				    </tr>	    	
	   						<tr>
            					<td class="label" nowrap> Ramal: </td>
           					  <td style="text-align:left;width:60%;"><input type="text" name="Ramal"  maxlength="5" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:15%">  </td>	   
					    </tr>	    	
	   						<tr>
       							<td class="label" nowrap> Telefone Recados: </td>
   							  <td style="text-align:left;width:60%;"><input type="text" name="TelefoneOpcional"  maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%">						        (ex: 0000000) </td>
					    </tr>       
       						<tr> 
	    						<td class="label" nowrap> Fax:  </td>
    						  <td style="text-align:left;width:60%;"><input type="text" name="Fax" maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%">   						        (ex: 0000000) </td>	    	    	       
					    </tr>	    	
	   						<tr>
       							<td class="label" nowrap> Celular: </td>
   							  <td style="text-align:left;width:60%;"><input type="text" name="Celular"  maxlength="8" onKeyPress="return SomenteNumeroComZero(event)" class="text_box" style="width:25%">						        (ex: 0000000) </td>	
					    </tr>
	   						<tr>              
            					<td height="24" class="label" nowrap> E-Mail: </td>
          					  <td style="text-align:left;width:60%;"><input type="text" readonly name="Email" value="<%=request.getParameter("ValidaEmail")%>"  maxlength="200" class="text_box" style="width:60%"></td>  
           				  </tr>	  
                          	<tr>
                          	  <td height="24" class="label" nowrap>Senha:</td>
                          	  <td style="text-align:left;width:60%;"><input type="password" name="Senha"  class="text_box" style="width:60%"></td>
                        	  </tr>
                          	<tr>
                          	  <td height="24" class="label" nowrap>Confirmar Senha:</td>
                          	  <td style="text-align:left;width:60%;"><input type="password" name="ConfSenha"  class="text_box" style="width:60%"></td>
                        	  </tr>
                          	<tr>              
            					<td height="24" class="label" nowrap>Enviar Promoções?:</td>
           					  <td style="text-align:left;width:60%;"><input type="checkbox" name="EnviaPromocoes" ></td>  
           				  </tr>	   						
          <tr>  
            					<td colspan="2" align="center"> 
                                <input type="submit" value="Cadastrar" onClick="this.ValidarForm()" >&nbsp;&nbsp;   
                                <input type="reset" value="Cancelar"></td>   
   						  </tr>      
               	  </table>
                  <input type="hidden" name="acao" value="2">  
                  <br/>                  
		 </form>
								    <%
                                        if (request.getAttribute("Erro") != null) {
                                    %>
                                    <table align="center" width="169">
                                        <tr>
                                            <td width="10%" align="right"><img src="imgs/buttons/alerta.png" /></td>
                                            <td class="erro" width="90%"  align="left"><%=request.getAttribute("Erro")%></td>
                                        </tr>
                                    </table>
                                    <%
                                        }
                                    %>
                                <%}%>
                  
        </div>			
      <div id="copy">
    			 <%@ include file="/copy.jsp" %>         
      </div>
    </div>
</div>

</body>
</html>
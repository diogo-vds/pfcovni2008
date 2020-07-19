<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="util.*"%>
<%@ page import="java.text.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Alterar Usuario</title>
		<style>
			@import url("styles/styles.css");
		</style>	
<script>
	function reload()
	{
		if(document.form1.codigo=="")
		{
			alert("Digite o Código do Usuario");
			document.form1.focus()
		}
		else
		    document.form1.submit()
	}
</script>
</head>

<div id="geral">

<table style="width:100%">
	<tr>
		<td align="center">

    <div id="principal">
        <div id="topo" >
            <%@ include file="/topo.jsp" %>
        </div>     
        <div id="content_full">
<body>
	<%
	
	//Strings usadas para verificar o formulário
	String cod = request.getParameter("codigo");

	//String de conexão
	Connection con = Util.getConexao();
	
	
	//se o código for nulo, exibir formulário para pegar o código
    if(cod==null )
    {
    %>
    <form name="form1" method="get" action="alterarusuario.jsp">
     <table>
	  <tr>
		<td>
			Insira o código do Usuário <input type="text" name="codigo">
		</td>
        <td>
        	<input type="button" value="Buscar" OnClick=reload()>
        </td>
      </tr>       

    </table> 
   </form>
   
   <% }
    
   	 if(cod!=null){
   		//String para buscar o Usuario na tabela
   		String sql1 = "select * from usuario where _codigo = "+cod;
   		PreparedStatement pstm1 = con.prepareStatement(sql1);
   		ResultSet rs1 = pstm1.executeQuery();
   		
   		//Verificando o ResultSet
   		if(rs1.next()){

   	 	%>
   	 	<form name="form2" method="get" action="/ovni/AlterarUsuario">
   	 	<table>
   	     <tr>
   	   		<td>Código: <%=rs1.getInt("_Codigo")%></td>
   	 		<td><input type="hidden" name="Codigo" value="<%=rs1.getInt("_Codigo")%>"></td>
   	 		<td><input type="hidden" name="NivelAcesso" value="<%=rs1.getInt("_Codigo")%>"></td>
   	 	 </tr><tr>	
   	 		<td>Nome </td>
	    	<td><input type="text" name="Nome" value="<%=rs1.getString("_Nome")%>"></td>
    	 </tr><tr>
    	    <td>CPF  </td>
        	<td><input type="text" name="CPF" value="<%=rs1.getString("_CPF")%>"> </td>        	
         </tr><tr>
	    	<td>RG </td>
	    	<td><input type="text" name="RG" value="<%=rs1.getString("_RG")%>"></td>	    	 
         </tr><tr>	    	
	     	<td>Órgão Emissor </td>
	     	<td><input type="text" name="OrgaoEmissor" value="<%=rs1.getString("_OrgaoEmissor")%>"></td>
         </tr><tr>
	    	<td>Naturalidade </td>
	    	<td><input type="text" name="Naturalidade" value="<%=rs1.getString("_Naturalidade")%>"></td>
	     </tr>	
	     <tr>
	        <td>Data Nascimento </td>
	   	 
	    	<td><select name="Dia">
	    						<%
	    							java.util.Date data = rs1.getDate("_DataNascimento");        	
							    	Calendar calendario = Calendar.getInstance();
							    	calendario.setTime(data);
									int dia = calendario.get(Calendar.DATE);
	    						%>
	    							<option value=0><%=dia%></option>
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
	    						<%
									int mes = calendario.get(Calendar.MONTH);
									mes = mes+1;
	    						%>
	    							<option value=0><%=mes%></option>
	    							<option value=1>Janeiro</option><option value=2>Fevereiro</option>
	    							<option value=3>Março</option><option value=4>Abril</option>
	    							<option value=5>Maio</option><option value=6>Junho</option>
	    							<option value=7>Julho</option><option value=8>Agosto</option>
	    							<option value=9>Setembro</option><option value=10>Outubro</option>
	    							<option value=11>Novembro</option><option value=12>Dezembro</option>
	    					  </select>

	    	<select name="Ano">
	    						<%  	
									int ano = calendario.get(Calendar.YEAR);
	    						%>
	    							<option value=0><%=ano%></option>
	    							<option value=1950>1950</option><option value=1951>1951</option>
	    							<option value=1952>1952</option><option value=1953>1953</option>
	    							<option value=1954>1954</option><option value=1955>1955</option>
	    							<option value=1956>1956</option><option value=1957>1957</option>
	    							<option value=1958>1958</option><option value=1959>1959</option>
	    							<option value=1960>1960</option><option value=1961>1961</option>
						    		<option value=1964>1964</option><option value=1965>1964</option>
	    							<option value=1966>1966</option><option value=1967>1966</option>
	    							<option value=1968>1968</option><option value=1969>1968</option>
	    							<option value=1970>1970</option><option value=1971>1971</option>
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
	    					  </select>
	    				 </td>
	     </tr><tr>	    	
	     	<td>Sexo </td>
	     	<td><input type="text" name="Sexo" value="<%=rs1.getString("_Sexo")%>"></td>
         </tr><tr>	 
         </tr><tr>	    	
	     	<td>E-mail </td>
	     	<td><input type="text" name="Email" value="<%=rs1.getString("_Email")%>"></td>
         </tr><tr>	
         </tr><tr>	    	
	     	<td>Senha </td>
	     	<td><input type="password" name="Senha" value="<%=rs1.getString("_Senha")%>"></td>
         </tr><tr>	   	
	       	<td>DDD </td>
	    	<td><input type="text" name="DDD" value="<%=rs1.getString("_DDD")%>"></td>	    	
         </tr><tr>
            <td>Telefone Principal </td>
            <td><input type="text" name="Telefone1" value="<%=rs1.getString("_Telefone1")%>"></td>
	    	<td>Telefone Recados </td>
	    	<td><input type="text" name="Telefone2" value="<%=rs1.getString("_Telefone2")%>"></td>
	     </tr><tr>
	    	<td>Fax  </td>
	    	<td><input type="text" name="Fax" value="<%=rs1.getString("_Fax")%>"></td>
	    	<td>Celular </td>
	    	<td><input type="text" name="Celular" value="<%=rs1.getString("_Celular")%>"></td>	    	       
         </tr>
	        
	     </table> 
	     <input type="submit" value="Alterar">  
	    </form><%}%>
   	 	
   	 	
   	 	<%}
   %>
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
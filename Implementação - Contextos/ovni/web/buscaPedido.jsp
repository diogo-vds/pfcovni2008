<%	
	TipoStatusPedido status = new TipoStatusPedido();
	ResultSet oRsStatus;
	
	oRsStatus = status.retornarTipos();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    </head>
<body>
	<form name="frmBusca" method="post" action="/ovni/PesquisarPedido">
	<br><br>
	<table width="578" height="40" align="center" class="borda_cinza">
	<tr>
		<td>
			<input type="radio" name="opcao" checked="true" value="Codigo"> <font class="texto12bold_green">Buscar por C&oacute;digo</font>
		</td>
	</tr>
	<tr>
		<td align="center">
			C&oacute;digo do Pedido <input type="text" onKeyPress='return SomenteNumeroComZero(event)' name="Codigo" maxlength="12" class="text_box" style="width:15%">
			<input type="submit" value="BUSCAR">
		</td>
	</tr>
	</table>
	<br>
	<table width="578" height="71" align="center" class="borda_cinza">
  <tr>
		<td height="39">
	    <input type="radio" name="opcao" value="Status"> 
			<font class="texto12bold_green">Buscar por Status</font>
		</td>
	</tr>
	<tr>
		<td align="center">
			Status do Pedido <select name="Status">
				<option SELECTED value="0"></option>
<%
				while(oRsStatus.next())
				{
%>
				<option value="<%=oRsStatus.getInt("_Codigo")%>">
					<%=oRsStatus.getString("_Descricao")%>
			  </option>
<%
			}//Final do while(oRsStatus.next())
		%>	
			</select>
			<input type="submit" value="BUSCAR">
		</td>
	</tr>
	</table>
	<br><br>
	
	<table width="600" height="40" align="center" class="borda_cinza">
	<tr>
		<td>
			<input type="radio" name="opcao" value="Data"> <font class="texto12bold_green">Buscar por Status</font>
		</td>
	</tr>
	<tr>
		<td align="left">
			Data Inicio:  
				Mes <select name="MesI">	    					
			    	<option SELECTED value=001></option>
			    	<option value=0>Janeiro</option><option value=1>Fevereiro</option>
			    	<option value=2>Marco</option><option value=3>Abril</option>
			    	<option value=4>Maio</option><option value=5>Junho</option>
			    	<option value=6>Julho</option><option value=7>Agosto</option>
			    	<option value=8>Setembro</option><option value=9>Outubro</option>
			    	<option value=10>Novembro</option><option value=11>Dezembro</option>
			    </select>
			    Ano <select name="AnoI">
			    	<option SELECTED value=001></option>
			    	<option value=2007>2007</option><option value=2008>2008</option>    		    		
			    </select> 
			Data Fim:  
				Mes <select name="MesF">	    					
			    	<option SELECTED value=001></option>
			    	<option value=0>Janeiro</option><option value=1>Fevereiro</option>
			    	<option value=2>Marco</option><option value=3>Abril</option>
			    	<option value=4>Maio</option><option value=5>Junho</option>
			    	<option value=6>Julho</option><option value=7>Agosto</option>
			    	<option value=8>Setembro</option><option value=9>Outubro</option>
			    	<option value=10>Novembro</option><option value=11>Dezembro</option>
			    </select>
			    Ano <select name="AnoF">
			    	<option SELECTED value=001></option>
			    	<option value=2007>2007</option><option value=2008>2008</option>    		    		
			    </select>
			<input type="submit" value="BUSCAR">
		</td>
	</tr>
	</table>
	</form>
	    <br>
</body>
</html>

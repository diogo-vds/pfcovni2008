<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*"%>
<%@page import="ovni.negocio.*,ovni.util.*"%>
<%
	Vector listaPromocao = (Vector) session.getAttribute("promocoesCadastradas"); 
%>


<html>
<script language="javascript" src="<%=request.getContextPath()%>/js/validacoes.js"> </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Promoções</title>
		<style>
			@import url("styles/styles.css");
		</style>	
    </head>    
<body>
<div id="geral">
<table style="width:100%">
	<tr>
		<td align="center">
    <div id="principal">
        <div id="topo">
            <%@ include file="/admin/topo.jsp" %>
        </div>        
        <div id="content_full">
           		<table>        
        <%
if (listaPromocao != null)
{
	if (listaPromocao.size() > 0)
	{
	%>
		<table width="500" align="center" class="borda_cinza">
		<tr>
			<th width="50%"> Titulo		</th>
			<th width="16%"> ValorR$	</th>
			<th width="28%"> Valor Promocional	</th>
			<th width="06%"> alt		</th>
		</tr>		
	<%
	
		for (int iCont = 0; iCont < listaPromocao.size(); iCont++)
		{
			String sCor = (iCont % 2 == 0 ) ? "#fafafa" : "#ffffff";
		%>
		<form name="frmDadosPromocao" method="post" action="/ovni/Promocao">
	        <input type="hidden"  name="flag" value="alterarDados">
			<tr style="background-color:<%=sCor%>">
				<input type="hidden" name="posicao" value="<%=iCont%>">
				<td align="center"> <%=((Promocao)listaPromocao.elementAt(iCont)).getProduto().getTitulo()%></td>
				<td align="right" > <%=Moeda.toReal(((Promocao)listaPromocao.elementAt(iCont)).getProduto().getValor())%> </td>
				<td align="right" > <input type="text" maxlength="6" class="text_box" style="width:90%" name="valorPromo" OnKeyDown="formataMoeda(this,'.',',',event)" value="<%=Moeda.toReal(((Promocao)listaPromocao.elementAt(iCont)).getValorPromocao())%>"></td>
				<td align="center"> <input alt="Atualizar"  type="image" src="imgs/layout/Edit.gif" value="Atualizar"/>
			</tr>
		</form>
	
		<%
		}//final do for
		%>		
		</table>
		<form name="finalizarPromocao" method="post" action="/ovni/Promocao">	
		<table width="500" align="center" class="borda_cinza">
			<tr>
				<td>Selecione a data e clique em Cadastrar Promocao: </td>
        			<td>
    					Dia <select name="Dia">
    							<option value=1>1</option><option value=2>2</option><option value=3>3</option><option value=4>4</option>
    							<option value=5>5</option><option value=6>6</option><option value=7>7</option><option value=8>8</option>
    							<option value=9>9</option><option value=10>10</option><option value=11>11</option><option value=12>12</option>
    							<option value=14>14</option><option value=15>16</option><option value=16>16</option><option value=17>17</option>
    							<option value=18>18</option><option value=19>19</option><option value=20>20</option><option value=21>21</option>
    						    <option value=22>22</option><option value=23>23</option><option value=24>24</option><option value=25>25</option>
    						    <option value=26>26</option><option value=27>27</option><option value=28>28</option><option value=29>29</option>						
    							<option value=30>30</option><option value=31>31</option>			
    						</select>
        				Mes <select name="Mes">	    					
						    	<option SELECTED value=0>Janeiro</option><option value=1>Fevereiro</option>
						    	<option value=2>Marco</option><option value=3>Abril</option>
						    	<option value=4>Maio</option><option value=5>Junho</option>
						    	<option value=6>Julho</option><option value=7>Agosto</option>
						    	<option value=8>Setembro</option><option value=9>Outubro</option>
						    	<option value=10>Novembro</option><option value=11>Dezembro</option>
						    </select>
					    Ano <select name="Ano">
					    	<option SELECTED value=2008>2008</option>  
					    	<option value=2009>2009</option><option value=2010>2010</option>    		    		
					    </select> 
					</td>
				</tr>
				<tr>		
					
					<input type="hidden" name="flag" value="finalizar">				
					<td align="right" colspan="2"> <input type="submit" value="Cadastrar Promocao"> </td>
					</form>
				</tr>
		</table>
		<%	
	}//final do if (listaProdutos.size() > 0)
	else
	{
		%> Nenhum produto encontrado <%
	}
} //final do if (listaProdutos != null)
%>

           
        
		</div>			
		</td>
	</tr>
</table>
<div id="copy">
    			 <%@ include file="/copy.jsp" %>         
      </div>
    </div>
</div>
</body>
</html>
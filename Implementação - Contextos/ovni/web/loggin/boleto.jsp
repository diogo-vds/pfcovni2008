<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="util.*"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.math.*" %>
<%@ page import="java.lang.Object"%>
<%@ page import="java.util.Date;"%>

<html>
    <head>
        <title>OVNI.net - Ofertas de outro mundo : Boleto</title>
    </head>
	<script>
		
	</script>
<body>
<%
	ResultSet rs = null;
	long codigo = 0;
	
	if(request.getAttribute("rsLista")!=null){
		rs = (ResultSet) request.getAttribute("rsLista");
		if(rs.next()){
			%>
				<table>
				<form action="/ovni/ManterBoleto" method="post" target="_blank">
						<tr>
							<td>.:Nº Pedido:</td>
							<td><select name="codigo">
								<option value="<%=rs.getLong("_numeroPedido")%>">
								<%=rs.getLong("_numeroPedido") %>						
								</option>
			<%
			while(rs.next()){%>
							<option value="<%=rs.getLong("_numeroPedido")%>">
							<%=rs.getLong("_numeroPedido") %>						
							</option>						
			<%}%>		
							</select></td>
							<td><input type="submit" value="Imprimir"></td>
						</tr>

				</form>
				</table>
			<%
			
		}else{
			out.println("Nenhum boleto em aberto Porra!!!");
		}
		
	}else if(request.getAttribute("codigoBoleto")!=null){
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat df2 = new SimpleDateFormat("ddMMyyyy");
		String valor = (String) request.getAttribute("valorBoleto");
		String nossonumero = (String) request.getAttribute("nossoNumero");
		String numeropedido = (String) request.getAttribute("numeroPedido");
		String usuario = (String) request.getAttribute("nomeUsuario");
		Date vencimento = (Date) request.getAttribute("dataVencimento");
		Date processamento = (Date) request.getAttribute("dataProcessamento");
		String cedente = (String) request.getAttribute("cedente");
		String linhadigitavel = (String) request.getAttribute("linhaDigitavel");
		String codigoBoleto = (String) request.getAttribute("codigoBoleto");
		//Montando Boleto na tela!
		
		%>
		<table border=1>
			<tr>
				<td>Cedente<br><%=cedente%></td>
				<td colspan="2">Agencia/Código do cedente<br>
				1172-0/0403005-2</td>
				<td>Espécie<br>
				R$</td>
				<td>Quantidade<br>
				1</td>
				<td>Nosso número<br><%=nossonumero%></td>
			</tr>
			<tr>
				<td colspan>Numero do documento<br>
				<%=numeropedido%></td>
				<td colspan="2">CPF/CNPJ<br>
				</td>
				<td>Vencimento<br>
				<%=df.format(vencimento)%></td>
				<td colspan="2">Valor documento<br>
				<%=valor%></td>
			<tr>
				<td>(-)Desconto/Abatimentos<br>
				</td>
				<td colspan="2">(-)Outras Deduções<br>
				</td>
				<td>(+)Mora/Multa<br>
				</td>
				<td>(+)Outros acréscimos<br>
				</td>
				<td>Valor cobrado<br>
				</td>
			</tr>
			<tr>
				<td colspan="6">Sacado<br>
				</td>
				</td>
			</tr>
			<tr>
			<tr>
				<td colspan="6">Demonstrativo de Pagamento Ovni<br>
				Pagamento do Pedido nº <%=numeropedido%><br>
				Valor do Boleto R$3,00<br>
				http://www.ovni.com.br <br>
				<br>
				<br>
				<p align="right">corte na linha pontilhada<br>
				----------------------------------------------------------------------------------------------------------------------------
				</p>
				</td>
			</tr>
			<tr>
				<td colspan="5">Local do pagamento<br>
				Pagável em qualquer banco até o vencimento
				<td colspan="1">Vencimento
				<p align="right"><%=df.format(vencimento)%></p>
			</tr>
			<tr>
				<td colspan="5">Cedente<br>
				<%=cedente%></td>
				<td colspan="1">Agência/Código cedente
				<p align="right">1172-0/0403005-2</p>
			</tr>
			<tr>
				<td>Data do documento <%
					out.println(df.format(processamento));
				%>
				</td>
				<td>Nº documento<br>
				19</td>
				<td>Espécie doc.<br>
				OS</td>
				<td>Aceite</td>
				<td>Data do Processamento <%
					out.println(df.format(processamento));
				%>
				</td>
				<td>Nosso Número<br>
				<%=nossonumero%></td>
			</tr>
			<tr>
				<td>Uso do banco</td>
				<td>Carteira<br>
				06</td>
				<td>Espécie<br>
				R$</td>
				<td>Quantidade<br>
				001</td>
				<td>Valor documento<br>
				<%=valor%></td>
				<td>Valor documento<br>
				<%=valor%></td>
			</tr>
			<tr>
				<td colspan="5" rowspan="3">Instruções</td>
				<td>Desconto/Abatimento</td>
			<tr>
				<td>Outras Deduções</td>
			</tr>
			<tr>
				<td>Juros/Multa</td>
			</tr>
		</table>
		<font face="IDAutomationHC39M"> <%
		 	out.println(linhadigitavel);
		%> </font>
		<br>
		<br>
  <%}else{
		response.sendRedirect("/ovni/ManterBoleto");
		//out.println("Teste ok!");
	}
%>
</body>
</html>
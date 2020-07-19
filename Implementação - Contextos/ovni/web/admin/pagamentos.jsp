<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*"%>
<%@page import="ovni.negocio.*,ovni.util.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Escolha um Endere&ccedil;o</title>
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
        
        <form name="frmPagamentoCartao" method="post" action="/ovni/ConfirmarPagamento">
	        <input type="hidden" name="flag" value="CARTAOCREDITO">
	        <input type="submit" value="Efetuar pagamento TEF">
        </form>
        <br><br>
        <form name="frmPagamentoBoleto" method="post" action="/ovni/ConfirmarPagamento">
	         <input type="hidden" name="flag" value="BOLETO">
	        <input type="file" name="path">
	        <br>
	        <input type="submit" value="Efetuar pagamento Boleto">
        </form>
        <br><br>
        <form name="frmPagamentoCelular" method="post" action="/ovni/ConfirmarPagamento">
	         <input type="hidden" name="flag" value="CELULAR">
	        <input type="submit" value="Efetuar pagamento Celular">
        </form>
        
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
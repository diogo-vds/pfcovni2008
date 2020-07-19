<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*"%>
<%@page import="ovni.negocio.*,ovni.util.*"%>
<%
	Usuario usu = (Usuario) session.getAttribute("Usuario");
	Vector ends = usu.getListaEnderecos() ;	
%>

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
            <%@ include file="/topo.jsp" %>
        </div>
        <div id="content_full">
	        <form name="frmEndereco" method="Post" action="/ovni/FinalizarPedidoDesktopWAP">
	        	<input type="hidden" name="flag" value="pagamento">
		        <table width="650" align="center" class="borda_cinza">
		       		<tr>
						<h1>Escolha um endere&ccedil;o para entrega:</h1>
					</tr>
			        <tr>
			        	<th width="03%">			</th>
			        	<th width="33%">Logradouro	</th>
			        	<th width="04%">Num			</th>
			        	<th width="20%">Bairro		</th>
			        	<th width="30%">Cidade		</th>
			        	<th width="10%">CEP			</th>
			        </tr>
        			<tr style="background-color:#fafafa" >
						<td align="center"> <input type="radio" checked="true" name="OpcaoEndereco" value="<%=((Endereco)ends.elementAt(0)).getCodigo()%>"> </td>
						<td align="center"> <%=((Endereco)ends.elementAt(0)).getRua()%>		</td>
						<td align="center"> <%=((Endereco)ends.elementAt(0)).getNumero()%>	</td>
						<td align="center"> <%=((Endereco)ends.elementAt(0)).getBairro()%>	</td>
						<td align="center"> <%=((Endereco)ends.elementAt(0)).getMunicipio()%></td>
						<td align="center"> <%=((Endereco)ends.elementAt(0)).getCep()%>		</td>
					</tr>
						<%
							for (int iCont = 1; iCont < ends.size(); iCont++ )
							{
							String sCor = (iCont % 2 == 0 ) ? "#fafafa" : "#ffffff";			
						%>
								<tr style="background-color:<%=sCor%>" >
									<td align="center"> <input type="radio" name="OpcaoEndereco" value="<%=((Endereco)ends.elementAt(iCont)).getCodigo()%>"> </td>
									<td align="center"> <%=((Endereco)ends.elementAt(iCont)).getRua()%>		</td>
									<td align="center"> <%=((Endereco)ends.elementAt(iCont)).getNumero()%>	</td>
									<td align="center"> <%=((Endereco)ends.elementAt(iCont)).getBairro()%>	</td>
									<td align="center"> <%=((Endereco)ends.elementAt(iCont)).getMunicipio()%></td>
									<td align="center"> <%=((Endereco)ends.elementAt(iCont)).getCep()%>		</td>
								</tr>
						<%				
							}
						%>
					</table>
				</form>
				
				<table width="380" cellpadding="3" cellspacing="3" align="center">
                	<tr>
                    	<td><a href="default.jsp"><img src="<%=ContextPath%>/imgs/layout/comprar_mais.gif"/></a></td>
                        <td><img src="<%=ContextPath%>/imgs/layout/finalizar_pedido.gif"/ onClick="this.document.frmEndereco.submit()"></td>                                
                    </tr>
                </table>
			
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
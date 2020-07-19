<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*"%>
<%@page import="ovni.negocio.*,ovni.util.*"%>
<%
	Carrinho _Carrinho = (Carrinho) request.getAttribute("oCarrinho");
	int iPosicao;
	String sDescricao;
	float fValorUnitario;
	int iQuantidade;
	float fValorTotalItem;
	float fValorTotalCompra;
	float dValorFrete;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Carrinho de Compras</title>
		<style>
			@import url("styles/styles.css");
		</style>	
    </head>
<script language="Javascript">
function apagarItem(posi)
{
	var acao = "/ovni/ExcluirCarrinho";
	frmExcluir.Posicao.value = posi; 
	frmExcluir.submit();	
}

function ValidarAlteracao(oldValue, posicao)
{
	if(this.frmAlterar.Quantidade.value == "" || this.frmAlterar.Quantidade.value == "0" || this.frmAlterar.Quantidade.value > (parseInt("4")))
	{
		alert('Valor incorreto para quantidade');
		frmAlterar.Quantidade.value = oldValue; 
		return false;
	}
	else
	{
		frmAlterar.submit();
		return true;
	}
}
</script>
<script type="text/javascript" src="js/validacoes.js"></script>
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
          <%				
				if(_Carrinho != null)
				{
				%>
					<br />
					<img src="imgs/layout/meus_produtos.gif"/>
					<br /><br />
					<table width="650" align="center" class="borda_cinza">
					  <tr>
		    			<th width="30%" >Descricao</th>
                        <th width="20%" >Valor Unitario (R$)</th>
                        <th width="16%" >Quantidade</th>
                        <th width="30%" >Valor Total(R$)</th>
                        <th width="2%" ></th>
                        <th width="2%" ></th>
			  		  </tr>
				<form name="frmExcluir" method="post" action="/ovni/ExcluirCarrinho">
					<input type="hidden" name="Posicao" value="">
				</form>
				<%
					for( int iCont = 0; iCont <= (_Carrinho.getNumeroItens( )-1); iCont++ )
					{
						String sCor = (iCont % 2 == 0 ) ? "#fafafa" : "#ffffff";
						iPosicao = iCont;	
						sDescricao = _Carrinho.getItem(iCont).getProduto().getTitulo();
						fValorUnitario = _Carrinho.getItem(iCont).getProduto().getValor();
						iQuantidade = _Carrinho.getItem(iCont).getQuantidade();
						fValorTotalItem = _Carrinho.getItem(iCont).getValorItem();
				%>
				  		<tr style="background-color:<%=sCor%>">				                                 
				    			<td> <%=sDescricao%></td>
				    			<td> <%=Moeda.toReal(fValorUnitario)%> </td>
				    					
				    				<td align="center">
				    				<form name="frmAlterar" method="post" action="/ovni/AlterarCarrinho">
										<input name="Quantidade" type="text" style="width:50px" onKeyPress="return SomenteNumeroComZero(event)" value="<%=iQuantidade%>" maxlength="2" class="text_box">
										<input type="hidden" name="Posicao" value="<%=iPosicao%>">
									</td>
				   					<td> 
				   						<%=Moeda.toReal(fValorTotalItem)%>
				   					</td>
									<td>
										<input alt="Atualizar"  type="image" src="imgs/layout/Edit.gif" value="Atualizar" onClick="return ValidarAlteracao(<%=iQuantidade%>, <%=iPosicao%>)"/>
									</td>
									</form>
									<td align="center">
										<input type="image" src="imgs/layout/Delete.gif" alt="Excluir item" onClick=apagarItem(<%=iPosicao%>)>
									</td>
								
				  		</tr>		  
				<%
					} // final do FOR
						dValorFrete = _Carrinho.getValorFrete();
						fValorTotalCompra = _Carrinho.getValorTotal();
				%>
				</form>
						<tr>
                              <td>			     </td>
                              <td>			     </td>
                              <td class="texto11bold_green">Frete:</td>
                              <td colspan="3"><%= Moeda.toReal(dValorFrete) %> </td>		
						</tr>
						<tr>
                            <td>			     </td>
                            <td>			     </td>
                            <td class="texto11bold_red">Valor Total: R$</td>
                            <td colspan="3" class=""><%= Moeda.toReal(fValorTotalCompra)%></td>
					  </tr>
					  
		 		 </table>
				<br>
						<table width="220" align="center" class="borda_cinza">
							<form name="frmFrete" method="post" action="<%=ContextPath%>/CalcularFrete">
                        	<tr>
                        		<td class="texto11bold_red" colspan="2">Digite o CEP:</td>
                        	</tr>
                        	<tr>
                        		<td>
                        			<input type="text" name="CEP" maxlength="8" class="text_box" onKeyPress="return SomenteNumeroComZero(event)">
                        		</td>  
                        		<td>
                        			<input type="submit" value="Calcular Frete">
                        		</td>                             
                            </tr>
                            </form>
                        </table>
								
				<br>
				    <br>
                    	<table width="380" cellpadding="3" cellspacing="3" align="center">
                        	<tr>
                        		<form name="frmFinalizar" method="post" action="<%=ContextPath%>/loggin/endereco.jsp">                   			
                        		</form>
                            	<td><a href="default.jsp"><img src="imgs/layout/comprar_mais.gif"/></a></td>
                                <td><img src="imgs/layout/finalizar_pedido.gif"/ onClick="this.document.frmFinalizar.submit()"></td>                                
                            </tr>
                        </table>
                        
                        <br>
                        <br>
                    
				    <%
				}//Final do IF
				
				else 
				{ %> 
                
                <br />
                <br/>
                <table align="center" width="350">
                	<tr>
                    <td width="20%"><img src="imgs/buttons/erro.gif"/></td>
                    <td class="erro" width="80%" style="font-size:22px;text-align:center">Seu carrinho está vazio! </td>
                    </tr>
                </table>
                <br/>
                <p>
                	Clique <a href="default.jsp"> aqui</a> para efetuar  compras!                </p>
                <br />
                <br/>
				<% } %>
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
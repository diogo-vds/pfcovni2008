<%@page session="true"%>
<%@ page contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8" language="java" errorPage=""%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page
	import="java.util.*,java.sql.*,java.io.*,ovni.util.*,ovni.negocio.*"%>

<html>
<head>
<title>OVNI.net - Ofertas de outro mundo</title>


 <style type="text/css">
       
        @import "./styles/styles.css";
        
    </style>
	 <script language="javascript" src="<%=request.getContextPath()%>/js/validacoes.js"> </script>
     <script language="javascript" > 
     	function Validar()
		{
			if(this.Login.email.value == "" || this.Login.senha.value == "")
			{
				alert('Nome e senha deve ser preenchido');
				return false;
			}
			else
			{
				this.Login.submit();
				return true;
			}
		}
     
     </script>

</head>
<body>
<div id="geral">
<table style="width:100%">
	<tr>
		<td align="center">
		
<div id="principal">
<div id="topo"><%@ include file="/topo.jsp"%>
</div>
<div id="content_full" style="text-align: center">
	<%
	if(session.getAttribute("Usuario") == null) 
	{
	%>
		<form name="Login" action="/ovni/ControleAcesso" method="post"><br />
		<br />
		<input type="hidden" name="acao" value="login">
		<table width="278" align="center" id="login">
			<tr>
		    	<th> Login </th>
		    </tr>
		</table>
		<table width="278" align="center" id="login">
			<tr>
				<td style="width: 20%">
				<div style="text-align: right"><strong>Email:</strong></div>		</td>
				<td width="80%" style="text-align: left"><input type="text" style="width: 95%" name="email" class="text_box" onBlur="ValidarEmail(this.form.email)" /></td>
			</tr>
			<tr>
				<td style="width: 20%">
				<div style="text-align: right"><strong>Senha:</strong></div>		</td>
				<td style="text-align: left"><input type="password"
					 name="senha"class="text_box"/>		</td>
			</tr>
			<tr>
		
				<td height="40" colspan="2" style="width: 100%">
				<div align="center">
				  <input type="image" src="imgs/buttons/entrar.gif"
					onClick="Validar()" />
				</div>		</td>
			</tr>
		</table>
		<br />
		</form>
		<%
			if (request.getAttribute("Erro") != null) {
		%>
		<table align="center" width="358">
			<tr>
				<td width="10%" align="right"><img src="imgs/buttons/alerta.png" /></td>
				<td class="erro" width="90%"  align="left"><%=request.getAttribute("Erro")%></td>
			</tr>
		</table>
		<%
			}
		%>
		<p>&nbsp;</p>
		<p>Ainda n&atilde;o tem registro?</p>
		<br />
		
		<p><a href="inserirusuario.jsp"><img src="imgs/buttons/registrar.gif"
			/></a><br />
		</p>
		<p>&nbsp;</p>
	<%
	}
	else
    {
	%>
    <form name="Loggout" action="/ovni/ControleAcesso" method="post"><br />
	<p><input type="hidden" name="acao" value="logout"></p>
	<p>Deseja realmente sair do site?</p>
	<br />
	<p><input type="image" onClick="document.Loggout.submit()" src="imgs/buttons/btnSim.gif" />
	&nbsp;&nbsp;<a href="default.jsp"><img src="imgs/buttons/btnNao.gif"/></a>
	<br />
	</p>
	<p>&nbsp;</p>
	</form>

<%
	 }
%>

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


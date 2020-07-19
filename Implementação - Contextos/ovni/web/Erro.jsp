<%@page session="true"%>
<%@ page 
    contentType="text/html; charset=iso-8859-1" 
    pageEncoding="UTF-8" 
    language="java"     
    errorPage="" %>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<html>
<head>
    <title> OVNI.net - Grr.. Ocorreu um erro! </title>
    
    <style>@import url(styles/styles.css);</style>
</head>
<body>
<div id="geral">

<table style="width:100%">
	<tr>
		<td align="center">

    <div id="principal">
        <div id="topo" >
            <%@ include file="/topo.jsp" %>
        </div>
        <div id="content_full">
         <br />
                <br/>
                <table align="center" width="200">
               	  <tr>
                    <td width="30%"><img src="imgs/buttons/erro.gif"/></td>
                    <td class="erro" width="70%" style="font-size:22px;text-align:center">ERRO !!!</td>
                    </tr>
                </table>
<br/>
                <center>
                	<%
                		String erro = "";
                		if (session.getAttribute("erro") == null)
                		{ erro = "Erro inesperado. Tente novamente mais tarde."; }
                		else
                		{ erro = (String) session.getAttribute("erro");} 
                		if (erro.contains("E/S") || erro.contains("ClassCastException"))
                		{ erro = "Erro inesperado. Tente novamente mais tarde."; }       		
                			
                	%>
                	<%=erro%>
                </center>
                <br />
<p>
                	Clique <a href="default.jsp"> aqui</a> para retornar!                </p>
                <br />
                <br/>
        


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





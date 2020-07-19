<%@page session="true"%>
<%@ page 
    contentType="text/html; charset=iso-8859-1" 
    pageEncoding="UTF-8" 
    language="java"     
    errorPage="" %>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>

<% String parampesquisa = request.getAttribute("parametro").toString(); %>

<html>
<head>
    <title> OVNI.net - Ofertas de Outro mundo - Buscas por '<%=parampesquisa %>' </title>
    
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
        <div id="menu">
            <%@ include file="/menu.jsp" %>                 
        </div>       
        <div id="content">
                <%@ include file="/result_pesquisa.jsp" %>
        </div>	</td>
	</tr>

</table>
    
    		    <div id="copy">
	    		<%@ include file="/copy.jsp" %>         
	    </div>

    </div>
</div>
</body>




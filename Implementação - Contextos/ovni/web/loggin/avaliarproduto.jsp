<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%@ page import="util.*"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.lang.Object"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OVNI.net - Ofertas de outro mundo : Avaliar Produto</title>
		<style>
			@import url("styles/styles.css");
		</style>
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
		String acao = (String)request.getAttribute("acao");
		long codprod = 0;
		if(acao == null){
			response.sendRedirect("/ovni/AvaliarProduto");
		}else if("avaliado".equals(acao)){
			out.println("<b>Você já registrou sua avaliação deste produto!");
		}else if("avaliar".equals(acao)){
			acao = "avaliacao";
			%>
			<B>Insira sua Avaliação!<B>
			<form name="form" method="post" action="/ovni/AvaliarProduto">
			<input type="hidden" name="acao" value="<%=acao%>">
			<%request.setAttribute("acao",acao);%>
			<input type="hidden" name="codigoproduto" 
				value="<%=request.getAttribute("codigoproduto")%>">
			<table><tr><td><textarea name="avaliacao"></textarea></td></tr>
			<tr><td><input type="submit" value="avaliar"></td></tr>
			</table></form> 
		
		<%}else{
			out.print("<b>"+acao);
		}
		%>
</div>
</td></tr>

</table>
    
    		    <div id="copy">
	    		<%@ include file="/copy.jsp" %>         
	    </div>
</div>
</body>
</html>

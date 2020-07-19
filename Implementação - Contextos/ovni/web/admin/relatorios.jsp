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
    <title> OVNI.net - Ofertas de outro mundo </title>    
    <style>@import url(styles/styles.css);</style>  

	<script>
		function sms(){
			document.relatorios.tipo.value="sms";
			document.relatorios.submit();
		}
		function desktop(){
			document.relatorios.tipo.value="desktop";
			document.relatorios.submit();
		}
	</script>
    
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
        		<!-- Seu Código assim -->
				<table>
        			<form name="relatorios" action="/ovni/GerarRelatorio" method="post">
						<tr>
								<input type="hidden" name="tipo">"
							<td><input type="button" value="Relatorio Desktop" OnClick="desktop()"></td>
							<td><input type="button" value="Relatorio SMS" OnClick="sms()"></td>
						</tr>
					</form>
				</table>		
        </div> 
    	
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

		
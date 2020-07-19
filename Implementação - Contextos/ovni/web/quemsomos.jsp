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
    <title> OVNI.net - Quem Somos </title>
    
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
        		
        	<div style="margin: 5px 5px 5px 5px">
        	
        		<div style="width:24%;position: relative;float: left;">
        		
        			<img src="<%=ContextPath%>/imgs/layout/quemsomos.jpg" />
        		
        		</div>
        		
        		<div style="width:72%;position: relative;float: right	;margin: 6px 6px 6px 6px" >
	        		<p style="text-align: justify"> O grupo Ovni vem marcando forte presença no mercado de Desenvolvimento de Software, vivendo todos os dias do ano para seus projetos, empregando toda sua estrutura do inicio ao fim com o que há de mais moderno em tecnologia e qualidade associadas à alta capacitação técnica de seus profissionais. E é neste dinamismo que redobramos nossos esforços a cada etapa, sempre com o objetivo de em conjunto com nossos clientes ultrapassar desafios e comemorar novas conquistas. </p>
	        		<br><br>
	        		<p style="text-align: justify">Fundada em Mogi das Cruzes no ano de 2007 por um grupo de jovens talentos com sólida experiência na área de Desenvolvimento de Software, o grupo Ovni vem aprimorando suas práticas e métodos de desenvolvimento em busca de proporcionar facilidade de auto-busca e utilização de seu software.</p>
	        		<br/><br/>
	        		<!-- Logos  -->
	        		<a href="http://www.java.com/pt_BR/" target="_blank"><img src="<%=ContextPath%>/imgs/layout/sun-java-logo.gif" onmouseover="Tip('<b> Java </b><br><h7>http://www.java.com/pt_BR</h7>', WIDTH, 180, FADEIN, 400, FADEOUT, 400,BGCOLOR,'#FFFFFF',BORDERCOLOR,'#516A1B',FONTCOLOR,'#516A1B',OPACITY,78)" onmouseout="UnTip()" /></a>
	        		<a href="http://www.postgresql.org/" target="_blank"><img src="<%=ContextPath%>/imgs/layout/postgres_logo.gif" onmouseover="Tip('<b> PostgresSQL </b><br><h7>http://www.postgresql.org</h7>', WIDTH, 180, FADEIN, 400, FADEOUT, 400,BGCOLOR,'#FFFFFF',BORDERCOLOR,'#516A1B',FONTCOLOR,'#516A1B',OPACITY,78)" onmouseout="UnTip()"/></a>
	        		<a href="http://tomcat.apache.org/" target="_blank"><img src="<%=ContextPath%>/imgs/layout/tomcat-logo.gif" onmouseover="Tip('<b> Apache TomCat </b><br><h7>http://tomcat.apache.org</h7>', WIDTH, 180, FADEIN, 400, FADEOUT, 400,BGCOLOR,'#FFFFFF',BORDERCOLOR,'#516A1B',FONTCOLOR,'#516A1B',OPACITY,78)" onmouseout="UnTip()"/></a>
	        		
        		</div>
        	</div>	
        		
        		
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

		
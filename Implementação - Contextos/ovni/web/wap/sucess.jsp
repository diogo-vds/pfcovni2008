<%@ page
	import="java.util.*,java.sql.*,java.io.*,ovni.util.*,ovni.negocio.*"%>


<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml"> 

<% 

	//ResultSet rsProdutos = (ResultSet) request.getAttribute("rsProdutos");

	response.setContentType("text/vnd.wap.wml"); 

    out.println("<wml>"); 
	out.println("<card title=\"OVNI.NET - Sucess \">"); 
			out.println("<br/>"); 		
			out.println("<b>OVNI.NET</b><br/><br/>");
			out.println("<p> Pesquisa por ");		
		
			//while(rsProdutos.next())
			//{
				//out.println( rsProdutos.getString("_titulo") + "R$ " +  rsProdutos.getString("_valor") + "<br/> ");					
			//}			 
			out.println("<br/><br/>");
		out.println("2008&copy; - Ovni.Net");
		out.println("</p>"); 
	out.println("</card>"); 
out.println("</wml>"); 
%> 
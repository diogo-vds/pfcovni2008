<%@page import="ovni.negocio.Usuario"%>
<%@page import="ovni.util.Util"%>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml"> 

<% 

Usuario usu = (Usuario) session.getAttribute("Usuario");

response.setContentType("text/vnd.wap.wml"); 

out.println("<wml>"); 
	out.println("<card title=\"OVNI.NET - Pedidos \" id=\"central\" >"); 
			out.println("<br/>"); 		
			out.println("<p>");		
			out.println("<b>OVNI.NET</b><br/><br/>");
			out.println("<b>Central do Usuário</b><br/>");
			out.println("Usuário: <b>" + usu.getNome() + "</b><br/>");	
			out.println("<anchor><go href=\"#dados\" />Meus Dados</anchor><br/>");
			out.println("<anchor><go href=\"/ovni/wap/loggin/pedidos.jsp\" />Meus Pedidos</anchor><br/>");
			out.println("<br/><br/>");
			out.println("2008&copy; - Ovni.Net || ");
			out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");
		out.println("</p>"); 
	out.println("</card>"); 
	out.println("<card title=\"OVNI.NET - Pedidos \" id=\"dados\" >"); 
		out.println("<br/>"); 		
		out.println("<p>");		
			out.println("<b>OVNI.NET</b><br/><br/>");
			out.println("<b>Meus Dados</b><br/>");
			out.println("<b>Nome:</b> " + usu.getNome() + "<br/>");
			out.println("<b>Nascto:</b> " + Util.formatarData(usu.getDataNascimento()) + "<br/>");
			out.println("<b>Celular:</b> (" + usu.getDDD() + ") " + usu.getCelular() + "<br/><br/>");
			out.println("<anchor><go href=\"#central\" />Central de Usuário</anchor><br/>");
			out.println("<br/><br/>");
			out.println("2008&copy; - Ovni.Net || ");
			out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");		
		out.println("</p>"); 
	out.println("</card>"); 
out.println("</wml>"); 
%> 


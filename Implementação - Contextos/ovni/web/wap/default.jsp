<%@page import="java.util.*"%>
<%@page import="ovni.util.Util"%>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml"> 

<% 
response.setContentType("text/vnd.wap.wml"); 
	out.println("<wml>"); 
		out.println("<card title=\"OVNI.NET - Ofertas de Outro Mundo \">"); 
			out.println("<br/>"); 		
			out.println("<p>");
				out.println("<b>OVNI.NET</b><br/><br/>");
				
				//Busca por Titulo
				out.println("<b>Pesquisar</b><br/>");
				out.println("<input name=\"stitulo\"/>");
				out.println("<anchor>");
				out.println("<go href=\"/ovni/PesquisarProdutos\"  method=\"get\">");
				out.println("	<postfield name=\"parambusca\" value=\"$(stitulo)\"/>");
				out.println("	<postfield name=\"tipobusca\" value=\"0\"/>"); //Tipo 1 - Pesquisa Por Titulo 
				out.println("	<postfield name=\"tp_acess\" value=\"wap\"/>"); //Tipo da pesquisa(WAP)
				out.println("</go>");
				out.println("OK");
				out.println("</anchor><br/><br/>");		
				
				//Mais Vendidos
				out.println("<anchor>");
				out.println("<go href=\"/ovni/PesquisarProdutos\"  method=\"get\">");
				out.println("	<postfield name=\"parambusca\" value=\"\"/>");
				out.println("	<postfield name=\"tipobusca\" value=\"999999\"/>"); //Tipo 1 - Pesquisa Por Titulo 
				out.println("	<postfield name=\"tp_acess\" value=\"wap\"/>"); //Tipo da pesquisa(WAP)
				out.println("</go>");
				out.println("Top 10 Mais Vendidos");
				out.println("</anchor><br/>");	
				
				out.println("<anchor><go href=\"/ovni/wap/central_usuario.jsp\" />Central do Usuário</anchor><br/>");
				
				//Verifica se o Usuário está logado
				if(session.getAttribute("Usuario") == null) 
				{
					out.println("<anchor><go href=\"/ovni/wap/central_usuario.jsp\"/>Entrar</anchor><br/>");
				}
				else
				{
					out.println("<anchor><go href=\"/ovni/wap/acesso.jsp\"/>Sair</anchor><br/>");				
				}
								
				out.println("<br/><br/>");
				out.println("2008&copy; - Ovni.Net");
			out.println("</p>"); 
		out.println("</card>");
out.println("</wml>"); 
%> 

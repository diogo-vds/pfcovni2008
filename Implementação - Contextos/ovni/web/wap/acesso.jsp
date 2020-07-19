<%@page import="ovni.util.Util"%>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml"> 

<% 
response.setContentType("text/vnd.wap.wml"); 

out.println("<wml>"); 
	out.println("<card title=\"OVNI.NET - Login \">"); 
			
			out.println("<br/>"); 		
			out.println("<p>");		
			out.println("<b>OVNI.NET</b><br/><br/>");
			
			//Monta esse bloco se o usuário não estiver logado
			if(session.getAttribute("Usuario") == null) 
			{			
				out.println("Email:<br/>");				
				out.println("<input name=\"semail\"/><br/>"); 
				out.println("Senha:<br/>");
				out.println("<input name=\"ssenha\" type=\"password\"/><br/>");
			
				
				out.println("<anchor>");
				out.println("<go href=\"/ovni/ControleAcesso\"  method=\"post\">");
				out.println("	<postfield name=\"email\" value=\"$(semail)\"/>");
				out.println("	<postfield name=\"senha\" value=\"$(ssenha)\"/>");
				out.println("	<postfield name=\"acao\" value=\"login\"/>"); //Tipo 1 - Pesquisa Por Titulo
				out.println("	<postfield name=\"ReturlURL\" value=\"/wap/central_usuario.jsp\"/>");
				out.println("</go>");
				out.println("Entrar");
				out.println("</anchor>");
				
				
				//Apresenta mensagem de erro
				if (request.getAttribute("Erro") != null)
				{
					out.println("<br/><br/>");
					out.println("<b>" + request.getAttribute("Erro")  + "</b>");				
				}
				
			}			
			//Mostra esse bloco se o usuáio está logado			
			else
			{
				out.println("Deseja realmente sair do site?<br/>");
				out.println("<anchor><go href=\"/ovni/ControleAcesso?acao=logout&amptp_acess=wap\">");				
				out.println("	<postfield name=\"acao\" value=\"logout\"/>"); 
				out.println("	<postfield name=\"tp_acess\" value=\"wap\"/>");
				out.println("</go>");
				out.println("Sim</anchor>");
				out.println("<b>|</b>");
				out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Não</anchor>");
								
			}
			out.println("<br/><br/>");
			out.println("2008&copy; - Ovni.Net || ");
			out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");	
			out.println("</p>"); 
	out.println("</card>"); 
out.println("</wml>"); 
%> 

				
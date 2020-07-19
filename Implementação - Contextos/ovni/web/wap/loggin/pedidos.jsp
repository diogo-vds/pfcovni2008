<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*,ovni.negocio.PedidoDesktopWAP, ovni.negocio.Usuario"%>

<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml"> 

<% 

PedidoDesktopWAP pedido = new PedidoDesktopWAP();
Usuario usu = (Usuario) session.getAttribute("Usuario");

long cod_usuario = 0;

if(usu != null)
{
	cod_usuario = usu.getCodigo();	
}
else if(request.getParameter("cod_usu") != null)
{
	cod_usuario = Long.parseLong(request.getParameter("cod_usu"));
}


ResultSet oRsPedido = null;

response.setContentType("text/vnd.wap.wml"); 
out.println("<wml>"); 
	out.println("<card title=\"OVNI.NET - Pedidos \">"); 
			out.println("<br/>"); 		
			out.println("<p>");		
			out.println("<b>OVNI.NET</b><br/><br/>");
			out.println("Acompanhamento de Pedidos");
			out.println("<br/><br/>");
			
			oRsPedido = (ResultSet) request.getAttribute("Pedidos");
			
			//Apresenta campo para inserir campos de texto
			out.println("Pedido:<br/>");
			out.println("<input name=\"pedido\" format=\"9N\" maxlength=\"10\"/><br/>");
			out.println("<anchor>");
				out.println("<go href=\"/ovni/PesquisarPedido\"  method=\"post\">");
				out.println("	<postfield name=\"Codigo\" value=\"$(pedido)\"/>");
				out.println("	<postfield name=\"opcao\" value=\"Codigo\"/>");
				out.println("	<postfield name=\"Status\" value=\"0\"/>");
				out.println("	<postfield name=\"cod_usu\" value=\"" + cod_usuario + "\"/>");
				out.println("	<postfield name=\"tp_acess\" value=\"wap\"/>");
				out.println("</go>Pesquisar");
			out.println("</anchor>");	
			out.println("<br/><br/>");
			
			boolean ok = false;
			
			//Verifica se foi pesquisado pedis
			if (oRsPedido != null)
			{				
				//Para cada Pedido Listar
				while(oRsPedido.next())
				{				
					out.println("<b>Data Pedido:</b> " + Util.formatarData(oRsPedido.getDate("Data"))+ "<br/>");
					out.println("<b>Status:</b> " + oRsPedido.getString("Status")+ "<br/>");
					
					ok = true;
				}
			
				if(!oRsPedido.next() && !ok)
				{
					out.println("<b>Pedido Encontrado!</b>");
				}
				
			}
			
			out.println("<br/>");
			
			
			out.println("2008&copy; - Ovni.Net || ");
			out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");	
		out.println("</p>"); 
	out.println("</card>"); 
out.println("</wml>"); 
%> 

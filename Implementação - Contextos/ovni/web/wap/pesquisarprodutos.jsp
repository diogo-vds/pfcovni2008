
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="ovni.negocio.Produto"%>

<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml"> 

<% 

	String parampesquisa = request.getAttribute("parametro").toString();
	String tipobusca = request.getAttribute("TipoBusca").toString();
	
	Vector vtProdutos =  new Vector();
	
	
	//Verifica se existe um resulset para montar vitrine
	if(request.getAttribute("vtPesquisaProdutos") != null)
	{
		vtProdutos = (Vector) request.getAttribute("vtPesquisaProdutos");
	}


	response.setContentType("text/vnd.wap.wml"); 
	out.println("<wml>"); 
		out.println("<card title=\"OVNI.NET - Buscas por Produtos \">"); 
				out.println("<br/>"); 		
				out.println("<p>");		
					out.println("<b>OVNI.NET</b>");
					out.println("<br/><br/>");
					
					if(vtProdutos.size() != 0)
					{
						
						//Label da Busca
						if(tipobusca.equals("999999"))
						{
							out.println("<b>TOP 10 Mais Vendidos</b>");
						}
						else if(tipobusca.equals("99998"))
						{
							out.println("<b>TOP 10 Mais Visitados</b>");
						}
						else
						{
							out.println("Foram encontrados <b>" + vtProdutos.size() + "</b> produto(s) para <b>'" + parampesquisa + "'</b>");
						}
						
						out.println("<br/>");
						out.println("<br/>");
						
						for(int i=0;i<vtProdutos.size();i++)
		                {
							out.println("<anchor>");
							out.println("<go href=\"/ovni/VisualizarDetalhesProduto\"  method=\"get\">");
							out.println("	<postfield name=\"Codigo_Produto\" value=\"" + ((Produto)vtProdutos.get(i)).getCodigo() + "\"/>");
							out.println("	<postfield name=\"wap\" value=\"true\"/>");
							out.println("</go>");
						
						    if(((Produto)vtProdutos.get(i)).getValorPromocional() == 0  ) {
							
						    	out.println(((Produto)vtProdutos.get(i)).getTitulo() + " - R$ " + ((Produto)vtProdutos.get(i)).getValor()  + "<br/>");
							
							}else {
								
								out.println(((Produto)vtProdutos.get(i)).getTitulo() + " - R$ " + ((Produto)vtProdutos.get(i)).getValorPromocional()  + "<br/>");
							}
							
							
							
							
							out.println("</anchor>");
		                }
					}
					else
					{
						out.println("Nenhum produto foi encontrado por <b>'" + parampesquisa + "'</b>");						
						
					}
					
					out.println("<br/><br/>");
					out.println("2008&copy; - Ovni.Net || ");
					out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");	
			out.println("</p>"); 
		out.println("</card>"); 
	out.println("</wml>"); 
%> 

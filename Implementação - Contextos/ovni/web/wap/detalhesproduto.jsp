<%@page import="java.sql.*,java.util.*,java.io.*,java.text.*,java.util.Date"%>
<%@page import="ovni.negocio.*,ovni.util.*"%>

<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml"> 


<%

	Produto _Produto = (Produto) request.getAttribute("Produto");
	
	response.setContentType("text/vnd.wap.wml"); 
	out.println("<wml>"); 
		out.println("<card id=\"detalhes\" title=\"OVNI.NET - " + _Produto.getTitulo() + " \">"); 
				out.println("<br/>"); 		
				out.println("<p>");		
				out.println("<b>OVNI.NET</b><br/><br/>");
				out.println("Detalhes do produto");
				out.println("<br/><br/>");
				out.println("<b>" + _Produto.getTitulo() + "</b><br/>");
				out.println(_Produto.getAutorartista() + "<br/><br/>");
				
				if(_Produto.getValorPromocional() == 0  ) {
				
				out.println("<b>R$ " + _Produto.getValor() + "</b><br/><br/>");
				
				}else {
					
					out.println("<b> de R$ <strike> " + _Produto.getValor() + "</strike> </b><br/>");
					out.println("<b> por R$  " + _Produto.getValorPromocional() + " </b><br/><br/>");
				}
				
				
				
				out.println("<b>Lançamento:</b> " + _Produto.getAnolancamento() + "<br/>"); 	
				out.println("<b>Gênero:</b> " + _Produto.getDescricao_genero() + "<br/>");
				out.println("<b>Idioma:</b> " + _Produto.getIdioma()+ "<br/><br/><br/>");
				out.println("<anchor><go href=\"#maisdetalhes\" />Mais Detalhes </anchor><br/>");
				out.println("<anchor><go href=\"#avaliacoes\" />Avaliações de Clientes</anchor><br/><br/>");
				
				
				out.println("<br/><br/>");
				out.println("2008&copy; - Ovni.Net || ");
				out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");			
			out.println("</p>"); 
		out.println("</card>");	
		//Mais Detalhes
		out.println("<card id=\"maisdetalhes\" title=\"OVNI.NET - " + _Produto.getTitulo() + " \">");
	      out.println("<br/>"); 		
		  out.println("<p>");		
			out.println("<b>OVNI.NET</b><br/><br/>");
			out.println("Mais Detalhes");
			out.println("<br/><br/>");
			out.println("<b>" + _Produto.getTitulo() + "</b><br/><br/>");
			
			out.println("<b>Peso:</b> " + _Produto.getPeso() + "<br/>");
			out.println("<b>Procedência:</b> " + _Produto.getProcedencia() + "<br/>");
			out.println("<b>País Origem:</b> " + _Produto.getPaisorigem() + "<br/>");
			
				//Detalhes
				if(_Produto.getDetalhesEspecificos().size() != 0 ) {
		      	    for(int j=0;j<_Produto.getDetalhesEspecificos().size();j++){
		      	    	out.println("<b>" + ((DetalhesEspecificos)_Produto.getDetalhesEspecificos().get(j)).getCaracteristica() +":</b>");
		      			out.println(((DetalhesEspecificos)_Produto.getDetalhesEspecificos().get(j)).getConteudo() + "<br/>");
		      	    }
		       	}
		      	    
				out.println("<br/><br/>");
				out.println("2008&copy; - Ovni.Net || ");
				out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");	
				out.println(" || ");
				out.println("<anchor><go href=\"#detalhes\" />Retornar</anchor>");
		   out.println("</p>");
		out.println("</card>");
		//Avaliações
		out.println("<card id=\"avaliacoes\" title=\"OVNI.NET - " + _Produto.getTitulo() + " \">");
	      out.println("<br/>"); 		
		  out.println("<p>");		
			out.println("<b>OVNI.NET</b><br/><br/>");
			out.println("Avaliações de Clientes");
			out.println("<br/><br/>");
			out.println("<b>" + _Produto.getTitulo() + "</b><br/><br/>");
			
				//Avalições
				if(_Produto.getAvaliacoes().size() != 0 ) {
		      	    for(int j=0;j<_Produto.getAvaliacoes().size();j++){
		      	    	out.println("\"" + ((Avaliacao)_Produto.getAvaliacoes().get(j)).getAvaliacao() +"\"<br/>");
		      			out.println("por " + ((Avaliacao)_Produto.getAvaliacoes().get(j)).getUsuario() +"<br/><br/>");
		       	} 
	       	    }else{
	       	    	out.println("Nenhum cliente opinou por este produto");
	       	   }
			
				out.println("<br/><br/>");
				out.println("2008&copy; - Ovni.Net || ");
				out.println("<anchor><go href=\"/ovni/wap/default.jsp\" />Home</anchor>");	
				out.println(" || ");
				out.println("<anchor><go href=\"#detalhes\" />Retornar</anchor>");
		   out.println("</p>");
		out.println("</card>");
		
	out.println("</wml>"); 



%> 

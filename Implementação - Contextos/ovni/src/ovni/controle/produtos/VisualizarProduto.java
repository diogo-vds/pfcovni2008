package ovni.controle.produtos;
import ovni.negocio.Produto;
import java.io.*;
import java.sql.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class VisualizarProduto extends HttpServlet
{
	// Atributos da Classe
	Produto _Produtos;
	Short iTipoPesquisa;
	String sParamPesquisa;

	
	protected void buscar(HttpServletRequest rq, HttpServletResponse rs) throws  SQLException, ServletException, IOException
	{
		_Produtos = new Produto();	
		ResultSet rsBusca = null;
		
		/* Recupera o tipo de pesquisa do request^
		 *
		 * 0 - Título
		 * 1 - CD
		 * 2 - DVD
		 * 3 - Livro
		 * 4 - Mais Vendidos
		 * 5 - Mais Visitados
		 *
	     */		
				
		iTipoPesquisa = Short.parseShort(rq.getParameter("TipoPesquisa"));	
		
		sParamPesquisa = rq.getParameter("Titulo");	
				
		
		if(iTipoPesquisa == 0)
		{
			//rsBusca = _Produtos.BuscarPorTitulo(sParamPesquisa); 
		}
		else if(iTipoPesquisa >= 1  || iTipoPesquisa <= 3)
		{
			//rsBusca = _Produtos.BuscarPorTipo(iTipoPesquisa,sParamPesquisa); 
		}
			
		//Coloca o Resultset na Sessão
		rq.getSession().setAttribute("rsBusca",rsBusca);
		
	}
	
	
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{	
        	buscar(rq, rs);
		}
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("erro", erro.getMessage( ) );
			rs.sendRedirect(rq.getContextPath() + "/Erro.jsp");
		}// FInal do CATCH
		
    	} // FInal do doGet


   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
        		buscar(rq, rs);
		}
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("erro", erro.getMessage( ) );
			rs.sendRedirect(rq.getContextPath() + "/Erro.jsp");
		}// FInal do CATCH
		
    	} // FInal do doPost
			
}//Final da classe

	
		
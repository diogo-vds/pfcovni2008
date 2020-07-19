package ovni.controle.produtos;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Avaliacao;
import ovni.negocio.Produto;

public class VisualizarDetalhesProduto extends HttpServlet
{
	
	public void VisualizarDetalhes(HttpServletRequest rq, HttpServletResponse rs)  throws Exception
	{
		// Atributos da Classe
		Produto _Produto = new Produto();;		
		short sCod = Short.parseShort(rq.getParameter("Codigo_Produto"));
		
		try
		{			
			_Produto = (Produto) _Produto.buscarporcodigo(sCod);
			
		    //Atualiza Visitas
		    _Produto.AtualizarVisitas(sCod);
	
		    rq.setAttribute("Produto", _Produto);		    
		    
		    if(rq.getParameter("wap") != null )
		    {
			    getServletConfig().getServletContext().getRequestDispatcher("/wap/detalhesproduto.jsp").forward(rq, rs);   	
		    	
		    }
		    else
		    {
			    getServletConfig().getServletContext().getRequestDispatcher("/DetalhesProduto.jsp").forward(rq, rs);   	
		    	
		    }
		    
		    
		}
		catch (Exception erro) 
		{
			throw new Exception(erro.getMessage());
		}// FInal do CATCH
	

	}// 

	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{	
        	VisualizarDetalhes(rq, rs);
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
        		VisualizarDetalhes(rq, rs);
		}
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("erro", erro.getMessage( ) );
			rs.sendRedirect(rq.getContextPath() + "/Erro.jsp");
		}// FInal do CATCH
		
    	} // FInal do doPost
			
}//Final da classe

	
		
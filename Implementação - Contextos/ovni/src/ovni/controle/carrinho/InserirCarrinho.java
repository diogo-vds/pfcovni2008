package ovni.controle.carrinho;
import ovni.negocio.Carrinho;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;



public  class InserirCarrinho extends HttpServlet
{
	// Atributos da Classe
	Carrinho _Carrinho = new Carrinho();

	public void inserirCarrinho(HttpServletRequest rq, HttpServletResponse rs) throws Exception
	{
		if (!(rq.getSession( ).getAttribute("oCarrinho") == null))
			_Carrinho = (Carrinho) rq.getSession( ).getAttribute("oCarrinho");
		_Carrinho.inserirItem(Short.parseShort(rq.getParameter("Codigo_Produto")));
	}

	protected synchronized void processRequest(HttpServletRequest rq, HttpServletResponse rs)throws ServletException, IOException
	{
		try
		{
			inserirCarrinho(rq, rs);
			rq.getSession( ).setAttribute("oCarrinho", _Carrinho);
			getServletConfig().getServletContext().getRequestDispatcher("/VisualizarCarrinho").forward(rq, rs);
		}//Final do TRY
		catch (ServletException Erro) 
		{
			rq.getSession( ).setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
		catch (IOException Erro) 
		{
			rq.getSession( ).setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
		catch (Exception Erro) 
		{
			rq.getSession( ).setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
		
	}// Final do processRequest

   	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
   		rs.sendRedirect("/ovni/VisualizarCarrinho");
    	} // FInal do doGet


   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    } // FInal do doPost
			
}//Final da classe

	
		
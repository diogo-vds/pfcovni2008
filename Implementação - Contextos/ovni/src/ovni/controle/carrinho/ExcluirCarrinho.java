package ovni.controle.carrinho;
import ovni.negocio.Carrinho;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ExcluirCarrinho extends HttpServlet
{
        Carrinho _Carrinho;
	public void excluirCarrinho(HttpServletRequest rq, HttpServletResponse rs) throws Exception
        { 
		_Carrinho = (Carrinho) rq.getSession( ).getAttribute("oCarrinho");
		_Carrinho.excluirItem(Integer.parseInt(rq.getParameter("Posicao") ) );
		if (_Carrinho.getNumeroItens() == 0 ) 
			rq.getSession().removeAttribute("oCarrinho");
		else
			rq.getSession().setAttribute("oCarrinho", _Carrinho);
	}

	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			excluirCarrinho(rq, rs);
			getServletConfig().getServletContext().getRequestDispatcher("/VisualizarCarrinho").forward(rq, rs);
		}//Final do TRY
		catch (Exception erro)
		{
			rq.getSession().setAttribute("erro", "Nao ha codigo para delecao" );
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
	}
}
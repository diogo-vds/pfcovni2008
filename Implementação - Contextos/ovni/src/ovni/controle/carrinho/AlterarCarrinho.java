package ovni.controle.carrinho;
import ovni.negocio.Carrinho;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AlterarCarrinho extends HttpServlet
{
	Carrinho _Carrinho;
/**/
	public void alterarCarrinho(HttpServletRequest rq, HttpServletResponse rs ) throws Exception
	{		
		_Carrinho = (Carrinho) rq.getSession( ).getAttribute("oCarrinho");
		int iPosicao = Integer.parseInt(rq.getParameter("Posicao"));
		int iQuantidade = Integer.parseInt(rq.getParameter("Quantidade"));
		_Carrinho.alterarItem(iPosicao, iQuantidade);
		rq.getSession( ).setAttribute("oCarrinho", _Carrinho);
	}

	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			alterarCarrinho(rq, rs);			
			getServletConfig().getServletContext().getRequestDispatcher("/VisualizarCarrinho").forward(rq, rs);
		}//Final do TRY
		catch (Exception erro)
		{
			rq.setAttribute("erro", "Erro ao atualizar o carrinho: " + erro.getMessage());
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

}// Final da classe
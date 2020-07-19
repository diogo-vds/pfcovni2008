package ovni.controle.carrinho; //Inclui a servlet nao pacote de controle
import ovni.negocio.Carrinho; //Recupera a classe Carrinho do pacote de negocio
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class VisualizarCarrinho extends HttpServlet
{/**/
	// Atributos da Classe
	Carrinho _Carrinho = new Carrinho();
	
	private void Recuperar(HttpServletRequest rq, HttpServletResponse rs) throws Exception
	{
		try
		{
			_Carrinho = (Carrinho) rq.getSession().getAttribute("oCarrinho");
			rq.setAttribute("oCarrinho",_Carrinho);

		}//Final do Try
		catch (Exception Erro){throw new Exception("Não Foi possivel Recuperar o carrinho: " + Erro);}
	}// Final do Recuperar
	
	private void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			Recuperar(rq,rs);
			getServletConfig().getServletContext().getRequestDispatcher("/carrinho.jsp").forward(rq, rs);
		}
		catch (ServletException Erro) 
		{
			rq.getSession().setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
		catch (IOException Erro) 
		{
			rq.getSession().setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
		catch (Exception Erro) 
		{
			rq.getSession().setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}//FInal do CATCH
	}//Final do processRequest

        protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
        {
            doPost(rq, rs);
        }
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
	}//FInal do doPost
}//Final da Classe


/* ***********************************************************************************************
 * ********************************************************************************************** */	
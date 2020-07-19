package ovni.controle.usuario;	
import ovni.negocio.Usuario;
import java.io.*;
import java.sql.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class VisualizarUsuario extends HttpServlet
{        
	public void Visualizar(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, SQLException, Exception
	{
		/** Inicio do Try*/    
		try
		{	
			Usuario oUsuario = new Usuario();
			
			Usuario oUsuDetalhes = (Usuario) oUsuario.BuscarDetalhesDoUsuario(((Usuario)rq.getSession().getAttribute("Usuario")).getCodigo());                        
			rq.setAttribute("Usuario", oUsuDetalhes);
			getServletConfig().getServletContext().getRequestDispatcher("/DetalhesUsuario.jsp").forward(rq, rs);                       		   
		}
		catch (SQLException SQLErro){throw new SQLException(SQLErro.getMessage());}
		catch (Exception Erro){throw new Exception(Erro.getMessage());}	
	}


	/** M�todo para realizar a opera��o desejada */
	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{                      
		/** Inicio do Try */
		try
		{			
			Visualizar(rq, rs);                            
			rq.getSession( ).setAttribute("Sucesso", "Sucesso na Visualiza��o");                                              
		}
		/** Final do Try */
		/** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet VisualizarFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("/Erro.jsp"); 
		}               
		/** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet VisualizarFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("/Erro.jsp");
		}
		/** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet VisualizarFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			//rs.sendRedirect("/Erro.jsp");
			PrintWriter p = rs.getWriter();
			p.print(erro.getMessage());
		}
	}
	/** Final do processRequest */

	/** Override para iniciar Solicita��o do Cliente */
	/** Inicio do M�todo doGet */
	@Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		processRequest(rq, rs);
	}
	/** Final do M�todo doGet */

	/** Inicio do M�todo doPost */
	@Override
	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		processRequest(rq, rs);
	} 
	/** Final do M�todo doPost */	
}
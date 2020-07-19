package ovni.controle.atendimento;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.math.*;
import ovni.negocio.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class InserirAvaliacaoSite extends HttpServlet 
{        
	public void Inserir(HttpServletRequest rq, HttpServletResponse rs ) throws SQLException, Exception
	{
                /** Inicio do Try*/  
                try
                {             
                        /** Definição das Variáveis Locais */	                                                              
                        String sAvaliacao       = rq.getParameter("Avaliacao");
                        Usuario uUsuario 		= (Usuario) rq.getSession( ).getAttribute("Usuario");
                        long lUsuario			= uUsuario.getCodigo();
                        
                        Atendimento aAvaliarAtendimento = new Atendimento();
                        aAvaliarAtendimento.setAvaliacao(sAvaliacao);
                        aAvaliarAtendimento.setUsuario(lUsuario);
   		 		
                        /** Insere a Avaliação no Banco */
                        aAvaliarAtendimento.InserirAvaliacao();
                        getServletConfig().getServletContext().getRequestDispatcher("/loggin/central_usuario.jsp").forward(rq, rs);                       		   
                }
                        catch (SQLException SQLErro){throw new SQLException(SQLErro.getMessage());}
                        catch (Exception Erro){throw new Exception(Erro.getMessage());}			
	}

    /** Método para realizar a operação desejada */
	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        /** Inicio do Try */
		try
		{			
			Inserir(rq, rs);
			rq.getSession( ).setAttribute("Sucesso", "Sucesso no Cadastro");
		}
        /** Final do Try */
        /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet InserirAvaliarAtendimento");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}               
        /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet InserirAvaliarAtendimento");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
        /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet InserirAvaliarAtendimento");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
	}
    /** Final do processRequest */

	
    /** Override para iniciar Solicitação do Cliente */
    /** Inicio do Método doGet */
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        //processRequest(rq, rs);
		rs.sendRedirect("/ovni/default.jsp");
   	}
    /** Final do Método doGet */

    /** Inicio do Método doPost */
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    } 
    /** Final do Método doPost */	
}

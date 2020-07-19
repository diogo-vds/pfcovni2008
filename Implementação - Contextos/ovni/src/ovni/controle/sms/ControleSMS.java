package ovni.controle.sms;
import java.io.*;
import ovni.negocio.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ControleSMS extends HttpServlet 
{        
	/**
	 * M�todo para Gerenciar arquivo XML de sms
	 * @param rq
	 * @param rs
	 * @throws Exception
	 */
	public void Gerenciar(HttpServletRequest rq, HttpServletResponse rs) throws Exception
	{
                try
                {             
                        // Defini��o das Vari�veis Locais	                                                              
                        ThreadSMS oThreadSMS = new ThreadSMS();
                        oThreadSMS.run();
                        getServletConfig().getServletContext().getRequestDispatcher("/loggin/central_usuario.jsp").forward(rq, rs);                       		   
                }
                catch (Exception Erro){throw new Exception(Erro.getMessage());}			
	}

    
	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        try
		{			
			Gerenciar(rq, rs);
			rq.getSession( ).setAttribute("Sucesso", "Sucesso");
		}
        /** Final do Try */
        /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet ControleSMS");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}               
        /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet ControleSMS");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
        /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet ControleSMS");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
	}
    /** Final do processRequest */

	
    /** Override para iniciar Solicita��o do Cliente */
    /** Inicio do M�todo doGet */
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        processRequest(rq, rs);
		//rs.sendRedirect("/ovni/default.jsp");
   	}
    /** Final do M�todo doGet */

    /** Inicio do M�todo doPost */
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	//processRequest(rq, rs);
    } 
    /** Final do M�todo doPost */	
}

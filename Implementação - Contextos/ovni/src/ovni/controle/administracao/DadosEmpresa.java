package ovni.controle.administracao;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Empresa;

public class DadosEmpresa extends HttpServlet{

	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        try
		{	
        	Empresa oEmp = new Empresa();       
        	
        	oEmp = oEmp.recuperarDadosEmpresa();
        	
        	//Insere atributos no Request        	
        	rq.setAttribute("Empresa", oEmp);
        	
        	getServletConfig().getServletContext().getRequestDispatcher("/admin/DadosEmpresa.jsp").forward(rq, rs);
        	
		}
        /** Final do Try */
        /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet DadosEmpresa");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
		}               
        /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet DadosEmpresa");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
		}
        /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet DadosEmpresa");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
		}
	}
    /** Final do processRequest */

	
    /** Override para iniciar Solicitação do Cliente */
    /** Inicio do Método doGet */
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        processRequest(rq, rs);		
   	}
    /** Final do Método doGet */

    /** Inicio do Método doPost */
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        processRequest(rq, rs);
    } 
    /** Final do Método doPost */	
	
}

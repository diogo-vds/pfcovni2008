package ovni.controle.usuario;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Usuario;
import sun.misc.Request;

public class ControleAcesso extends HttpServlet
{

	/*
	 * Efetua o Controle de Acesso no sistemma
	 */
	public void ControleAcesso(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
            /** Inicio do Try*/    
            try
            {	 	
            	if(rq.getParameter("acao").equals("login"))
            	{                	
            		this.Validar(rq, rs);
            	}            	
            	else if(rq.getParameter("acao").equals("logout"))
            	{                	
            		this.Encerrar(rq,rs);
            	}
            }
            catch (SQLException SQLErro){throw new SQLException(SQLErro.getMessage());}
            catch (Exception Erro){throw new Exception(Erro.getMessage());}	
	}
		
	/*
	 * Valida usu�rios do site 
	 */	
	public void Validar(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {	 	
                       /** Defini��o das Vari�veis Locais */
                	   String email = rq.getParameter("email");
                	   String senha = rq.getParameter("senha");                	   
                	   String ReturnURL = (String) rq.getSession().getAttribute("ReturnURL");
                	   
                	   /* Criar objeto Usu�rio */
                	   Usuario oUsu = new Usuario();
                	   
                	   /*Setar os Dados*/
                	   oUsu.setEmail(email);
                	   oUsu.setSenha(senha);
                	   
                	   if(oUsu.Validar()){
                		   
                		   //Coloca o Objeto Usu�rio na sess�o
                		   rq.getSession().setAttribute("Usuario", oUsu);                		   
                		   //Salva o �ltimo acesso do usu�rio
                		   oUsu.GerarDataUltimoAcesso(oUsu.getCodigo());                		                   		   
                		   getServletConfig().getServletContext().getRequestDispatcher(ReturnURL).forward(rq, rs);
                         
                	   }
                	   else
                	   {
                		   rq.setAttribute("Erro","Dados inv�lidos, por favor insira os dados novamente!");
                		   
                		   //Direciona para p�gina de login
                		   if(ReturnURL.contains("/wap/"))
                		   {
                			   getServletConfig().getServletContext().getRequestDispatcher("/wap/acesso.jsp").forward(rq, rs);
                		   }	   	
                		   else
                		   {
                			   getServletConfig().getServletContext().getRequestDispatcher("/acesso.jsp").forward(rq, rs);
                		   }
                	   }	   
                		   
                }
                catch (SQLException SQLErro){throw new SQLException(SQLErro.getMessage());}
                catch (Exception Erro){throw new Exception(Erro.getMessage());}	
	}
	
	/* 
	 *  Encerra Sess�o do Usu�rio
	 */
	public void Encerrar(HttpServletRequest rq, HttpServletResponse rs) throws Exception
	{
                /** Inicio do Try*/    
                try
                {	 	
                 	   //Destroy o Objeto Usu�rio da Sess�o
            		   rq.getSession().setAttribute("Usuario", null);

            		   //Direciona para central do usu�rio
            		   if(rq.getParameter("tp_acess") != null)
            		   {
            			   getServletConfig().getServletContext().getRequestDispatcher("/wap/default.jsp").forward(rq, rs);
            		   }	   	
            		   else
            		   {
            			   getServletConfig().getServletContext().getRequestDispatcher("/default.jsp").forward(rq, rs);
            		   }                                     		   
                }
                 catch (Exception Erro){throw new Exception(Erro.getMessage());}	
	}
	
	
	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{                      
                /** Inicio do Try */
		try
		{			
				ControleAcesso(rq, rs);                            
                rq.getSession( ).setAttribute("Sucesso", "Sucesso na Visualiza��o");                                              
		}
                /** Final do Try */
                /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet LoginUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp"); 
		}               
                /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet LoginUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
                /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet LoginUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
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

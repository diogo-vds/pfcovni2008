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
	 * Valida usuários do site 
	 */	
	public void Validar(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {	 	
                       /** Definição das Variáveis Locais */
                	   String email = rq.getParameter("email");
                	   String senha = rq.getParameter("senha");                	   
                	   String ReturnURL = (String) rq.getSession().getAttribute("ReturnURL");
                	   
                	   /* Criar objeto Usuário */
                	   Usuario oUsu = new Usuario();
                	   
                	   /*Setar os Dados*/
                	   oUsu.setEmail(email);
                	   oUsu.setSenha(senha);
                	   
                	   if(oUsu.Validar()){
                		   
                		   //Coloca o Objeto Usuário na sessão
                		   rq.getSession().setAttribute("Usuario", oUsu);                		   
                		   //Salva o último acesso do usuário
                		   oUsu.GerarDataUltimoAcesso(oUsu.getCodigo());                		                   		   
                		   getServletConfig().getServletContext().getRequestDispatcher(ReturnURL).forward(rq, rs);
                         
                	   }
                	   else
                	   {
                		   rq.setAttribute("Erro","Dados inválidos, por favor insira os dados novamente!");
                		   
                		   //Direciona para página de login
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
	 *  Encerra Sessão do Usuário
	 */
	public void Encerrar(HttpServletRequest rq, HttpServletResponse rs) throws Exception
	{
                /** Inicio do Try*/    
                try
                {	 	
                 	   //Destroy o Objeto Usuário da Sessão
            		   rq.getSession().setAttribute("Usuario", null);

            		   //Direciona para central do usuário
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
                rq.getSession( ).setAttribute("Sucesso", "Sucesso na Visualização");                                              
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
	
        /** Override para iniciar Solicitação do Cliente */
        /** Inicio do Método doGet */
    @Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    	}
        /** Final do Método doGet */

        /** Inicio do Método doPost */
    @Override
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    	} 
        /** Final do Método doPost */
	
}

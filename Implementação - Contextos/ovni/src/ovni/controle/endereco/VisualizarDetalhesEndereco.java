package ovni.controle.endereco;
import ovni.negocio.Endereco;
import ovni.negocio.Fornecedor;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;

public class VisualizarDetalhesEndereco extends HttpServlet
{        
        public void VisualizarEndereco(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {	 	
                		/** Defini��o das Vari�veis Locais */	                	
            			if(rq.getParameter("CodigoEndereco") == null) rs.sendRedirect("/ovni/visualizarendereco.jsp");
            			String sTipoObjeto 			= rq.getParameter("TpObjeto");
            			long lCodigoEndereco        = Long.parseLong(rq.getParameter("CodigoEndereco"));  
                    
            			Endereco oEndereco = new Endereco();	
            			oEndereco = oEndereco.BuscarEnderecoCodigo(lCodigoEndereco,sTipoObjeto);
            			
            			HttpSession sessao = rq.getSession(true);
            			sessao.setAttribute("DetalhesEndereco", oEndereco);
            			
                        getServletConfig().getServletContext().getRequestDispatcher("/DetalhesEndereco.jsp").forward(rq, rs);                       		   
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
			    VisualizarEndereco(rq, rs);                            
                rq.getSession( ).setAttribute("Sucesso", "Sucesso na Visualiza��o");                                              
		}
                /** Final do Try */
                /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet VisualizarFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}               
                /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet VisualizarFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
                /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet VisualizarFornecedor");
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

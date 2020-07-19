package ovni.controle.endereco;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.Vector;
import java.math.*; 
import ovni.negocio.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class ExcluirEndereco extends HttpServlet {

	public void Excluir(HttpServletRequest rq, HttpServletResponse rs ) throws SQLException, Exception
	{
                /** Inicio do Try */    
                try
                {	 	
                        /** Definição das Variáveis Locais */	  
                        long lCodigo          		= Long.parseLong(rq.getParameter("CodigoEndereco"));
                        String sTipoObjeto	        = rq.getParameter("TipoObjeto");
                        
                        Endereco oEndereco = new Endereco();
                        oEndereco.setCodigo(lCodigo);
                        oEndereco.setTipoObjeto(sTipoObjeto);  
                        
                        /** Excluir Dados de Endereco no Banco */
                        oEndereco.ExcluirEndereco(); 
                       
                        getServletConfig().getServletContext().getRequestDispatcher("/visualizarendereco.jsp").forward(rq, rs);                       
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
						Excluir(rq, rs);
						rq.getSession( ).setAttribute("Sucesso", "Sucesso na Exclusão");
				}
                /** Final do Try */
                /** Catch ServletException */
				catch (ServletException erro) 
				{
						rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet ExcluirFornecedor");
						rq.getSession( ).setAttribute("erro", erro);
						rs.sendRedirect("Erro.jsp");
				}               
        	    /** Catch IOException */
				catch (IOException erro) 
				{
						rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet ExcluirFornecedor");
						rq.getSession( ).setAttribute("erro", erro);
						rs.sendRedirect("Erro.jsp");
				}
                /** Catch Exception */
				catch (Exception erro) 
				{
						rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet ExcluirFornecedor");
						rq.getSession( ).setAttribute("erro", erro);
						rs.sendRedirect("Erro.jsp");
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
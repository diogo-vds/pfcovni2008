package ovni.controle.endereco;
import ovni.negocio.Endereco;
import ovni.negocio.Fornecedor;
import ovni.negocio.Sms;
import ovni.negocio.TipoEndereco;

import java.io.*;
import java.sql.*;
import java.util.Vector;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class PesquisarEndereco extends HttpServlet
{	
	public void Pesquisar(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {	 	
                	int iTipoPesquisa 	= Integer.parseInt(rq.getParameter("TipoPesquisa"));
	        		String sPesquisar   = rq.getParameter("Pesquisar");	 
	        		long lCodigoObjeto  = Long.parseLong(rq.getParameter("Codigo"));                        
                    String sTipoObjeto	= rq.getParameter("TipoObjeto");
	        		
	        		Endereco oEndereco = new Endereco();
	        		Vector<Endereco> vctEndereco = new Vector<Endereco>();
	        				        			
	        		/** Verificando op��o desejada para a Pesquisa do Endereco */
	        		switch(iTipoPesquisa)
	        		{
	        			/** Buscar por Rua  */
  						case 1:
  							vctEndereco = (Vector<Endereco>) oEndereco.BuscarEnderecoRua(lCodigoObjeto, sTipoObjeto, sPesquisar);
							rq.setAttribute("Endereco", vctEndereco);                        
                			getServletConfig().getServletContext().getRequestDispatcher("/visualizarendereco.jsp").forward(rq, rs); 
    					break;
    					
    					/** Buscar por Tipo Endereco  */
  						case 2:
  							vctEndereco = (Vector<Endereco>) oEndereco.BuscarEnderecoTipoEndereco(lCodigoObjeto, sTipoObjeto, sPesquisar);
  							rq.setAttribute("Endereco", vctEndereco);                        
                			getServletConfig().getServletContext().getRequestDispatcher("/visualizarendereco.jsp").forward(rq, rs); 	
    					break;    					
    					
    					/** Buscar Todos os Enderecos  */
  						default:
  							vctEndereco = (Vector<Endereco>) oEndereco.BuscarEnderecoTodos(lCodigoObjeto, sTipoObjeto);
  							rq.setAttribute("Endereco", vctEndereco);                        
  							getServletConfig().getServletContext().getRequestDispatcher("/visualizarendereco.jsp").forward(rq, rs); 
    					break;  
	        		}
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
			    		Pesquisar(rq, rs);
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
	}/** Final do processRequest */
	
    /** Override para iniciar Solicita��o do Cliente */
    /** Inicio do M�todo doGet */
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    }/** Final do M�todo doGet */

    /** Inicio do M�todo doPost */
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    }/** Final do M�todo doPost */	
}
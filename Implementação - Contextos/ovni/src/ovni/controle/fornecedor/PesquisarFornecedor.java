package ovni.controle.fornecedor;

import ovni.negocio.Fornecedor;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class PesquisarFornecedor extends HttpServlet
{	
	public void Pesquisar(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {	 	
		        		int iTipoPesquisa 	= Integer.parseInt(rq.getParameter("TipoPesquisa"));
		        		String sPesquisar   = rq.getParameter("Pesquisar");	        		
		        		
		        		Fornecedor oFornecedor = new Fornecedor();
		        		Vector<Fornecedor> vctFornecedor = new Vector<Fornecedor>();
		        				        			
		        		/** Verificando opção desejada para a Pesquisa do Fornecedor */
		        		switch(iTipoPesquisa)
		        		{
		        			/** Buscar por Nome Fantasia  */
      						case 1:
      								vctFornecedor = (Vector<Fornecedor>) oFornecedor.BuscarDetalhesDoFornecedorPorNomeFantasia(sPesquisar);
                        			rq.setAttribute("Fornecedores", vctFornecedor);                        
                        			getServletConfig().getServletContext().getRequestDispatcher("/admin/visualizarfornecedor.jsp").forward(rq, rs); 
        					break;
        					
        					/** Buscar por CNPJ  */
      						case 2:
      								vctFornecedor = (Vector<Fornecedor>) oFornecedor.BuscarDetalhesDoFornecedorPorCnpj(Long.parseLong(sPesquisar));
                        			rq.setAttribute("Fornecedores", vctFornecedor);                        
                        			getServletConfig().getServletContext().getRequestDispatcher("/admin/visualizarfornecedor.jsp").forward(rq, rs); 
        					break;
        					
        					/** Buscar por Razao Social  */
      						case 3:
      								vctFornecedor = (Vector<Fornecedor>) oFornecedor.BuscarDetalhesDoFornecedorPorRazaoSocial(sPesquisar);
                        			rq.setAttribute("Fornecedores", vctFornecedor);                        
                        			getServletConfig().getServletContext().getRequestDispatcher("/admin/visualizarfornecedor.jsp").forward(rq, rs);
        					break;
        					
        					/** Buscar Todos os Fornecedores  */
      						default:
      								vctFornecedor = (Vector<Fornecedor>) oFornecedor.BuscarTodosFornecedor();      								
                        			rq.setAttribute("Fornecedores", vctFornecedor);                        
                        			getServletConfig().getServletContext().getRequestDispatcher("/admin/visualizarfornecedor.jsp").forward(rq, rs);
        					break;
    					}                                                  		   
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
			    		Pesquisar(rq, rs);
                        rq.getSession( ).setAttribute("Sucesso", "Sucesso na Visualização");                       
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
	
    /** Override para iniciar Solicitação do Cliente */
    /** Inicio do Método doGet */
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    }/** Final do Método doGet */

    /** Inicio do Método doPost */
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    }/** Final do Método doPost */	
}
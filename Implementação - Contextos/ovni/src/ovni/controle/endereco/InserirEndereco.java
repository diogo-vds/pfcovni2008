package ovni.controle.endereco;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.Vector;
import java.math.*;
import ovni.negocio.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class InserirEndereco extends HttpServlet 
{        
	public void Inserir(HttpServletRequest rq, HttpServletResponse rs ) throws SQLException, Exception
	{
                /** Inicio do Try*/  
                try
                {             
                        /** Definição das Variáveis Locais */                                                           
                        String sCep     			= rq.getParameter("Cep");
                        String sRua             	= rq.getParameter("Rua");
                        int iNumero  				= Integer.parseInt(rq.getParameter("Numero"));
                        int iCaixaPostal  			= Integer.parseInt(rq.getParameter("CaixaPostal"));
                        String sComplemento     	= rq.getParameter("Complemento");
                        String sBairro          	= rq.getParameter("Bairro");
                        String sMunicipio       	= rq.getParameter("Municipio");
                        String sEstado          	= rq.getParameter("Estado");
                        String sPais            	= rq.getParameter("Pais");
                        String sNomeReceptor    	= rq.getParameter("NomeReceptor");
                        String sReferenciaEntrega   = rq.getParameter("ReferenciaEntrega");
                        int iTipoEndereco			= Integer.parseInt(rq.getParameter("TipoEndereco"));
                        long lCodigoObjeto          = Long.parseLong(rq.getParameter("CodigoObjeto"));                        
                        String sTipoObjeto	        = rq.getParameter("TipoObjeto");
                        boolean blnEndCelular       = Boolean.parseBoolean(rq.getParameter("EndCelular"));
                                                        
                        Endereco oEndereco = new Endereco();                                                                      
                        oEndereco.setCep(sCep);
                        oEndereco.setRua(sRua);                      
                        oEndereco.setNumero(iNumero);
                        oEndereco.setCaixaPostal(iCaixaPostal);
                        oEndereco.setComplemento(sComplemento);
                        oEndereco.setBairro(sBairro);
                        oEndereco.setMunicipio(sMunicipio);
                        oEndereco.setEstado(sEstado);
                        oEndereco.setPais(sPais);
                        oEndereco.setNomeReceptor(sNomeReceptor);
                        oEndereco.setReferenciaEntrega(sReferenciaEntrega);
                        oEndereco.setTipoEndereco(iTipoEndereco);
                        oEndereco.setCodigoObjeto(lCodigoObjeto);
                        oEndereco.setTipoObjeto(sTipoObjeto);                
                        oEndereco.setEndCelular(blnEndCelular);                  				
   		 		
                        /** Insere o Endereco no Banco */
                        oEndereco.InserirEndereco();
                        TipoEndereco oTipoEndereco = new TipoEndereco();
                        Vector<TipoEndereco> vctTipoEndereco = new Vector<TipoEndereco>();
                        vctTipoEndereco = (Vector<TipoEndereco>) oTipoEndereco.BuscarTodosTipos();
                        
                        HttpSession sessao = rq.getSession(true);
                        sessao.setAttribute("TipoEndereco", vctTipoEndereco);                        
                        sessao.setAttribute("CodigoObjeto", lCodigoObjeto);
                        sessao.setAttribute("TipoObjeto", sTipoObjeto);
                        
                        getServletConfig().getServletContext().getRequestDispatcher("/inserirendereco.jsp").forward(rq, rs);                        
                                       		   
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
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet InserirFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}               
        /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet InserirFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
        /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet InserirFornecedor");
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
package ovni.controle.fornecedor;
import java.io.*;
import java.sql.*;
import java.util.Vector;
import ovni.negocio.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AlterarFornecedor extends HttpServlet         
{
	// Atributos da Classe
	Fornecedor _Fornecedor;
 	public void Alterar(HttpServletRequest rq, HttpServletResponse rs ) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {		
                        /** Definição das Variáveis Locais */	  
                        long lCodigo            = Long.parseLong(rq.getParameter("Codigo"));
                        String sNomeFantasia    = rq.getParameter("NomeFantasia");
                        String sRazaoSocial     = rq.getParameter("RazaoSocial");
                        long lCnpj              = Long.parseLong(rq.getParameter("Cnpj"));
                        long lInscrEstadual     = Long.parseLong(rq.getParameter("InscrEstadual"));
                        long lCei               = Long.parseLong(rq.getParameter("CEI"));
                        long lInscrMunicipal    = Long.parseLong(rq.getParameter("InscrMunicipal"));
                        String sContato         = rq.getParameter("Contato");
                        String sCargo           = rq.getParameter("Cargo");
                        int iDDD                = Integer.parseInt(rq.getParameter("DDD"));
                        int iTelefonePrincipal  = Integer.parseInt(rq.getParameter("TelefonePrincipal"));
                        int iRamal              = Integer.parseInt(rq.getParameter("Ramal"));
                        int iTelefoneOpcional   = Integer.parseInt(rq.getParameter("TelefoneOpcional"));
                        int iFax                = Integer.parseInt(rq.getParameter("Fax"));
                        int iCelular            = Integer.parseInt(rq.getParameter("Celular"));
                        String sEmail           = rq.getParameter("Email");
                        
              	    	  
                        _Fornecedor = new Fornecedor();
                        _Fornecedor.setCodigo(lCodigo);
                        _Fornecedor.setNomeFantasia(sNomeFantasia);   
                        _Fornecedor.setRazaoSocial(sRazaoSocial);     
                        _Fornecedor.setCnpj(lCnpj);   
                        _Fornecedor.setInscrEstadual(lInscrEstadual);   
                        _Fornecedor.setCEI(lCei);   
                        _Fornecedor.setInscrMunicipal(lInscrMunicipal);   
                        _Fornecedor.setContato(sContato); 
                        _Fornecedor.setCargo(sCargo); 
                        _Fornecedor.setDDD(iDDD);   
                        _Fornecedor.setTelefonePrincipal(iTelefonePrincipal);   
                        _Fornecedor.setRamal(iRamal);   
                        _Fornecedor.setTelefoneOpcional(iTelefoneOpcional);   
                        _Fornecedor.setFax(iFax);   
                        _Fornecedor.setCelular(iCelular);   
                        _Fornecedor.setEmail(sEmail);  		
   		 		
                        /** Alterar Dados de Fornecedor no Banco */
                        _Fornecedor.AtualizarFornecedor(); 
                     
                        // Recupero parametros necessários para Alterar o Endereco
                        TipoEndereco oTipoEndereco = new TipoEndereco();
                        Vector<TipoEndereco> vctTipoEndereco = new Vector<TipoEndereco>();
                        vctTipoEndereco = (Vector<TipoEndereco>) oTipoEndereco.BuscarTodosTipos();
                        String TipoObjeto = "F";
                        rq.setAttribute("Codigo", lCodigo);
                        rq.setAttribute("TipoObjeto", TipoObjeto);
                        
                        HttpSession sessao = rq.getSession(true);
                        sessao.setAttribute("TipoEndereco", vctTipoEndereco);                        
                        sessao.setAttribute("CodigoObjeto", lCodigo);
                        sessao.setAttribute("TipoObjeto", TipoObjeto);
                        
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
			Alterar(rq, rs);
			rq.getSession( ).setAttribute("Sucesso", "Sucesso no Cadastro");
		}
                /** Final do Try */
                /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet AlterarFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}               
                /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet AlterarFornecedor");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
                /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet AlterarFornecedor");
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
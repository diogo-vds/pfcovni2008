package ovni.controle.usuario;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.Vector;
import java.math.*; 
import ovni.negocio.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class AlterarUsuario extends HttpServlet         
{
	// Atributos da Classe
	Usuario oUsuario;
 	public void Alterar(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {		
                        /** Definição das Variáveis Locais */	  
                        long lCodigo            = Long.parseLong(rq.getParameter("Codigo"));
    					int iTipoUsuario      	= Integer.parseInt(rq.getParameter("TipoUsuario"));
    					String sNome   		  	= rq.getParameter("Nome");
       					long lCpf	      	  	= Long.parseLong(rq.getParameter("Cpf"));
    					long lRg   			  	= Long.parseLong(rq.getParameter("Rg"));
    					String sOrgaoEmissor  	= rq.getParameter("OrgaoEmissor");
    					String sNaturalidade 	= rq.getParameter("Naturalidade");
    	
    					// Data de Nascimento
    					
    					String[] Data = rq.getParameter("Data").split("/");
    					
       					int iDia              	= Integer.parseInt(Data[0]);
       					int iMes              	= Integer.parseInt(Data[1]);
       					int iAno              	= Integer.parseInt(Data[2]);
       	
       					/* Validação para encontrar o mÊs
       					 * 
       					 * Para Janeiro   - 0
       					 * 		Fevereiro - 1
       					 */
       					
       					iMes = iMes - 1;
       		
       					
       					String sSexo  		  	= rq.getParameter("Sexo");
       					String sEmail         	= rq.getParameter("Email");
       					int iDdd			  	= Integer.parseInt(rq.getParameter("DDD"));
       					int iTelefonePrincipal	= Integer.parseInt(rq.getParameter("TelefonePrincipal"));
       					int iRamal		  		= Integer.parseInt(rq.getParameter("Ramal"));
       					int iTelefoneOpcional   = Integer.parseInt(rq.getParameter("TelefoneOpcional"));
       					int iFax 			  	= Integer.parseInt(rq.getParameter("Fax"));
       					int iCelular		  	= Integer.parseInt(rq.getParameter("Celular"));
       					              	    		  
    	
       					Usuario oUsuario = new Usuario();
    					oUsuario.setCodigo(lCodigo);	  
       					oUsuario.setTipoUsuario(iTipoUsuario);   
       					oUsuario.setNome(sNome);   
       					oUsuario.setCPF(lCpf);   
       					oUsuario.setRG(lRg);   
       					oUsuario.setOrgaoEmissor(sOrgaoEmissor);   
       					oUsuario.setNaturalidade(sNaturalidade);   
       					oUsuario.setDataNascimento(iAno,iMes,iDia);  
       					oUsuario.setSexo(sSexo); 
       					oUsuario.setEmail(sEmail);  
       					oUsuario.setDDD(iDdd);   
       					oUsuario.setTelefonePrincipal(iTelefonePrincipal); 
       					oUsuario.setRamal(iRamal);   
       					oUsuario.setTelefoneOpcional(iTelefoneOpcional);   
       					oUsuario.setFax(iFax);   
       					oUsuario.setCelular(iCelular); 		
   		 		
    					/** Alterar Dados de Usuario no Banco */
   						oUsuario.AtualizarUsuario();
   						TipoEndereco oTipoEndereco = new TipoEndereco();
                        Vector<TipoEndereco> vctTipoEndereco = new Vector<TipoEndereco>();
                        vctTipoEndereco = (Vector<TipoEndereco>) oTipoEndereco.BuscarTodosTipos();
                        String TipoObjeto = "U";
                        
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
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet AlterarUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}               
                /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet AlterarUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
                /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet AlterarUsuario");
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
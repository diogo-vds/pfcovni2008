package ovni.controle.usuario;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.Vector;
import java.math.*;
import ovni.negocio.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class InserirUsuario extends HttpServlet 
{        
	public void Inserir(HttpServletRequest rq, HttpServletResponse rs ) throws SQLException, Exception
	{
                /** Inicio do Try*/  
                try
                {   	
						/** Definição das Variáveis Locais */

   						Usuario oUsuario = new Usuario();
   						
   						/*
   						 * 1 - Verificar email válido
   						 * 2 - Cadastrar usuário
   						 */
   						
   						String acao =  rq.getParameter("acao");  	
   						   						
   						if(acao.equals("1"))
   						{
   							/*
   							 * O método verificarEmail retorna verdadeiro se o email não está sendo usado
   							 */
   							if(!oUsuario.verificarEmail(rq.getParameter("ValidaEmail")) | rq.getParameter("ValidaEmail").equals("") )
   							{
   								rq.setAttribute("valido", "nao");                			
   								getServletConfig().getServletContext().getRequestDispatcher("/inserirusuario.jsp").forward(rq, rs);
   							}
   							else
   							{
   								rq.setAttribute("valido", "sim");  
   								getServletConfig().getServletContext().getRequestDispatcher("/inserirusuario.jsp").forward(rq, rs);
   							}
   						}
   						else
   						{
							int iTipoUsuario      	= Integer.parseInt(rq.getParameter("TipoUsuario"));
	    					String sNome   		  	= rq.getParameter("Nome");
	       					long lCpf	      	  	= Long.parseLong(rq.getParameter("Cpf"));
	    					long lRg   			  	= Long.parseLong(rq.getParameter("Rg"));
	    					String sOrgaoEmissor  	= rq.getParameter("OrgaoEmissor");
	    					String sNaturalidade 	= rq.getParameter("Naturalidade");
	    	
	    					// Data de Nascimento
	       					int iDia              	= Integer.parseInt(rq.getParameter("Dia"));
	       					int iMes              	= Integer.parseInt(rq.getParameter("Mes"));
	       					int iAno              	= Integer.parseInt(rq.getParameter("Ano"));
	       	
	       					String sSexo  		  	= rq.getParameter("Sexo");
	       					String sEmail         	= rq.getParameter("Email");
	       					String sSenha         	= rq.getParameter("Senha");
	       					int iDdd			  	= Integer.parseInt(rq.getParameter("Ddd"));
	       					int iTelefonePrincipal	= Integer.parseInt(rq.getParameter("TelefonePrincipal"));
	       					int iRamal		  		= Integer.parseInt(rq.getParameter("Ramal"));
	       					int iTelefoneOpcional   = Integer.parseInt(rq.getParameter("TelefoneOpcional"));
	       					int iFax 			  	= Integer.parseInt(rq.getParameter("Fax"));
	       					int iCelular		  	= Integer.parseInt(rq.getParameter("Celular"));
	       					
	       					
	       					long lCodigoUsuario = oUsuario.GerarCodigoUsuario();
	              	    	
	              	    	oUsuario.setCodigo(lCodigoUsuario);	  
	       					oUsuario.setTipoUsuario(iTipoUsuario);   
	       					oUsuario.setNome(sNome);   
	       					oUsuario.setCPF(lCpf);   
	       					oUsuario.setRG(lRg);   
	       					oUsuario.setOrgaoEmissor(sOrgaoEmissor);   
	       					oUsuario.setNaturalidade(sNaturalidade);   
	       					oUsuario.setDataNascimento(iAno,iMes,iDia);  
	       					oUsuario.setSexo(sSexo); 
	       					oUsuario.setEmail(sEmail); 
	       					oUsuario.setSenha(sSenha);  
	       					oUsuario.setDDD(iDdd);   
	       					oUsuario.setTelefonePrincipal(iTelefonePrincipal); 
	       					oUsuario.setRamal(iRamal);   
	       					oUsuario.setTelefoneOpcional(iTelefoneOpcional);   
	       					oUsuario.setFax(iFax);   
	       					oUsuario.setCelular(iCelular);
	       					
	       					/** Insere o Usuario no Banco */
	                        oUsuario.InserirUsuario();
	                        oUsuario.GerarDataUltimoAcesso(lCodigoUsuario);
	                        
	                        TipoEndereco oTipoEndereco = new TipoEndereco();
	                        Vector<TipoEndereco> vctTipoEndereco = new Vector<TipoEndereco>();
	                        vctTipoEndereco = (Vector<TipoEndereco>) oTipoEndereco.BuscarTodosTipos();
	                        String TipoObjeto = "U";
	                        
	                        HttpSession sessao = rq.getSession(true);
	                        sessao.setAttribute("TipoEndereco", vctTipoEndereco);
	                        sessao.setAttribute("CodigoObjeto", lCodigoUsuario);
	                        sessao.setAttribute("TipoObjeto", TipoObjeto);
	                        
	                        getServletConfig().getServletContext().getRequestDispatcher("/inserirendereco.jsp").forward(rq, rs);
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
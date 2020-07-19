package ovni.controle.administracao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Empresa;

public class AtualizarEmpresa extends HttpServlet{

	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        try
		{	
        	
        	String _NomeFantasia = rq.getParameter("NomeFantasia");
        	String _RazaoSocial = rq.getParameter("RazaoSocial");
        	long _CNPJ = Long.parseLong(rq.getParameter("CNPJ"));
        	long _InscricaoEstadual = Long.parseLong(rq.getParameter("InscricaoEstadual"));
        	long _InscricaoMunicipal = Long.parseLong(rq.getParameter("InscricaoMunicipal"));
        	int _DDD = Integer.parseInt(rq.getParameter("DDD"));
        	int _TelefonePrincipal = Integer.parseInt(rq.getParameter("TelefonePrincipal"));
        	int _DDDFax = Integer.parseInt(rq.getParameter("DDDFax"));
        	int _Fax = Integer.parseInt(rq.getParameter("Fax"));	
        	String _CEP = rq.getParameter("CEP");
        	String _Endereco = rq.getParameter("Endereco");
        	String _Numero = rq.getParameter("Numero");
        	String _Complemento = rq.getParameter("Complemento");
        	String _Bairro = rq.getParameter("Bairro");
        	String _Municipio = rq.getParameter("Municipio");
        	String _Estado = rq.getParameter("Estado");
        	String _Pais = rq.getParameter("Pais");
        	
        	Empresa oEmp = new Empresa();       
        	
        	//Setar Dados
        	oEmp.setNomeFantasia(_NomeFantasia);
        	oEmp.setRazaoSocial(_RazaoSocial);
        	oEmp.setCNPJ(_CNPJ);
        	oEmp.setInscricaoEstadual(_InscricaoEstadual);
        	oEmp.setInscricaoMunicipal(_InscricaoMunicipal);
        	oEmp.setDDD(_DDD);
        	oEmp.setTelefonePrincipal(_TelefonePrincipal);
        	oEmp.setDDDFax(_DDDFax);
        	oEmp.setFax(_Fax);
        	oEmp.setCEP(_CEP);
        	oEmp.setEndereco(_Endereco);
        	oEmp.setNumero(_Numero);
        	oEmp.setComplemento(_Complemento);
        	oEmp.setBairro(_Bairro);
        	oEmp.setMunicipio(_Municipio);
        	oEmp.setEstado(_Estado);
        	oEmp.setPais(_Pais);
        	
        	oEmp.AtualizarDadosEmpresa();   
        	
        	//Insere atributos no Request        	
        	rq.setAttribute("Empresa", oEmp);
        	
        	getServletConfig().getServletContext().getRequestDispatcher("/DadosEmpresa").forward(rq, rs);
        	
		}
        /** Final do Try */
        /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet DadosEmpresa");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
		}               
        /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet DadosEmpresa");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
		}
        /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet DadosEmpresa");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
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

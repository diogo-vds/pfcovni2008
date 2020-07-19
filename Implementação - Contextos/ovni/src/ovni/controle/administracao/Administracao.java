package ovni.controle.administracao;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ovni.negocio.*;

public class Administracao extends HttpServlet {

	
	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        try
		{	
        	Integer TotalProdutos = 0;
        	Produto oProd = new Produto();
        	PedidoDesktopWAP opdDktWAP = new PedidoDesktopWAP();
        	PedidoSMS opdSMS = new PedidoSMS();
        	
        	ResultSet rsPedidosDesktop = null;
        	ResultSet rsPedidosSMS = null;
        	        	
        	//Busca Totais de Produtos
        	TotalProdutos = oProd.TotaldeProdutos(); 
        	
        	//Busca Resumo de Pedidos Desktop e WAP
        	rsPedidosDesktop = (ResultSet) opdDktWAP.TotalizacaoPedidos();
        	//Busca Resumo de Pedidos por SMS
        	rsPedidosSMS = (ResultSet) opdSMS.TotalizacaoPedidos();
        	
        	//Insere atributos no Request        	
        	rq.setAttribute("TotalProdutos", TotalProdutos);
        	rq.setAttribute("ResumoPedidosDkTWap",rsPedidosDesktop);
        	rq.setAttribute("ResumoPedidosSMS",rsPedidosSMS);
        	
        	getServletConfig().getServletContext().getRequestDispatcher("/admin/default.jsp").forward(rq, rs);
        	
		}
        /** Final do Try */
        /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet Administracao");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
		}               
        /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet Administracao");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect(rq.getContextPath()+ "/Erro.jsp");
		}
        /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet Administracao");
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

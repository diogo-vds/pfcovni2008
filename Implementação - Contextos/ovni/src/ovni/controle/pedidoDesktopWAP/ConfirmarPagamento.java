package ovni.controle.pedidoDesktopWAP;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import ovni.negocio.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmarPagamento extends HttpServlet{

	public void processRequest (HttpServletRequest rq, HttpServletResponse rs) throws IOException, Exception
	{
		String flag = rq.getParameter("flag");
		if (flag.equalsIgnoreCase("CARTAOCREDITO"))
		{ 
			CartaoCredito cartao = new CartaoCredito();
			cartao.confirmarPagamento();
		}
		if (flag.equalsIgnoreCase("BOLETO"))
		{
			String filePath = rq.getParameter("path");			
			Boleto boleto = new Boleto();			
			boleto.confirmarPagamento(filePath);
		}
		if (flag.equalsIgnoreCase("CELULAR"))
		{
			PedidoSMS pedido = new  PedidoSMS();
			pedido.confirmarPagamento();			
		}
	}
	
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		rs.sendRedirect("/ovni/default.jsp");
	}
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			processRequest(rq, rs);		
			getServletConfig().getServletContext().getRequestDispatcher("/Administracao").forward(rq, rs);
		}		
		catch (Exception e) 
		{ 
			rq.getSession().setAttribute("erro", "Erro pagamento: " + e.getMessage());
			rs.sendRedirect("Erro.jsp");
		}
	}
}

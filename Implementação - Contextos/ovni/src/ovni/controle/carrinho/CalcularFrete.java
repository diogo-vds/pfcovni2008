package ovni.controle.carrinho;
import ovni.negocio.Carrinho;
import ovni.negocio.FreteCorreios;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

public class CalcularFrete extends HttpServlet {
	
	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException, Exception{
		Carrinho carrinho = (Carrinho)rq.getSession().getAttribute("oCarrinho");
		String CEP = (String) rq.getParameter("CEP");
		carrinho.setCEP(CEP);
		carrinho.CalcularValorFrete(CEP);
		rq.getSession().setAttribute("oCarrinho", carrinho);
	}
	
   	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
   		rs.sendRedirect("/ovni/VisualizarCarrinho");
    	} // FInal do doGet
	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			processRequest(rq, rs);
			rs.sendRedirect("/ovni/VisualizarCarrinho");
		}
		catch (Exception erro) 
		{
			rq.getSession().setAttribute("erro", erro.getMessage());
			rs.sendRedirect("Erro.jsp");
		}
		
//		Carrinho carrinho = (Carrinho)rq.getSession().getAttribute("oCarrinho");
//		String CEP = (String) rq.getParameter("CEP");
//		carrinho.setCEP(CEP);
//		
//		
//		
//		print.print(carrinho.getCEP());
//		print.print("<br>");
//		print.print(carrinho.calcularPesoItens());
//		print.print("<br>");
//
//		FreteCorreios frete = new FreteCorreios();
//		frete.setCepDestino(carrinho.getCEP());
//		frete.setCodigoServico(41106);
//		frete.setPeso(carrinho.calcularPesoItens());
//		
//		try{
//		print.print(frete.executar(41106, carrinho.getCEP(), carrinho.calcularPesoItens()));
//		}
//		catch(Exception ew) {}

	}
}

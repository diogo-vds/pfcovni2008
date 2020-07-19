package ovni.controle.pedidoDesktopWAP;
import ovni.negocio.*;

import java.util.ConcurrentModificationException;
import java.util.Vector;
import java.io.*;
import java.sql.*;

import javax.print.Doc;
import javax.servlet.*;
import javax.servlet.http.*;

import com.sun.xml.internal.txw2.Document;


public class FinalizarPedidoDesktopWAP extends HttpServlet{
	
	private Usuario usu = new Usuario( );

	private void recuperarUsuario(HttpServletRequest rq)
	{		
		usu = (Usuario) rq.getSession().getAttribute("Usuario");
	}	
			
	private void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
			String flag = rq.getParameter("flag");
			recuperarUsuario(rq);
			
			try
			{
				if (flag.equals("pagamento"))
				{

					
					Carrinho carr = (Carrinho) rq.getSession().getAttribute("oCarrinho");
					PedidoDesktopWAP pedido = new PedidoDesktopWAP(carr);									
					pedido.atualizarEndereco(usu.getEnderecoPorCodigo(Integer.parseInt(rq.getParameter("OpcaoEndereco"))));
					pedido.setUsuario(usu);					
					rq.getSession().setAttribute("oPedido", pedido);
					
					TipoFormaPagamento pgto = new TipoFormaPagamento();					
					Vector<TipoFormaPagamento> pgtos = new Vector<TipoFormaPagamento>();					
					pgtos = pgto.listar(true);				
					
					rq.setAttribute("FormasPagamento", pgtos);					
					getServletConfig().getServletContext().getRequestDispatcher("/loggin/pagamento.jsp").forward(rq, rs);				
				}
				if (flag.equals("revisar"))
				{				
					PedidoDesktopWAP pedido = (PedidoDesktopWAP) rq.getSession().getAttribute("oPedido");
					
					TipoFormaPagamento pgto = new TipoFormaPagamento();
					pgto = pgto.retornarFormaPGTOporCodigo(Integer.parseInt(rq.getParameter("OpcaoPagamento")));
					
					pedido.adicionarFormaPagamento(pgto);					
					if (pgto.isTEF())
					{	
						CartaoCredito cartao = new CartaoCredito();
						cartao.setnumeroCartao(Long.parseLong(rq.getParameter("NumeroCartao")));
						cartao.setcodigoSeguranca(Integer.parseInt(rq.getParameter("NumSegurancaCartao")));
						cartao.setNomeCartao(rq.getParameter("NomeCartao"));
						cartao.setMesValidade(Integer.parseInt(rq.getParameter("ValidadeCartaoMes")));
						cartao.setAnoValidade(Integer.parseInt(rq.getParameter("ValidadeCartaoAno")));
						cartao.setParcelas(Integer.parseInt(rq.getParameter("NumParcelas")));
						
						pedido.adicionarDadosCartao(cartao);
					}				
					rq.getSession().setAttribute("oPedido", pedido);
					getServletConfig().getServletContext().getRequestDispatcher("/loggin/resumopedido.jsp").forward(rq, rs);	
				}
				
				if (flag.equals("fecharPedido"))
				{
					PedidoDesktopWAP pedido = (PedidoDesktopWAP) rq.getSession().getAttribute("oPedido");
					rq.getSession().setAttribute("oCarrinho", null);
					rq.getSession().setAttribute("oPedido", null);
					pedido.inserir();
					rq.setAttribute("Pedido", pedido);
					getServletConfig().getServletContext().getRequestDispatcher("/loggin/pedidoFechado.jsp").forward(rq, rs);
				}
			}//Final do TRY
			catch (Exception e) {
				rq.setAttribute("erro", "Erro ao finalizar o pedido");
				rs.sendRedirect("/ovni/Erro.jsp");
			}
			
	}
	
		
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		rs.sendRedirect("/ovni/carrinho.jsp");
	}
	
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		processRequest(rq, rs);		
	}
	
	
}//final da classe


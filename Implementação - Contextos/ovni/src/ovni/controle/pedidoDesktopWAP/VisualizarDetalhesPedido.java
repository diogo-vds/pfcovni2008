package ovni.controle.pedidoDesktopWAP;
import ovni.negocio.Endereco;
import ovni.negocio.ItemPedido;
import ovni.negocio.PedidoDesktopWAP;
import ovni.negocio.TipoFormaPagamento;
import ovni.negocio.Usuario;
import ovni.util.Util;
import java.io.*;
import java.sql.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class VisualizarDetalhesPedido extends HttpServlet{
	
	private void VisualizarDetalhes(HttpServletRequest rq, HttpServletResponse rs ) throws ServletException, IOException
	{
		Usuario usu = (Usuario)rq.getSession().getAttribute("Usuario");
		long codigoPedido = Long.parseLong(rq.getParameter("CodigoPedido"));
		if (usu != null)
		{
			try
			{
				ResultSet oRsItem = null;
				ResultSet oRsPedido = null;
				ResultSet oRsEndereco = null;
				
				PedidoDesktopWAP ped = new PedidoDesktopWAP();
				oRsPedido = ped.retornarDetalhes((long)codigoPedido);
				rq.setAttribute("Pedido", oRsPedido);
				
				PedidoDesktopWAP ped2 = new PedidoDesktopWAP();
				ResultSet oRsPedido2 = ped2.retornarDetalhes((long)codigoPedido);
				oRsPedido2.next();
				
				ItemPedido item = new ItemPedido();
				oRsItem = item.retornarItensPedido((long)codigoPedido);
				rq.setAttribute("Item", oRsItem);
				
				Endereco end = new Endereco();
				oRsEndereco = end.retornarEnderecoPorCodigo((long) oRsPedido2.getLong("CodEndereco"));
				
				rq.setAttribute("Endereco", oRsEndereco);
				
				getServletConfig().getServletContext().getRequestDispatcher("/loggin/DetalhesPedido.jsp").forward(rq, rs);
			}
			catch (SQLException Erro)
			{
				rq.getSession().setAttribute("erro", Erro);
				rs.sendRedirect("Erro.jsp");
			}
			catch (ServletException Erro) 
			{
				rq.getSession().setAttribute("erro", Erro);
				rs.sendRedirect("Erro.jsp");
			}// FInal do CATCH
			catch (IOException Erro) 
			{
				rq.getSession().setAttribute("erro", Erro);
				rs.sendRedirect("Erro.jsp");
			}// FInal do CATCH
			catch (Exception Erro) 
			{
				rq.getSession().setAttribute("erro", Erro);
				rs.sendRedirect("Erro.jsp");
			}
		}//FINAL DO IF
	}
	
	
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		rs.sendRedirect("/ovni/loggin/pedido.jsp");
	}
	
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		VisualizarDetalhes(rq, rs);		
	}

}

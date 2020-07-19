package ovni.controle.pedidoDesktopWAP;
import ovni.negocio.PedidoDesktopWAP;
import ovni.negocio.Usuario;
import ovni.util.Util;
import java.io.*;
import java.sql.*;
import java.text.*;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;

public class PesquisarPedido extends HttpServlet {

	public void proccesRequest(HttpServletRequest rq, HttpServletResponse rs) throws IOException, Exception
	{
			Vector<PedidoDesktopWAP> listaPedidos = new Vector<PedidoDesktopWAP>();
			
			String flag = rq.getParameter("flag");
			try
			{
				Usuario usu;				
				if(rq.getSession().getAttribute("Usuario") != null) usu = (Usuario) rq.getSession().getAttribute("Usuario");
				else usu = new Usuario().BuscarDetalhesDoUsuario(Long.parseLong(rq.getParameter("cod_usu")));
				
				if(rq.getParameter("tp_acess")!= null)
				{
					PedidoDesktopWAP ped = new PedidoDesktopWAP();
					ResultSet oRs = null;
					oRs = ped.retornarPedidosCodigo(Integer.parseInt(rq.getParameter("Codigo")), usu);
					
					rq.setAttribute("Pedidos", oRs);
					getServletConfig().getServletContext().getRequestDispatcher("/wap/loggin/pedidos.jsp").forward(rq, rs);
				}
				else
				{					
					if (flag.equalsIgnoreCase("buscar"))
					{
						PedidoDesktopWAP ped = new PedidoDesktopWAP();
						
						String radio = rq.getParameter("opcaoEscolhida");
						
						if (radio.equalsIgnoreCase("codigo"))
						{
							String param[] = {rq.getParameter("Codigo")};						
							listaPedidos = ped.listar(param, radio, usu.getCodigo());
						}
						if (radio.equalsIgnoreCase("Status"))
						{
							String param[] = {rq.getParameter("Status")};
							listaPedidos = ped.listar(param, radio, usu.getCodigo());
						}
						if (radio.equalsIgnoreCase("Data"))
						{
							String param[] = {rq.getParameter("MesI"),rq.getParameter("AnoI"),rq.getParameter("MesF"), rq.getParameter("AnoF")};
							listaPedidos = ped.listar(param, radio, usu.getCodigo());						
						}
						
						rq.getSession().setAttribute("cliBuscarPedido", listaPedidos);
						getServletConfig().getServletContext().getRequestDispatcher("/loggin/pedidos.jsp").forward(rq, rs);
					}
					
					if (flag.equalsIgnoreCase("Detalhes"))
					{
						int posicao = Integer.parseInt(rq.getParameter("posicao"));
						listaPedidos = (Vector) rq.getSession().getAttribute("cliBuscarPedido");		
						
						rq.setAttribute("cliDetalhesPedido", listaPedidos.elementAt(posicao));
	
						rq.getSession().setAttribute("cliBuscarPedido", null);
	
							rq.getSession().setAttribute("cliBuscarPedido", null);
							getServletConfig().getServletContext().getRequestDispatcher("/loggin/DetalhesPedido.jsp").forward(rq, rs);
					}
				}
			}
			catch (Exception e) {throw e;
			}
			
	}
	
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			proccesRequest(rq, rs);
		}
		catch (Exception Erro) 
		{
			rq.getSession().setAttribute("erro", Erro.toString());
			rs.sendRedirect("/ovni/Erro.jsp");
		}
	}

}

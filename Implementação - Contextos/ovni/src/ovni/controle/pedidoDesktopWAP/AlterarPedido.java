package ovni.controle.pedidoDesktopWAP;
import java.sql.*;
import java.util.Vector;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import ovni.negocio.PedidoDesktopWAP;
import ovni.negocio.TipoStatusPedido;
import ovni.util.Util;

public class AlterarPedido extends HttpServlet{

	public void proccesRequest(HttpServletRequest rq, HttpServletResponse rs) throws IOException, Exception
	{
			Vector<PedidoDesktopWAP> listaPedidos = new Vector<PedidoDesktopWAP>();
			
			String flag = rq.getParameter("flag");
			try
			{
				if (flag.equals("buscar"))
				{
					String radio = rq.getParameter("opcaoEscolhida");
					if (radio.equalsIgnoreCase("codigo"))
					{
						String param[] = {rq.getParameter("Codigo")};
						PedidoDesktopWAP ped = new PedidoDesktopWAP();
						listaPedidos = ped.listar(param, radio);
						rq.getSession().setAttribute("admBuscaPedido", listaPedidos);
						getServletConfig().getServletContext().getRequestDispatcher("/admin/pedidos.jsp").forward(rq, rs);
					}
					if (radio.equalsIgnoreCase("Status"))
					{
						String param[] = {rq.getParameter("Status")};

						PedidoDesktopWAP ped = new PedidoDesktopWAP();
						listaPedidos = ped.listar(param, radio);
						rq.getSession().setAttribute("admBuscaPedido", listaPedidos);
						getServletConfig().getServletContext().getRequestDispatcher("/admin/pedidos.jsp").forward(rq, rs);
					}
					if (radio.equalsIgnoreCase("Data"))
					{
						String param[] = {rq.getParameter("MesI"),rq.getParameter("AnoI"),rq.getParameter("MesF"), rq.getParameter("AnoF")};
							
						PedidoDesktopWAP ped = new PedidoDesktopWAP();
						listaPedidos = ped.listar(param, radio);
						rq.getSession().setAttribute("admBuscaPedido", listaPedidos);
						
						getServletConfig().getServletContext().getRequestDispatcher("/admin/pedidos.jsp").forward(rq, rs);
						
					}
				}
				
				if (flag.equalsIgnoreCase("Detalhes"))
				{
					int posicao = Integer.parseInt(rq.getParameter("posicao"));
					listaPedidos = (Vector) rq.getSession().getAttribute("admBuscaPedido");					
					rq.getSession().setAttribute("admAlteraPedido", listaPedidos.elementAt(posicao));
					getServletConfig().getServletContext().getRequestDispatcher("/admin/DetalhesPedido.jsp").forward(rq, rs);
				}
				
				
				if (flag.equalsIgnoreCase("alterar"))
				{
					String sCodigoRastreamento;
						if (rq.getParameter("codRastreamento") != null)
							sCodigoRastreamento = rq.getParameter("codRastreamento");
						else
							sCodigoRastreamento = "";
					int sCodigoStatus = Integer.parseInt(rq.getParameter("Status"));
					
					
					PedidoDesktopWAP ped = (PedidoDesktopWAP)rq.getSession().getAttribute("admAlteraPedido");
					
					ped.alterarPedido(sCodigoStatus, sCodigoRastreamento);	
					
					rq.getSession().setAttribute("admAlteraPedido", null);
					rq.getSession().setAttribute("admBuscaPedido", null);
					rs.sendRedirect("/ovni/Administracao");
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

}//FINAL DA CLASSE

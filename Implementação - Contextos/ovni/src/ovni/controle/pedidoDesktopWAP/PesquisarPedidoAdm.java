package ovni.controle.pedidoDesktopWAP;
import ovni.negocio.PedidoDesktopWAP;
import ovni.negocio.Usuario;
import ovni.util.Util;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class PesquisarPedidoAdm extends HttpServlet {

	private ResultSet oRs = null;
	private int Codigo;
	private Date DataIni;
	private Date DataFim;
	private int Status;
	private Usuario usu;
		
	private void Validar(HttpServletRequest rq)
	{
		if (rq.getParameter("Codigo") != "")
		{
			Codigo = Integer.parseInt(rq.getParameter("Codigo"));
		}
		else
		{
			Codigo = 0;
		}
		if ((rq.getParameter("MesI") != "") && (rq.getParameter("AnoI") != ""))
		{
			int ano = Integer.parseInt(rq.getParameter("AnoI"));
			int mes = Integer.parseInt(rq.getParameter("MesI"));
			int dia = 01;
			DataIni = Util.retornarData(ano, mes, dia); 
		}
		else
		{
			DataIni = Util.retornarData(2007, 01, 01);
		}
		if ((rq.getParameter("MesF") != "") && (rq.getParameter("AnoF") != ""))
		{
			int ano = Integer.parseInt(rq.getParameter("AnoF"));
			int mes = Integer.parseInt(rq.getParameter("MesF"));
			int dia = 31;
			DataFim = Util.retornarData(ano, mes, dia); 
		}
		else
		{
			DataFim = Util.retornarData(2008, 12, 31);
		}
		
		if (rq.getParameter("Status") != "0")
		{
			Status = Integer.parseInt((rq.getParameter("Status")));
		}
		else
			Status = 0;
	}
	
	
	private void RecuperarPedido(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, IOException
	{
		try
		{
			Validar(rq);
			PedidoDesktopWAP pedido = new PedidoDesktopWAP();
			String op = rq.getParameter("opcao");

			{
				if (op.equals("Codigo"))
					{ oRs = pedido.retornarPedidosCodigo(Codigo, usu);}
				if (op.equals("Status"))
					{ oRs = pedido.retornarPedidosStatus(Status, usu);}
				if (op.equals("Data"))
					{ oRs = pedido.retornarPedidosData(DataIni, DataFim, usu);}
			}

		}
		catch (SQLException SQLErro){throw new SQLException(SQLErro.getMessage());}
	}
	
	private void Pesquisar(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			usu = (Usuario) rq.getSession().getAttribute("Usuario");
			if (usu != null)
			{
				RecuperarPedido(rq, rs);
				rq.setAttribute("Pedidos", oRs);
				getServletConfig().getServletContext().getRequestDispatcher("/loggin/pedidos.jsp").forward(rq, rs);
			}
			else
			{
				rs.sendRedirect("/ovni/acesso.jsp");
			}
		}
		catch (ServletException Erro) 
		{
			rq.getSession( ).setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
		catch (IOException Erro) 
		{
			rq.getSession( ).setAttribute("erro", Erro);
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
		catch (SQLException Erro) 
		{
			rq.getSession( ).setAttribute("erro", Erro.getMessage());
			rs.sendRedirect("Erro.jsp");
		}// FInal do CATCH
	
	}
	
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		rs.sendRedirect("ovni/admin/pedidos.jsp");
	}
	
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		Pesquisar(rq, rs);		
	}

}

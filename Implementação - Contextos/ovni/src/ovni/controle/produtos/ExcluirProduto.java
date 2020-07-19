package ovni.controle.produtos;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.math.*; 
import java.util.Vector;
import java.lang.Short;
import ovni.negocio.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ExcluirProduto extends HttpServlet {

	protected void doGet(HttpServletRequest rq, 
			HttpServletResponse rp) 
				throws ServletException, IOException{
		try {
			this.Excluir(rq, rp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException
	{
   		try {
			this.Excluir(rq, rp);
		} catch (SQLException e) {
			rp.sendRedirect("/ovni/Erro.jsp");
		} catch (Exception e) {
			rp.sendRedirect("/ovni/Erro.jsp");
		}
   	}
   	
	public void Excluir(HttpServletRequest rq, HttpServletResponse rp ) throws SQLException, Exception
	{	 
		long codigoproduto = 0;
   		codigoproduto =Long.parseLong(rq.getParameter("codigo"));
   		Produto produto = new Produto();
   		String excluir = produto.ExcluirProduto(codigoproduto);
   		rq.setAttribute("status", excluir);
   		getServletConfig().getServletContext().getRequestDispatcher("/admin/editarproduto.jsp").forward(rq, rp);
	}
}
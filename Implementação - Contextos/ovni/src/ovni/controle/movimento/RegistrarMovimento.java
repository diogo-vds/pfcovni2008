package ovni.controle.movimento;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Movimento;
import ovni.negocio.Produto;

public class RegistrarMovimento extends HttpServlet{

	public void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException{
		getServletConfig().getServletContext().getRequestDispatcher("default.jsp").forward(rq,rp);
	}

	public void doPost(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException{

		Movimento movimento = null;
		Produto prod = null;

		if("buscar".equals(rq.getParameter("acao"))){
			movimento = new Movimento();
			long cod = Long.parseLong(rq.getParameter("codigo"));
			try {
				prod = movimento.buscar(cod);
				rq.setAttribute("prod", prod);
				getServletConfig().getServletContext().getRequestDispatcher("/admin/registrarmovimento.jsp").forward(rq,rp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			int tipo = Integer.parseInt(rq.getParameter("tipo"));
			long cod = Long.parseLong(rq.getParameter("codigo"));
			int qtd = Integer.parseInt(rq.getParameter("quantidade"));
			movimento = new Movimento();
			movimento.setDados(cod, tipo, qtd);
			String registro = movimento.registrarMovimento();
			rq.setAttribute("registro", registro);
			getServletConfig().getServletContext().getRequestDispatcher("/admin/registrarmovimento.jsp").forward(rq,rp);
		}				
	}
}

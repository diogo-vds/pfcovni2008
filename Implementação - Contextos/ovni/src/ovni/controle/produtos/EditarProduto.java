package ovni.controle.produtos;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.DetalhesEspecificos;
import ovni.negocio.Produto;

public class EditarProduto extends HttpServlet{
	
	public void doGet(HttpServletRequest rq, HttpServletResponse rp){
		try {
			rp.sendRedirect("/default.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	public void doPost(HttpServletRequest rq, HttpServletResponse rp){
		Produto prod = new Produto();
		if("listar".equals(rq.getParameter("acao"))){
			Vector<Produto> lista = new Vector();
			try {
				lista = prod.RetornarBuscarProdutos(rq.getParameter("Titulo"), Integer.parseInt(rq.getParameter("TipoPesquisa")));
				rq.setAttribute("lista", lista);
				rq.setAttribute("acao", "selecionar");
				getServletConfig().getServletContext().getRequestDispatcher("/admin/editarproduto.jsp").forward(rq, rp);
			} catch (NumberFormatException e) {
				e.getMessage();
			} catch (SQLException e) {
				e.getMessage();
			} catch (Exception e) {
				e.getMessage();
			}			
		}else if("detalhes".equals(rq.getParameter("acao"))){
			try {
				prod = prod.buscarporcodigo(Long.parseLong(rq.getParameter("cod")));
				rq.setAttribute("acao", "detalhes");
				rq.setAttribute("produto", prod);
				try {
					getServletConfig().getServletContext().getRequestDispatcher("/admin/editarproduto.jsp").forward(rq, rp);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (NumberFormatException e) {
				System.out.print(e.getMessage());
			} catch (SQLException e) {
				System.out.print(e.getMessage());
			}

		}
	}
}

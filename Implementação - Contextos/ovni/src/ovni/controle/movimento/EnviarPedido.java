package ovni.controle.movimento;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.RegistrarEnvio;

public class EnviarPedido extends HttpServlet{
	RegistrarEnvio registrar = null;
	long codigo;
	String[] pedidos = null;	
	
	public void doGet(HttpServletRequest rq, HttpServletResponse rp)
			throws IOException, ServletException{
		doPost(rq,rp);
	}
	
	public void doPost(HttpServletRequest rq, HttpServletResponse rp)
				throws IOException, ServletException{
		this.acao(rq, rp);
	}
	
	public void acao(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException{
		if(rq.getParameterValues("PEDIDO")!=null){
			rq.getParameterValues("PEDIDO");
			this.registrarEnvio(rq, rp);
		}else{
			this.listarPedidos(rq, rp);
		}
	}
	
	public void listarPedidos(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException{
		registrar = new RegistrarEnvio();
		ResultSet rs = registrar.listarPedidosPendentes();
		rq.setAttribute("rs", rs);
		getServletConfig().getServletContext().getRequestDispatcher("/admin/registrarenvio.jsp").forward(rq,rp);

	}
	
	public void registrarEnvio(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException{
		registrar = new RegistrarEnvio();
		Vector<String> status = new Vector();
		//recupera todos os "checks checados"
		this.pedidos = rq.getParameterValues("PEDIDO");
		//percorre os valores dos checkbox
		for (int i = 0; i < pedidos.length; i++)
		{
	    	try {
				status.add(registrar.enviarPedidos(Long.parseLong((pedidos[i]))));
			} catch (NumberFormatException e) {
				status.add("Erro no pedido: "+pedidos[i]+"!" +" "+e.getMessage());
			} catch (SQLException e) {
				status.add("Erro no pedido: "+pedidos[i]+"!" +" "+e.getMessage());
			}			
		}
		rq.setAttribute("mensagem", status);
		getServletConfig().getServletContext().getRequestDispatcher("/admin/registrarenvio.jsp").forward(rq,rp);		
	}
}

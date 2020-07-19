package ovni.controle.produtos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Avaliacao;
import ovni.negocio.Usuario;

public class AvaliarProduto extends HttpServlet{
	//Atributos da Classe
	public void doGet(HttpServletRequest rq,
			HttpServletResponse rp) throws ServletException, IOException{
		doPost(rq,rp);
	}
	public void doPost(HttpServletRequest rq,
			HttpServletResponse rp) throws ServletException, IOException{
		PrintWriter p = rp.getWriter();
		long codusuario;
		long produto;
		String acao;
		if(rq.getSession().getAttribute("Usuario")!=null){
			Usuario usuario = (Usuario)rq.getSession().getAttribute("Usuario");
			codusuario = usuario.getCodigo();
			produto = (Long) rq.getSession().getAttribute("codigoproduto");
			if(rq.getParameter("acao")==null){
				acao = this.verificar(codusuario, produto);
				rq.setAttribute("codigoproduto", produto);
				rq.setAttribute("acao", acao);
				getServletConfig().getServletContext().getRequestDispatcher("/loggin/avaliarproduto.jsp").forward(rq, rp);
			}else if("avaliacao".equals(rq.getParameter("acao"))){
				String descricao = rq.getParameter("avaliacao");
				acao = this.registrar(codusuario, produto, descricao);
				rq.setAttribute("acao", acao);
				getServletConfig().getServletContext().getRequestDispatcher("/loggin/avaliarproduto.jsp").forward(rq,rp);
			}else if("verificar".equals(rq.getSession().getAttribute("acao"))){
				acao = this.verificar(codusuario, produto);
				rq.setAttribute("codigoproduto", produto);
				rq.setAttribute("acao", acao);
				getServletConfig().getServletContext().getRequestDispatcher("/loggin/avaliarproduto.jsp").forward(rq, rp);
			}
		}		
		
	}
	
	public String registrar(long usuario, long produto,String descricao){
		
		Avaliacao avaliacao = new Avaliacao();
		return avaliacao.Inserir(usuario, produto, descricao);		
		
	}
	
	public String verificar(long usuario, long produto){
		String acao = null;
		Avaliacao avaliacao = new Avaliacao();
		if(avaliacao.VerificarAvaliacao(produto, usuario)){
			acao = "avaliado";
		}else{
			acao = "avaliar";
		}
		return acao;
	}
}
package ovni.controle.produtos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Boleto;
import ovni.negocio.Usuario;

public class ManterBoleto extends HttpServlet{
	//Atributos da classe
	Usuario usuario = null;
	long codigoBoleto = 0;
	long codigoUsuario = 0;
	ResultSet rs = null;
	Boleto boleto = null;
	
	public void doGet(HttpServletRequest rq,
			HttpServletResponse rp) 
				throws IOException, ServletException{		
		doPost(rq,rp);
	}
	public void doPost(HttpServletRequest rq,
			HttpServletResponse rp) throws IOException, ServletException{
		//Verifica se o usuário esta logado
		if(rq.getSession().getAttribute("Usuario")==null){
			rp.sendRedirect("/ovni/acesso.jsp");
		}else{
			try {
				this.acao(rq, rp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}				
	}
	
	public void acao(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException, Exception{
		
		usuario = (Usuario) rq.getSession().getAttribute("Usuario");
		/*Caso o código do boleto ñ tenha sido preenchido,
		 * chama o método de listar boletos.
		 * Caso tenha sido preenchido, chama o método para montar o 
		 * boleto.
		 */
		if(rq.getParameter("codigo")==null){
			codigoUsuario = usuario.getCodigo();
			this.listarboletos(rq, rp, codigoUsuario);
		}else{
			codigoBoleto = Long.parseLong(rq.getParameter("codigo"));
			this.montarBoleto(rq, rp, codigoBoleto);
		}
	}
	/**
	 * Método que lista os boletos de um usuário.
	 */
	public void listarboletos(HttpServletRequest rq, HttpServletResponse rp,long codigo) throws ServletException, IOException{
		boleto = new Boleto();
		rs = boleto.listarBoletos(codigo);
		rq.setAttribute("rsLista", rs);
		getServletConfig().getServletContext().getRequestDispatcher("/loggin/central_usuario.jsp").forward(rq,rp);
	}
	/**
	 * 
	 * @param rq
	 * @param rp
	 * @param codigo
	 * Método que monta o boleto selecionado.
	 * 
	 */
	public void montarBoleto(HttpServletRequest rq,HttpServletResponse rp, long codigo) throws ServletException, IOException, SQLException{
		boleto = new Boleto();
		ResultSet rRs = boleto.buscarBoleto(codigoBoleto); 
		if(rRs.next()){
			try{
				boleto.setCodigo(rRs.getLong("_codigo"));
				boleto.setValor(rRs.getDouble("_valor"));
				boleto.setValorboleto(rRs.getDouble("_valorBoleto"));
				boleto.setNossonumero(rRs.getInt("_nossonumero"));
				boleto.setLinhadigitavel(rRs.getString("_linhaDigitavel"));
				boleto.setNumeropedido(rRs.getLong("_numeropedido"));
				boleto.setUsuario(rRs.getLong("_usuario"));	
				boleto.setDatavencimento(rRs.getDate("_datavencimento"));
				boleto.setDataprocessamento(rRs.getDate("_dataProcessamento"));
				boleto.setCedente(rRs.getString("_cedente"));

				rq.setAttribute("codigoBoleto", Long.toString(boleto.getCodigo()));
				rq.setAttribute("numeroPedido", Long.toString(boleto.getNumeropedido()));
				rq.setAttribute("cedente",boleto.getCedente());
				rq.setAttribute("nossoNumero",Integer.toString(boleto.getNossonumero()));
				rq.setAttribute("numeroPedido",Long.toString(boleto.getNumeropedido()));
				rq.setAttribute("nomeUsuario", usuario.getNome());
				rq.setAttribute("valorBoleto",Double.toString(boleto.getValorboleto()));
				rq.setAttribute("dataProcessamento",boleto.getDataprocessamento());
				rq.setAttribute("dataVencimento",boleto.getDatavencimento());
				rq.setAttribute("linhaDigitavel",boleto.getLinhadigitavel());	

			}catch(SQLException e){

			}	
		}
		getServletConfig().getServletContext().getRequestDispatcher("/loggin/boleto.jsp").forward(rq,rp);
	}
}



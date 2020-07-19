package ovni.controle.produtos;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.math.*; 
import java.util.Vector;
import java.lang.Short;
import ovni.negocio.*;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;

public class AlterarProduto extends HttpServlet {
	
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException
	{
		rp.sendRedirect("/ovni/default.jsp");
	}
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException
	{
   		try {
			this.Alterar(rq, rp);
		} catch (SQLException e) {

		} catch (Exception e) {

		}
   	}
 	public void Alterar(HttpServletRequest rq, HttpServletResponse rp ) throws SQLException, Exception
	{ 		 
   		try{
   			Produto produto = new Produto();
   			produto.setCodigo(Long.parseLong(rq.getParameter("codigo")));
   			produto.setTitulo(rq.getParameter("titulo"));
   			produto.setPeso(Float.parseFloat(rq.getParameter("peso")));
   			produto.setValor(Float.parseFloat(rq.getParameter("valor")));
   			produto.setUnidade(rq.getParameter("unidade"));
   			produto.setIpi(Integer.parseInt(rq.getParameter("ipi")));
   			produto.setIcms(Integer.parseInt(rq.getParameter("icms")));
   			produto.setClassfiscal(rq.getParameter("classfiscal"));
   			produto.setProcedencia(rq.getParameter("procedencia"));
   			produto.setPaisorigem(rq.getParameter("paisorigem"));
   			produto.setAnolancamento(Integer.parseInt(rq.getParameter("anolancamento")));
   			produto.setAutorartista(rq.getParameter(("autorartista")));
   			produto.setIdioma(rq.getParameter("idioma"));
   			produto.setFornecedor(Long.parseLong(rq.getParameter("fornecedor")));
   			produto.setResumo(rq.getParameter("resumo"));
   			//Pegar da sessão o atributo de detalhes específicos
   			Vector<DetalhesEspecificos> det = (Vector) rq.getSession().getAttribute("detalhes"); 
   			for(int i = 0;i<det.size();i++){
   				det.get(i).setConteudo(rq.getParameter(Integer.toString(i)));
   				det.get(i).setProduto(produto.getCodigo());
   			}
   			produto.setDetalhesEspecificos(det);
   			String status = produto.AtualizarProduto();

   			rq.setAttribute("status", status);   			
   			getServletConfig().getServletContext().getRequestDispatcher("/admin/editarproduto.jsp").forward(rq,rp);
   		}catch(NullPointerException e){

   		}catch(NumberFormatException e){

   		}
	}
 }
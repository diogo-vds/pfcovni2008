package ovni.controle.produtos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Produto;

public class PesquisarProdutos extends HttpServlet{

	public void doGet(HttpServletRequest rq,
			HttpServletResponse rp) throws IOException, ServletException{
		doPost(rq,rp);
	}	
	public void doPost(HttpServletRequest rq,
			HttpServletResponse rp) throws IOException, ServletException{
		
		
		PrintWriter w = rp.getWriter();
		
		Produto oProduto = new Produto();
		
		String ParamBusca = rq.getParameter("parambusca");
		int TipoBusca = Integer.parseInt(rq.getParameter("tipobusca"));		
		Vector<Produto> _ListaProdutos = new Vector<Produto>();
		
		
		try{
			
			_ListaProdutos = (Vector<Produto>) oProduto.RetornarBuscarProdutos(ParamBusca, TipoBusca);
			
			rq.setAttribute("vtPesquisaProdutos",_ListaProdutos);
			rq.setAttribute("parametro",ParamBusca);
			rq.setAttribute("TipoBusca", TipoBusca);

			//Direciona para página de login
 		   if(rq.getParameter("tp_acess") != null)
 		   {
 			   getServletConfig().getServletContext().getRequestDispatcher("/wap/pesquisarprodutos.jsp").forward(rq, rp);
 		   }	   	
 		   else
 		   {
 			   getServletConfig().getServletContext().getRequestDispatcher("/pesquisarprodutos.jsp").forward(rq, rp);
 		   }
			
			
			
		}catch(NumberFormatException e){
			
			
			
			//rp.sendRedirect("/ovni/pesquisarprodutos.jsp");
		}catch(NullPointerException e){
			//rp.sendRedirect("/ovni/pesquisarprodutos.jsp");
			w.println("Erro:" + e.getMessage());
		}
		catch( SQLException e){
			//rp.sendRedirect("/ovni/pesquisarprodutos.jsp");
			w.println("Erro:" + e.getMessage());
		}
	      catch (Exception e){
	    	  //rp.sendRedirect("/ovni/pesquisarprodutos.jsp");
	    	  w.println("Erro:" + e.getMessage());
	    }
				
	}
}


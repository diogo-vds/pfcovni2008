package ovni.controle.promocao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.Produto;
import ovni.negocio.Promocao;
import ovni.util.Util;

public class ManterPromocao extends HttpServlet {

	PrintWriter print;
	
	public void processRequest (HttpServletRequest rq, HttpServletResponse rs) throws IOException, Exception
	{
		//vetor para armazenar somente os produtos escolhidos pelo usuario
		Vector<Promocao> promocoes = new Vector<Promocao>(); 

		Vector<Produto> produtos = new Vector<Produto>();
		
		print = rs.getWriter();
		String flag = rq.getParameter("flag");
		
		
		if (flag.equalsIgnoreCase("buscaTipo"))
		{ 
			Produto prod = new Produto();			
			produtos = (Vector<Produto>)prod.BuscarProdutos(Integer.parseInt(rq.getParameter("tipobusca")));	
			rq.getSession().setAttribute("produtosPromo", produtos);
			getServletConfig().getServletContext().getRequestDispatcher("/admin/promocao.jsp").forward(rq, rs);
		}		
		if (flag.equalsIgnoreCase("ProdutosEscolhidos"))
		{
			//recupera as posicoes que o usuario selecionou
			String produt[] = rq.getParameterValues("produtoEscolhido");
			
			//recupera todos os produtos
			produtos = (Vector<Produto>) rq.getSession().getAttribute("produtosPromo");
		
			//adciona ao vetor os produtos escolhidos pelo usuario
			for (int iCont = 0; iCont < produt.length; iCont++)
			{
				Promocao promo = new Promocao();
				promo.setProduto(produtos.elementAt(Integer.parseInt(produt[iCont])));
				promocoes.addElement(promo);
			}			
			rq.getSession().setAttribute("produtosPromo", null);
			rq.getSession().setAttribute("promocoes", promocoes);
			getServletConfig().getServletContext().getRequestDispatcher("/admin/dadosPromocao.jsp").forward(rq, rs);			
		}
		if (flag.equalsIgnoreCase("alterarDados"))
		{
			int posicao = Integer.parseInt(rq.getParameter("posicao"));
			promocoes = (Vector<Promocao>) rq.getSession().getAttribute("promocoes");
			
			promocoes.elementAt(posicao).setValorPromocao(Float.parseFloat( rq.getParameter("valorPromo").replaceAll(",", ".")));
			
			rq.getSession().setAttribute("promocoes", promocoes);			
			getServletConfig().getServletContext().getRequestDispatcher("/admin/dadosPromocao.jsp").forward(rq, rs);			
		}
		if (flag.equalsIgnoreCase("finalizar"))
		{
			Promocao promo = new Promocao();
			
	    	promocoes = (Vector<Promocao>) rq.getSession().getAttribute("promocoes");
			
			
			int ano = Integer.parseInt(rq.getParameter("Ano"));
			int mes = Integer.parseInt(rq.getParameter("Mes"));
			int dia = Integer.parseInt(rq.getParameter("Dia"));			
			
			Date dataTermino = Util.retornarData(ano, mes, dia);
			
			for (int iCont = 0; iCont < promocoes.size(); iCont++)
			{
				promocoes.elementAt(iCont).setDataTermino(dataTermino);				
			}			
			promo.inserir(promocoes);
			
		}	
		
		if (flag.equalsIgnoreCase("listarPromocoes"))
		{
			rq.getSession().setAttribute("promocoesCadastradas", Promocao.listar());
			getServletConfig().getServletContext().getRequestDispatcher("/admin/promocoesCadastradas.jsp").forward(rq, rs);			
		}
		
	}
	
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		getServletConfig().getServletContext().getRequestDispatcher("/Administracao").forward(rq, rs);
	}
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
		try
		{
			processRequest(rq, rs);		
			
		//	getServletConfig().getServletContext().getRequestDispatcher("/Administracao").forward(rq, rs);
		}		
		catch (Exception e) 
		{ 
			rq.getSession().setAttribute("erro", "Erro promocao: " + e.getMessage());
			rs.sendRedirect("Erro.jsp");
		}
	}
	
	
	
	
	
}

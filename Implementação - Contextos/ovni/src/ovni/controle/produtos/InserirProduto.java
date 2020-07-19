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

public class InserirProduto extends HttpServlet {
	
	Produto produto;
	Vector<Object> campos;
	String status;

	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) 
		throws ServletException, IOException{
		this.doPost(rq, rp);
	}
	protected void doPost(HttpServletRequest rq, HttpServletResponse rp) 
				throws ServletException, IOException{		
		if("inserir".equals(rq.getParameter("acao"))){
			try {
				this.inserir(rq, rp);
			} catch (SQLException e) {
				System.out.print(e.getMessage());
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
		}else{
			try {
				this.montaForm(rq, rp);
			} catch (SQLException e) {
				System.out.print(e.getMessage());
			}
		}
	}
	
	/**
	 * Este método busca os dados para montar o formulário.
	 * Primeiro cria um objeto produto vazio e joga na sessão.
	 * Primeiro ele precisa receber o tipo de produto que será inserido.
	 * seta o tipo de produto no objeto que esta na sessão
	 * Depois ele precisa receber o genero
	 * seta o genero no objeto da sessao
	 * Depois recebe a categoria.
	 * seta a categoria no objeto da sessao
	 * busca as caracteristicas, monta um vetor e joga na sessao.
	 * recebe os dados do form, preenche o vetor de caracteristicas,
	 * preenche o objeto produto com os dados do form,
	 * preenche os detalhes especificos com o vetor na sessao
	 * insere o produto.
	 * @param rq
	 * @param rp
	 * @throws SQLException
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void montaForm(HttpServletRequest rq, HttpServletResponse rp) throws SQLException, ServletException, IOException{
		
		if("tipo".equals(rq.getParameter("acao"))){
			produto = (Produto)rq.getSession().getAttribute("produto");
		}else if("genero".equals(rq.getParameter("acao"))){
				produto.setTipoproduto(Long.parseLong(rq.getParameter("tipo")));
				campos = produto.MontaForm("genero", produto.getTipoproduto());
				status = "genero";
				rq.setAttribute("campos", campos);
		}else if("categoria".equals(rq.getParameter("acao"))){
				produto.setGenero(Long.parseLong(rq.getParameter("genero")));
				campos = produto.MontaForm("categoria", produto.getGenero());
				rq.setAttribute("campos", campos);
				Vector<DetalhesEspecificos> detalhes = new Vector<DetalhesEspecificos>();
				detalhes = produto.MontaForm("caracteristicas", produto.getTipoproduto());
				status = "categoria";
				rq.getSession().setAttribute("detalhes", detalhes);
		}else{
			produto = new Produto();
			rq.getSession().setAttribute("produto", produto);
			try {
				campos = produto.MontaForm("tipoproduto", 0);
				status = "tipo";
			} catch (SQLException e) {
				System.out.print(e.getMessage());
			} 
			rq.setAttribute("campos", campos);
		}
		rq.setAttribute("status", status);
		getServletConfig().getServletContext().getRequestDispatcher("/admin/inserirproduto.jsp").forward(rq,rp);
	}

	/**
	 * Este método insere o produto.
	 * @param rq
	 * @param rp
	 * @return
	 * @throws SQLException
	 * @throws Exception
	 */
	public void inserir(HttpServletRequest rq, 
			HttpServletResponse rp) 
				throws SQLException, Exception
	{
		produto = (Produto)rq.getSession().getAttribute("produto");
		produto.GerarCodigo();
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
		produto.setAutorartista(rq.getParameter("autorartista"));
		produto.setIdioma(rq.getParameter("idioma"));
		produto.setFornecedor(Long.parseLong(rq.getParameter("fornecedor")));
		produto.setResumo(rq.getParameter("resumo"));
		produto.setCategoria(Long.parseLong(rq.getParameter("categoria")));
		//Pegar da sessão o atributo de detalhes específicos
		Vector<DetalhesEspecificos> det = (Vector) rq.getSession().getAttribute("detalhes"); 
		for(int i = 0;i<det.size();i++){
			det.get(i).setDescricao(rq.getParameter(Integer.toString(i)));
			det.get(i).setProduto(produto.getCodigo());
		}
		produto.setDetalhesEspecificos(det);
		status = produto.InserirProduto();
		status = "imagem";
		String prod = Long.toString(produto.getCodigo());
		
		rq.setAttribute("status", status);
		rq.setAttribute("prod", prod);
		
		getServletConfig().getServletContext().getRequestDispatcher("/admin/inserirproduto.jsp").forward(rq,rp);
	}
}

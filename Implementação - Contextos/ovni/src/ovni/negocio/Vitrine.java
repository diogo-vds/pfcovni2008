/**
 * 
 */
package ovni.negocio;

import ovni.util.Util;
import java.io.*;
import java.sql.Date;
import java.sql.*;
import java.util.*;

/**
 * 
 * Classe utilizada para listar produtos e montar a vitrine de compras
 * 
 * @author Leo
 *
 */
public class Vitrine {

	/**
	 * 
	 */
	public Vitrine() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * Método para Listagem de produtos na vitrine
	 */
	public Vector<Produto> MontarVitrine(int iTipo, int iGenero) throws  SQLException, Exception
	{
		ResultSet rs = null;
		Connection conexao = null;
		PreparedStatement pstmt = null;
		conexao = Util.getConexao();
		Vector<Produto> _ListaProdutos = new Vector<Produto>(); 
		
		 try {			 
		
			 	String sSQL = "";

				sSQL = sSQL +  "  select ";
				sSQL = sSQL +  "	p._codigo	";
				sSQL = sSQL +  "	, p._titulo	";
				sSQL = sSQL +  "	, p._pesokg	";
				sSQL = sSQL +  "	, p._valor	";
				sSQL = sSQL +  "	, p._valor - (pr._valorpromocao * p._valor) AS _valorpromocinal	";
				sSQL = sSQL +  "	, p._unidade";
				sSQL = sSQL +  "	, p._ipi	";
				sSQL = sSQL +  "	, p._icms	";
				sSQL = sSQL +  "	, p._classfiscal";
				sSQL = sSQL +  "	, p._procedencia";
				sSQL = sSQL +  "	, p._paisorigem";
				sSQL = sSQL +  "	, p._anolancamento";
				sSQL = sSQL +  "	, p._autorartista";
				sSQL = sSQL +  "	, p._idioma	";
				sSQL = sSQL +  "	, p._tipoproduto";
				sSQL = sSQL +  "	, p._genero	";
				sSQL = sSQL +  "	, p._categoria";
				sSQL = sSQL +  "	, p._fornecedor";
				sSQL = sSQL +  "	, p._resumo	";
				sSQL = sSQL +  "	, p._vendas	";
				sSQL = sSQL +  "	, p._visitas	";
				sSQL = sSQL +  "	, p._status	";
				sSQL = sSQL +  "	,g._descricao as _desc_genero	";
				sSQL = sSQL +  "	,c._descricao as _desc_categoria ";
				sSQL = sSQL +  "	,i._url";	
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	left join promocao as pr on pr._produto = p._codigo	";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	";
				sSQL = sSQL +  "	(p._status = true)	";
				sSQL = sSQL +  "   	and (g._codigo = ? or ? = 0)";
				sSQL = sSQL +  "	and (p._tipoproduto = ? or ? = 0)	";	
				sSQL = sSQL +  "  order by p._titulo";
			
				pstmt = conexao.prepareStatement(sSQL);
				pstmt.setInt(1, iGenero);
				pstmt.setInt(2, iGenero);
				pstmt.setInt(3, iTipo);
				pstmt.setInt(4, iTipo);				
				
				rs = (ResultSet) pstmt.executeQuery();
				
				while(rs.next())
				{
					Produto item = new Produto();
					
					item.setCodigo(rs.getLong("_codigo"));
					item.setTitulo(rs.getString("_titulo"));
					item.setPeso(rs.getFloat("_pesokg"));
					item.setValor(rs.getFloat("_valor"));
					item.setUnidade(rs.getString("_unidade"));
					item.setIpi(rs.getInt("_ipi"));
					item.setIcms(rs.getInt("_icms"));
					item.setClassfiscal(rs.getString("_classfiscal"));
					item.setProcedencia(rs.getString("_procedencia"));
					item.setPaisorigem(rs.getString("_paisorigem"));
					item.setAnolancamento(rs.getInt("_anolancamento"));
					item.setAutorartista(rs.getString("_autorartista"));
					item.setIdioma(rs.getString("_idioma"));
					item.setTipoproduto(rs.getLong("_tipoproduto"));
					item.setGenero(rs.getLong("_genero"));
					item.setCategoria(rs.getLong("_categoria"));
					item.setFornecedor(rs.getLong("_fornecedor"));
					item.setResumo(rs.getString("_resumo"));
					item.setVendas(rs.getInt("_vendas"));
					item.setVisitas(rs.getInt("_visitas"));					
					item.setDescricao_categoria(rs.getString("_desc_categoria"));
					item.setDescricao_genero(rs.getString("_desc_genero"));
					
					try {
						rs.getString("_valorpromocinal");
						item.setValorPromocional(rs.getFloat("_valorpromocinal"));
					}
					catch (NullPointerException e) { }
					
					
					//Se existe Imagem Cadastrada setar a propriedade senão setar url padrão
					if(rs.getString("_url")!= null) item.setURLImagem(rs.getString("_url"));
					else  item.setURLImagem("./imgs/produtos/1_1.jpg");
					 
					
					//Insere Detalhes Especificos
					item.setDetalhesEspecificos(DetalhesEspecificos.BuscarDetalhes(item.getCodigo()));
	
					//Insere Avaliações
					item.setAvaliacoes(Avaliacao.ListarAvaliacoes(item.getCodigo()));

					
					_ListaProdutos.addElement(item);
				}
			
			
		}//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	      catch (Exception erro){throw new Exception(erro.getMessage());}	
	      finally { Util.fecharConexao(conexao); }
		 
		 
		return _ListaProdutos;
		 
	}// Final do Método
	
	/**
	 * Método Default para Listagem de produtos na vitrine
	 */
	public Vector<Produto> MontarVitrinePorGenero(int iGenero) throws  SQLException, Exception
	{
		 try {
			 
			 //Montar Vitrine a partir de um gênero
			return MontarVitrine(0, iGenero);
			 
		 }//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	      catch (Exception erro){throw new Exception(erro.getMessage());}	
		 
	}// Final do Método
	
	/**
	 * Método Default para Listagem de produtos na vitrine
	 */
	public Vector<Produto> MontarVitrinePorTipo(int iTipo) throws  SQLException, Exception
	{
		 try {
			 
			 //Montar Vitrine a partir de um tipo de produto
			 return MontarVitrine(iTipo, 0);
			 
		 }//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	      catch (Exception erro){throw new Exception(erro.getMessage());}	
		 
	}// Final do Método	

	
	/**
	 * Método Default para Listagem de produtos na vitrine
	 */
	public Vector<Produto> MontarVitrineDefault() throws  SQLException, Exception
	{
		try {
			 
			 //Montar Vitrine a partir de um tipo de produto
			 return MontarVitrine(0, 0);
			 
		 }//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	      catch (Exception erro){throw new Exception(erro.getMessage());}	
		 
	}// Final do Método	

	
	/**
	 * Método Utilizado para verificar qual o vitrine será montada
	 * @return
	 * @throws SQLException
	 * @throws Exception
	 */
	public Vector<Produto> BuscarVitrines(int iTipo,int iGenero) throws  SQLException, Exception
	{

		Vector<Produto> _VitrineProdutos = new Vector<Produto>(); 

		try {
		
			if(iTipo != 0 && iGenero != 0) _VitrineProdutos = (Vector<Produto>) this.MontarVitrine(iTipo, iGenero);
		  	else if(iTipo != 0 && iGenero == 0) _VitrineProdutos = (Vector<Produto>) this.MontarVitrinePorTipo(iTipo); 
		  	else if(iTipo == 0 && iGenero != 0) _VitrineProdutos = (Vector<Produto>) this.MontarVitrinePorGenero(iGenero);
		  	else _VitrineProdutos = (Vector<Produto>) this.MontarVitrine(iTipo, iGenero);
			
			 
		 }//Final do try 
		 catch (SQLException erro){ throw new SQLException(erro.getMessage() ); }
	     catch (Exception erro){throw new Exception(erro.getMessage());}
	     
	     return _VitrineProdutos;	 	
	}
	
	/**
	 * Método para Listar Lançamentos
	 * 
	 */
	public Vector<Produto> MontarVitrineLancamentos() throws SQLException, Exception
	{
		
		 Vector<Produto> _VitrineLancamentos = new Vector<Produto>(); 
		 Produto oProd = new Produto();
		 
		 try
		 {
			 _VitrineLancamentos = (Vector<Produto>) oProd.ListarLancamentos();
			 
		 }//Final do try 
		 catch (SQLException erro){ throw new SQLException(erro.getMessage() ); }
	     catch (Exception erro){throw new Exception(erro.getMessage());}
	     
	     return _VitrineLancamentos;	 	
		
	}
	
	/**
	 * Método para Listar Produtos em Promoções
	 * 
	 */
	public Vector<Produto> MontarVitrinePromocoes() throws SQLException, Exception
	{
		
		 Vector<Produto> _VitrinePromocoes = new Vector<Produto>(); 
		 Produto oProd = new Produto();
		 //oProd.L
		 try
		 {
			 _VitrinePromocoes = (Vector<Produto>) oProd.ListarProdutosEmPromocoes();
			 
		 }//Final do try 
		 catch (SQLException erro){ throw new SQLException(erro.getMessage() ); }
	     catch (Exception erro){throw new Exception(erro.getMessage());}
	     
	     return _VitrinePromocoes;	
		
	}
	
	/**
	 * Método para Listar Mais Vendidos
	 * 
	 */
	public Vector<Produto> MontarVitrineMaisVendidos() throws SQLException, Exception
	{
		
		 Vector<Produto> _VitrineMaisVendidos = new Vector<Produto>(); 
		 Produto oProd = new Produto();
		 
		 try
		 {
			 _VitrineMaisVendidos = (Vector<Produto>) oProd.ListarMaisVendidos();
			 
		 }//Final do try 
		 catch (SQLException erro){ throw new SQLException(erro.getMessage() ); }
	     catch (Exception erro){throw new Exception(erro.getMessage());}
	     
	     return _VitrineMaisVendidos;	 	
		
	}
}

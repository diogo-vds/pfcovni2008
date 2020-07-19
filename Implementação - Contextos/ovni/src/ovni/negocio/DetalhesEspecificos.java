/**
 * 
 */
package ovni.negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import ovni.util.Util;

/**
 * @author Leo
 *
 */
public class DetalhesEspecificos {

	
	private String Caracteristica;
	private String Conteudo;
	//Diogo - Início Atributos e métodos de acesso
	private long codigoConteudo;
	private long produto;
	private long codCaracteristica;
	private String descricao;

	private Connection con = null;
	private PreparedStatement pst = null;
	private Statement st = null;
	private String sql = null;
	private ResultSet rs = null;

	/** Métodos de Acesso **/
	public long getCodigoConteudo() {
		return codigoConteudo;
	}
	public void setCodigoConteudo(long codigo) {
		this.codigoConteudo = codigo;
	}
	public long getProduto() {
		return produto;
	}
	public void setProduto(long produto) {
		this.produto = produto;
	}
	public long getCodCaracteristica() {
		return codCaracteristica;
	}
	public void setCodCaracteristica(long codCaracteristica) {
		this.codCaracteristica = codCaracteristica;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	//Diogo – Fim Métodos de acesso
	/**
	 * 
	 */
	public DetalhesEspecificos() {
		// TODO Auto-generated constructor stub
	}

	public void setCaracteristica(String caracteristica) {
		Caracteristica = caracteristica;
	}

	public String getCaracteristica() {
		return Caracteristica;
	}

	public void setConteudo(String conteudo) {
		Conteudo = conteudo;
	}

	public String getConteudo() {
		return Conteudo;
	}

	
	public static Vector<DetalhesEspecificos> BuscarDetalhes(long iCod) throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		Vector<DetalhesEspecificos> _ListaEspeficicos = new Vector<DetalhesEspecificos>();
		
		try
		{
			//Monta a Query
			String sSQL = "";
			
			sSQL = sSQL +  "  select 																			";
			//adicionado o codigo da caracteristica e o codigo do conteudo ao retorno do resultset
			//Diogo
			sSQL = sSQL +  "	carac._codigo as CodCaract														";
			sSQL = sSQL +  " 	,carac._descricao as Caracteristica												";
			sSQL = sSQL +  "	,cont._descricao as Conteudo													";
			sSQL = sSQL +  "	,cont._codigo as CodConteudo													";
			sSQL = sSQL +  "  from conteudoproduto as cont														";
			sSQL = sSQL +  "	inner join caracttipoproduto as carac on carac._codigo = cont._caracttipoproduto";
			sSQL = sSQL +  "	inner join produtos as p on p._codigo = cont._produto 							";
			sSQL = sSQL +  "	WHERE 																			";
			sSQL = sSQL +  "		carac._tipoproduto = p._tipoproduto											";
			sSQL = sSQL +  "		and p._codigo = ?															";								


			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters( );
			pstmt.setLong(1, iCod);
			rs = pstmt.executeQuery( );
			
			while(rs.next())
			{
				DetalhesEspecificos item = new DetalhesEspecificos();
				
				item.setCaracteristica(rs.getString("Caracteristica"));
				item.setConteudo(rs.getString("Conteudo"));	
				item.setCodCaracteristica(rs.getLong("CodCaract"));
				item.setCodigoConteudo(rs.getLong("CodConteudo"));
				
				//Adiciona um novo objeto de DetalhesEspefícicos na Lista
				_ListaEspeficicos.addElement(item);
				
			}
			
		}// FInal do TRY

		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }		
		
		return _ListaEspeficicos ;
	}
	
	/**
	 * @author Diogo
	 * Este método insere no banco os detalhes de um produto.
	 */
	public void inserir(Vector<DetalhesEspecificos> prod) {		
		for (int i = 0; i < prod.size(); i++) {
			
			this.gerarCodigo();
			con = Util.getConexao();
			sql = " insert into ConteudoProduto" + " values( " 
					+ this.getCodigoConteudo() + " , " 
					+ prod.get(i).getProduto() + " , " + 
					prod.get(i).getCodCaracteristica() + " , '"
					+ prod.get(i).getDescricao() + " ')";
			try {
				st = con.createStatement();
				st.execute(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Util.fecharConexao(con);
		}
		
	}
	/**
	 * @author Diogo
	 * @param cod
	 * @return
	 * @throws SQLException
	 * este Método pega todos os detalhes de um produto.
	 */
	public Vector<DetalhesEspecificos> visualizar(long cod) throws SQLException {
		Vector<DetalhesEspecificos> detalhes = new Vector();
		con = null;
		sql = "select * from ConteudoProduto" + "where _produto = " + cod;
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				DetalhesEspecificos det = new DetalhesEspecificos();
				det.setDados(rs.getLong("_codigo"), 
						rs.getLong("_produto"), 
						rs.getString("_descricao"));
						rs.getLong("_caracttipoproduto");
				detalhes.add(det);
			}
		}

		return detalhes;
	}
	/**
	 * @author Diogo
	 * @param prod
	 * Este método faz a atualização dos detalhes de um produto.
	 */
	public void atualizar(Vector<DetalhesEspecificos> prod) {
		con = Util.getConexao();
		for(int i = 0; i<prod.size();i++){
			sql = " update conteudoproduto set " +
					" _descricao = '"+prod.get(i).getConteudo()+"'"+
					" where _codigo = "+prod.get(i).getCodigoConteudo();
			try {
				pst = con.prepareStatement(sql);
				pst.execute();
			} catch (SQLException e) {
			
			}
		}
		Util.fecharConexao(con);
	}
	/**
	 * @author Diogo
	 * @param prod
	 * Este método faz a exclusão dos detalhes de um produto.
	 */
	public void excluir(long prod) {
		con = Util.getConexao();
		sql = "delete conteudoproduto where "+
			" _produto = "+prod;
		try {
			pst = con.prepareStatement(sql);
			pst.execute();
		} catch (SQLException e) {
			
		}
		Util.fecharConexao(con);
	}
	/**
	 * @author Diogo
	 * @param prod
	 * @param caract
	 * @param desc
	 * @throws SQLException
	 *  Este método seta os dados do objeto para inserir no banco.
	 */
	public void setDados(long prod, long caract, String desc) throws SQLException {		
		this.gerarCodigo();
		this.setProduto(prod);
		this.setCodCaracteristica(caract);
		this.setDescricao(desc);
	}
	/**
	 * @author Diogo
	 * @param cod
	 * @param prod
	 * @param caract
	 * @param desc
	 * Este método preenche o objeto com os dados do banco
	 */
	public void setDados(long cod, long prod, long caract, String desc){
		this.setCodigoConteudo(cod);
		this.setProduto(prod);
		this.setCodCaracteristica(caract);
		this.setDescricao(desc);
	}
	/**
	 * Este método gera o código da caracteristica através da sequence da
	 * tabela.
	 * 
	 * @throws SQLException
	 * @author Diogo
	 * @param void
	 */
	public void gerarCodigo(){
		rs = null;
		con = Util.getConexao();
		try {
			pst = con.prepareStatement("SELECT nextval('sq_ConteudoProduto');");

			pst.clearParameters();
			rs = pst.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					this.setCodigoConteudo(rs.getLong("nextval"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Util.fecharConexao(con);
	}
	/**
	 * @author Diogo
	 * Este método lista os tipos de produtos 
	 */
	public Vector listarTipos() throws SQLException{
		sql = "Select _codigo,_descricao from tipoproduto order by _codigo";
		Vector<Object> tipos = new Vector();
		con = Util.getConexao();
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next()){
			tipos.add(rs.getInt("_codigo"));
			tipos.add(rs.getString("_descricao"));
		}
		Util.fecharConexao(con);
		return tipos;
	}
	/**
	 * @author Diogo
	 * Este método lista os gêneros de um tipo de produto
	 */
	public Vector listarGeneros(long cod) throws SQLException{
		sql = "Select _codigo,_descricao from genero " +
				" where _tipoproduto = "+cod;
		Vector<Object> tipos = new Vector();
		con = Util.getConexao();
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next()){
			tipos.add(rs.getInt("_codigo"));
			tipos.add(rs.getString("_descricao"));
		}
		Util.fecharConexao(con);
		return tipos;
	}
	/**
	 * @author Diogo
	 * Este método lista todas as categorias de um gênero
	 */
	public Vector listarCategorias(long cod) throws SQLException{
		sql = "Select _codigo,_descricao from categoria " +
				" where _genero = "+cod;
		Vector<Object> tipos = new Vector();
		con = Util.getConexao();
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next()){
			tipos.add(rs.getInt("_codigo"));
			tipos.add(rs.getString("_descricao"));
		}
		Util.fecharConexao(con);
		return tipos;
	}
	/**
	 * Este método lista as caracteristicas especificas do tipo de produto
	 * @author Diogo
	 * @param tipoproduto
	 * @return
	 * @throws SQLException
	 */
	public Vector<DetalhesEspecificos> listaCaracteristicas(long tipoproduto) throws SQLException{
		Vector<DetalhesEspecificos> lista = new Vector<DetalhesEspecificos>();
		DetalhesEspecificos det;
		sql = "select _codigo,_descricao,_tipoproduto from caracttipoproduto" +
				" where _tipoproduto = "+tipoproduto;
		con = Util.getConexao();
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next()){
			det = new DetalhesEspecificos();
			det.setCodCaracteristica(rs.getLong("_codigo"));
			det.setCaracteristica(rs.getString("_descricao"));
			lista.add(det);
		}
		Util.fecharConexao(con);
		return lista;
	}	
	
}
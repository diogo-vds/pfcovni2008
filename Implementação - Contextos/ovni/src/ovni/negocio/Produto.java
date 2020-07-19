package ovni.negocio;
import ovni.util.Util;
import java.io.*;
import java.sql.*;
import java.math.*; 
import java.util.Random;
import java.util.Vector;

public class Produto {

	/** Atributos da Classe */
	private	long	_codigo;     
	private	String	_titulo;     
	private	double	_peso ;
	private	float	_valor;
	private	float	_valor_promocional = 0;
	private String 	_unidade;
	private	int		_ipi;
	private	int		_icms;
	private	String	_classfiscal;
	private	String	_procedencia;
	private	String	_paisorigem;
	private	int		_anolancamento;
	private	String	_autorartista;
	private	String	_idioma;
	private	long	_tipoproduto;
	private	long	_genero;
	private String  _descricao_genero;
	private	long	_categoria;
	private String  _descricao_categoria;
	private String  _descricao_tipoproduto;
	private	long	_fornecedor;
	private	String	_resumo;
	private	int		_vendas;
	private	int	_visitas;
	private	boolean	_Status;
	
	private String _imagem;
	
	/*Detalhes Espefícios*/	
	private Vector<DetalhesEspecificos> _DetalhesEspecificos;
	
	/* Avaliações */
	private Vector<Avaliacao> _Avaliacoes;
	

	//Métodos de acesso
	public long getCodigo() {
		return _codigo;
	}
	public void setCodigo(long _codigo) {
		this._codigo = _codigo;
	}
	public String getTitulo() {
		return _titulo;
	}
	public void setTitulo(String _titulo) {
		this._titulo = _titulo;
	}
	public double getPeso() {
		
		return _peso;
	}
	public void setPeso(double _peso) {
		this._peso = _peso;
	}
	public float getValor() {
		return _valor;
	}
	public void setValor(float _valor) {
		this._valor = _valor;
	}
	/**
	 * @param _valor_promocional the _valor_promocional to set
	 */
	public void setValorPromocional(float _valor_promocional) {
		this._valor_promocional = _valor_promocional;
	}
	/**
	 * @return the _valor_promocional
	 */
	public float getValorPromocional() {
		return _valor_promocional;
	}
	public String getUnidade() {
		return _unidade;
	}
	public void setUnidade(String _valor) {
		this._unidade = _valor;
	}
	public int getIpi() {
		return _ipi;
	}
	public void setIpi(int _ipi) {
		this._ipi = _ipi;
	}
	public int getIcms() {
		return _icms;
	}
	public void setIcms(int _icms) {
		this._icms = _icms;
	}
	public String getClassfiscal() {
		return _classfiscal;
	}
	public void setClassfiscal(String _classfiscal) {
		this._classfiscal = _classfiscal;
	}
	public String getProcedencia() {
		return _procedencia;
	}
	public void setProcedencia(String _procedencia) {
		this._procedencia = _procedencia;
	}
	public String getPaisorigem() {
		return _paisorigem;
	}
	public void setPaisorigem(String _paisorigem) {
		this._paisorigem = _paisorigem;
	}
	public int getAnolancamento() {
		return _anolancamento;
	}
	public void setAnolancamento(int _anolancamento) {
		this._anolancamento = _anolancamento;
	}
	public String getAutorartista() {
		return _autorartista;
	}
	public void setAutorartista(String _autorartista) {
		this._autorartista = _autorartista;
	}
	public String getIdioma() {
		return _idioma;
	}
	public void setIdioma(String _idioma) {
		this._idioma = _idioma;
	}
	public long getTipoproduto() {
		return _tipoproduto;
	}
	public void setTipoproduto(long _tipoproduto) {
		this._tipoproduto = _tipoproduto;
	}
	public long getGenero() {
		return _genero;
	}
	public void setGenero(long _genero) {
		this._genero = _genero;
	}
	public void setDescricao_genero(String _descricao_genero) {
		this._descricao_genero = _descricao_genero;
	}
	public String getDescricao_genero() {
		return _descricao_genero;
	}
	public long getCategoria() {
		return _categoria;
	}
	public void setCategoria(long _categoria) {
		this._categoria = _categoria;
	}
	public void setDescricao_categoria(String _descricao_categoria) {
		this._descricao_categoria = _descricao_categoria;
	}
	public String getDescricao_categoria() {
		return _descricao_categoria;
	}
	public long getFornecedor() {
		return _fornecedor;
	}
	public void setFornecedor(long _fornecedor) {
		this._fornecedor = _fornecedor;
	}
	public String getResumo() {
		return _resumo;
	}
	public void setResumo(String _resumo) {
		this._resumo = _resumo;
	}
	public int getVendas() {
		return _vendas;
	}
	public void setVendas(int _vendas) {
		this._vendas = _vendas;
	}
	public int getVisitas() {
		return _visitas;
	}
	public void setVisitas(int _visitas) {
		this._visitas = _visitas;
	}
	public boolean getStatus() {
		return _Status;
	}
	public void setStatus(boolean status) {
		_Status = status;
	}
	
	public void setDescricao_tipoproduto(String _descricao_tipoproduto) {
		this._descricao_tipoproduto = _descricao_tipoproduto;
	}
	public String getDescricao_tipoproduto() {
		return _descricao_tipoproduto;
	}

	public void setDetalhesEspecificos(Vector<DetalhesEspecificos> detalhesEspecificos) {
		_DetalhesEspecificos = detalhesEspecificos;
	}
	public Vector<DetalhesEspecificos> getDetalhesEspecificos() {
		return _DetalhesEspecificos;
	}
	
	public void setAvaliacoes(Vector<Avaliacao> avaliacoes) {
		_Avaliacoes = avaliacoes;
	}
	
	public Vector<Avaliacao> getAvaliacoes() {
		return _Avaliacoes;
	}
	public void setURLImagem(String _imagem) {
		this._imagem = _imagem;
	}
	public String getURLImagem() {
		return _imagem;
	}
	/** Métodos de Negócio */
	public String InserirProduto(){
		String status = null;
		Connection conexao = Util.getConexao();
		Statement st = null;
		Estoque estoque = new Estoque();		
		DetalhesEspecificos detalhes = new DetalhesEspecificos();

			//Cadastra o produto
			String sql = "INSERT INTO PRODUTOS VALUES(" +
			this.getCodigo()+",'"+
			this.getTitulo()+"',"+
			this.getPeso()+","+
			this.getValor()+",'"+
			this.getUnidade()+"',"+
			this.getIpi()+","+
			this.getIcms()+",'"+
			this.getClassfiscal()+"','"+
			this.getProcedencia()+"','"+
			this.getPaisorigem()+"',"+
			this.getAnolancamento()+",'"+
			this.getAutorartista()+"','"+
			this.getIdioma()+"',"+
			this.getTipoproduto()+","+
			this.getGenero()+","+
			this.getCategoria()+","+
			this.getFornecedor()+",'"+
			this.getResumo()+"',"+
			this.getVendas()+","+
			this.getVisitas()+
			")";
			try {
				st = conexao.createStatement();
				st.execute(sql);
				status = "Produto cadastrado com sucesso!";
			} catch (SQLException e) {
				status = e.getMessage();
			}finally{
				Util.fecharConexao(conexao); 
			}
			
			//Insere os detalhes do produto
			detalhes.inserir(this.getDetalhesEspecificos());

			
			//Cadastra produto no estoque
			try {
				estoque.setDados(this.getCodigo(), 0);
			} catch (SQLException e2) {
				status = e2.getMessage();
			}		
			estoque.cadastrarProduto();

		return status;
	}   

	public String AtualizarProduto(){
		DetalhesEspecificos det = new DetalhesEspecificos();
		det.atualizar(this.getDetalhesEspecificos());
		String sql = " UPDATE produtos set "+
		" _titulo = '"+this.getTitulo()+"',"+
		" _pesokg = "+this.getPeso()+","+
		" _valor = "+this.getValor()+","+
		" _unidade = '"+this.getUnidade()+"',"+
		" _ipi = "+this.getIpi()+","+
		" _icms = "+this.getIcms()+","+
		" _classfiscal = "+this.getClassfiscal()+","+
		" _procedencia = '"+this.getProcedencia()+"',"+
		" _paisorigem  = '"+this.getPaisorigem()+"',"+
		" _anolancamento = "+this.getAnolancamento()+","+
		" _autorartista = '"+this.getAutorartista()+"',"+
		" _idioma = '"+this.getIdioma()+"',"+
		" _fornecedor = "+this.getFornecedor()+","+
		" _resumo = '"+this.getResumo()+"' " +
		" where _codigo = "+this.getCodigo();
		String atualizar = null;
		Connection conexao = Util.getConexao();
		PreparedStatement pst = null;
		try {
			pst = conexao.prepareStatement(sql);
			pst.execute();
			atualizar = "Produto Atualizado!";
		} catch (SQLException e) {
			atualizar = e.getMessage();
		}
		finally { Util.fecharConexao(conexao); }
		return atualizar;
	}

	public String ExcluirProduto(long codigo){
		String status = null;;
		String sql = "update produtos set _status = false where _codigo =  ?";
		Connection conexao = Util.getConexao();
		PreparedStatement pst;
		try {
			pst = conexao.prepareStatement(sql);
			pst.clearParameters();
			pst.setLong(1, codigo);
			try{
				pst.execute();
				status = "Produto Excluido!!!";
			}catch(SQLException e){
				status = "Produto não Excluido!";
			}
		} catch (SQLException e) {
			status = "erro no preparestatement";
		}
		finally { Util.fecharConexao(conexao); }

		return status;

	}         
	//Pega o código do Produto
	public void GerarCodigo() throws SQLException{
		ResultSet rs = null;
		long codigo = 0;
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement("SELECT nextval('sq_produto');");
			pstmt.clearParameters();
			rs = pstmt.executeQuery(); 
			if(rs!= null){ 
				while(rs.next()){
					codigo = rs.getLong("nextval");
					this.setCodigo(codigo);
				}                     
			}
		}
		catch(SQLException Erro){throw new SQLException(Erro.getMessage());}
		finally { Util.fecharConexao(conexao); }
	}
	
	//Pega dados dos campos da base para montar o formulário
	public Vector MontaForm(String sSql, long cod) throws SQLException{
		DetalhesEspecificos det = new DetalhesEspecificos();
		Vector<Object> campos = new Vector<Object>();
		if("tipoproduto".equals(sSql)){
			campos = det.listarTipos();
		}else if("genero".equals(sSql)){
			campos = det.listarGeneros(cod);
		}else if("categoria".equals(sSql)){
			campos = det.listarCategorias(cod);
		}else if("caracteristicas".equals(sSql)){
			return det.listaCaracteristicas(cod);
		}
		
		return campos;
	}
	//Buscar Produtos Por Código
	public Produto buscarporcodigo(long iCodigo) throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = null;
		PreparedStatement pstmt = null;
		conexao = Util.getConexao();
		Produto oProduto = new Produto();
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
				sSQL = sSQL +  "	,t._descricao as _desc_tipoproduto ";
				sSQL = sSQL +  "	,i._url";
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	left join promocao as pr on pr._produto = p._codigo	";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where p._codigo = ?";
				sSQL = sSQL +  "  order by p._titulo";
				 
				pstmt = conexao.prepareStatement(sSQL);
				pstmt.setLong(1, iCodigo);
				
				rs = (ResultSet) pstmt.executeQuery();
			
				while(rs.next())
				{
					oProduto.setCodigo(rs.getLong("_codigo"));
					oProduto.setTitulo(rs.getString("_titulo"));
					oProduto.setPeso(rs.getDouble("_pesokg"));
					oProduto.setValor(rs.getFloat("_valor"));
					try {
						rs.getString("_valorpromocinal");
						oProduto.setValorPromocional(rs.getFloat("_valorpromocinal"));
					}
					catch (NullPointerException e) { }
						
					oProduto.setUnidade(rs.getString("_unidade"));
					oProduto.setIpi(rs.getInt("_ipi"));
					oProduto.setIcms(rs.getInt("_icms"));
					oProduto.setClassfiscal(rs.getString("_classfiscal"));
					oProduto.setProcedencia(rs.getString("_procedencia"));
					oProduto.setPaisorigem(rs.getString("_paisorigem"));
					oProduto.setAnolancamento(rs.getInt("_anolancamento"));
					oProduto.setAutorartista(rs.getString("_autorartista"));
					oProduto.setIdioma(rs.getString("_idioma"));
					oProduto.setTipoproduto(rs.getLong("_tipoproduto"));
					oProduto.setGenero(rs.getLong("_genero"));
					oProduto.setCategoria(rs.getLong("_categoria"));
					oProduto.setFornecedor(rs.getLong("_fornecedor"));
					oProduto.setResumo(rs.getString("_resumo"));
					oProduto.setVendas(rs.getInt("_vendas"));
					oProduto.setVisitas(rs.getInt("_visitas"));		
					oProduto.setDescricao_tipoproduto(rs.getString("_desc_tipoproduto"));
					oProduto.setDescricao_categoria(rs.getString("_desc_categoria"));
					oProduto.setDescricao_genero(rs.getString("_desc_genero"));
					
					oProduto.setDetalhesEspecificos(DetalhesEspecificos.BuscarDetalhes(oProduto.getCodigo()));
					
					//Insere Avaliações
					oProduto.setAvaliacoes(Avaliacao.ListarAvaliacoes(oProduto.getCodigo()));					
					
					//Se existe Imagem Cadastrada setar a propriedade senão setar url padrão
					if(rs.getString("_url")!= null) oProduto.setURLImagem(rs.getString("_url"));
					else  oProduto.setURLImagem("./imgs/produtos/1_1.jpg");
															 
			}
		}// FInal do TRY

		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		return oProduto ;
	}

	//Buscar Produtos Mais Visitados
	public Vector<Produto> ListarMaisVisitados() throws SQLException,Exception
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
				sSQL = sSQL +  "	left outer join promocao as promo on promo._produto = p._codigo ";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	";
				sSQL = sSQL +  "	promo._codigo is null and";
				sSQL = sSQL +  "	(p._status = true)	"; 
				sSQL = sSQL +  "  order by p._visitas desc";
				sSQL = sSQL +  " LIMIT 10";
				
				 
				pstmt = conexao.prepareStatement(sSQL);
				
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
		
	}
	
	//Buscar Produtos Mais Vendidos
	public Vector<Produto> ListarMaisVendidos() throws SQLException,Exception
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
				sSQL = sSQL +  "	,t._descricao as _desc_tipoproduto ";
				sSQL = sSQL +  "	,i._url";
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	left outer join promocao as promo on promo._produto = p._codigo ";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	";
				sSQL = sSQL +  "	promo._codigo is null and";
				sSQL = sSQL +  "	(p._status = true)	"; 
				sSQL = sSQL +  "  order by p._vendas desc";
				sSQL = sSQL +  " LIMIT 10";				
				 
				pstmt = conexao.prepareStatement(sSQL);
				
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
					item.setDescricao_tipoproduto(rs.getString("_desc_tipoproduto"));
					item.setDescricao_genero(rs.getString("_desc_genero"));
					
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
	}
	
	//Buscar Lancamentos
	public Vector<Produto> ListarLancamentos() throws SQLException,Exception
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
				sSQL = sSQL +  "	,t._descricao as _desc_tipoproduto ";
				sSQL = sSQL +  "	,i._url";
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	p._codigo not in (select _produto from promocao)	 and ";
				sSQL = sSQL +  "	(p._status = true)	"; 
				sSQL = sSQL +  "  order by p._anolancamento desc";
				sSQL = sSQL +  " LIMIT 10";				
				 
				pstmt = conexao.prepareStatement(sSQL);
				
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
					item.setDescricao_tipoproduto(rs.getString("_desc_tipoproduto"));
					item.setDescricao_genero(rs.getString("_desc_genero"));
					
					
					
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
	}
	
	//Buscar Promocoes
	public Vector<Produto> ListarProdutosEmPromocoes() throws SQLException,Exception
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
				sSQL = sSQL +  "	,t._descricao as _desc_tipoproduto ";
				sSQL = sSQL +  "	,i._url";
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	inner join promocao as pr on pr._produto = p._codigo	";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	";
				sSQL = sSQL +  "	(p._status = true)	"; 
				sSQL = sSQL +  "  order by pr._datatermino desc";
				sSQL = sSQL +  " LIMIT 10";				
				 
				pstmt = conexao.prepareStatement(sSQL);
				
				rs = (ResultSet) pstmt.executeQuery();
			
				while(rs.next())
				{
					Produto item = new Produto();
					
					item.setCodigo(rs.getLong("_codigo"));
					item.setTitulo(rs.getString("_titulo"));
					item.setPeso(rs.getFloat("_pesokg"));
					item.setValor(rs.getFloat("_valor"));
					item.setValorPromocional(rs.getFloat("_valorpromocinal"));
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
					item.setDescricao_tipoproduto(rs.getString("_desc_tipoproduto"));
					item.setDescricao_genero(rs.getString("_desc_genero"));
					
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
	}
	
	
	//Atualizar V
	public void AtualizarVisitas(Short iCod) throws SQLException
	{
		Connection conexao = Util.getConexao( );
		try
		{
			Produto _Prod = (Produto) this.buscarporcodigo(iCod); 
			
			int sAcessos = _Prod.getVisitas();
			
			//Monta Query
			String sSQL = "update produtos set _visitas = ? where _codigo = ?";			
			sAcessos++;
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters( );
			pstmt.setInt(1,sAcessos);
			pstmt.setShort(2,iCod);			
			pstmt.executeUpdate();
		}// FInal do TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
	}// Fim do MÃ©todo

	
	//Totais de Produtos Cadastrados
	public Integer TotaldeProdutos() throws SQLException
	{
		Connection conexao = Util.getConexao( );
		try
		{	//Monta Query
			String sSQL = "select count(*) as total from produtos";
			
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			ResultSet rs = (ResultSet)pstmt.executeQuery();
			
			while(rs.next())
			{
				return rs.getInt("total");			
			}
			
		}// FInal do TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		
		return 0;
		
	}// Fim do MÃ©todo

	/** 
	 *Método Utilizado para Buscar Produtos
	 *	Titulo - Titulo do Produto
	 *	TipoProduto - Código do tipo de produto (0 para todos)
	 ** */
	public Vector<Produto> BuscarProdutos(String ParamBusca,int TipoProduto) throws SQLException,Exception
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
				sSQL = sSQL +  "	,t._descricao as _desc_tipoproduto ";
				sSQL = sSQL +  "	,i._url";
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	left join promocao as pr on pr._produto = p._codigo	";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	";
				sSQL = sSQL +  "	(p._status = true)	"; 
				sSQL = sSQL +  "	and (p._tipoproduto = ? or ? = 0)	";
				sSQL = sSQL +  "	and ((p._titulo ilike '%" + ParamBusca +"%')	";
				sSQL = sSQL +  "	or (p._autorartista ilike '%" + ParamBusca +"%'))";
				sSQL = sSQL +  "  order by p._titulo";
				 
				pstmt = conexao.prepareStatement(sSQL);
				pstmt.setInt(1, TipoProduto);
				pstmt.setInt(2, TipoProduto);
				
				rs = (ResultSet) pstmt.executeQuery();
			
				while(rs.next())
				{
					Produto item = new Produto();
					
					item.setCodigo(rs.getLong("_codigo"));
					item.setTitulo(rs.getString("_titulo"));
					item.setPeso(rs.getFloat("_pesokg"));
					item.setValor(rs.getFloat("_valor"));
					
					try {
						rs.getString("_valorpromocinal");
						item.setValorPromocional(rs.getFloat("_valorpromocinal"));
					}
					catch (NullPointerException e) { }
					
					
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
					item.setDescricao_tipoproduto(rs.getString("_desc_tipoproduto"));
					item.setDescricao_categoria(rs.getString("_desc_categoria"));
					item.setDescricao_genero(rs.getString("_desc_genero"));
					
					item.setDetalhesEspecificos(DetalhesEspecificos.BuscarDetalhes(item.getCodigo()));
					
					item.setAvaliacoes(Avaliacao.ListarAvaliacoes(item.getCodigo()));
										
					//Se existe Imagem Cadastrada setar a propriedade senão setar url padrão
					if(rs.getString("_url")!= null) item.setURLImagem(rs.getString("_url"));
					else  item.setURLImagem("./imgs/produtos/1_1.jpg");
										
					_ListaProdutos.addElement(item);
				}
			
			
		}//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	      catch (Exception erro){throw new Exception(erro.getMessage());}	
	      finally { Util.fecharConexao(conexao); }
		 
		 
		return _ListaProdutos;
	}
	
		
	/**
	 * Método Utilizado para Retornar a pesquisa
	 * 
	 * @param Titulo do Produto (so usado se for e/ou com tipo de produto)
	 * @param TipoBusca			
	 * 			Cada Código inserido diferenciará a pesquisa
	 * 			sendo que 999999 é usado para Mais Vendidos
	 * 					  999998 é usado para Mais Visitados
	 * 					  999997 é usado para Lançamentos
	 * 					  999996 é usado para Promoções	
	 * 						   0 é usado para buscar produto em todas as lojas
	 * 					  outros código serão os códigos dos tipos de produtos
	 * @return	Lista de Produtos
	 * @throws SQLException
	 * @throws Exception
	 */
	public Vector<Produto> RetornarBuscarProdutos(String Titulo,int TipoBusca) throws SQLException,Exception
	{		
		Vector<Produto> _ListaProdutos = new Vector<Produto>(); 
		
		 try {	
			 //Verifica tipo de Busca
			 if(TipoBusca == 999999)
			 {
				//Mais Vendidos
				 _ListaProdutos = (Vector<Produto>) ListarMaisVendidos();				 
			 }
			 else if(TipoBusca == 999998)
			 {
				 //Mais Visitados
				 _ListaProdutos = (Vector<Produto>) ListarMaisVisitados();
			 }
			 else if(TipoBusca == 999997)
			 {
				 //Lançamentos
				 _ListaProdutos = (Vector<Produto>) ListarLancamentos();
			 }
			 else if(TipoBusca == 999996)
			 {
				 //Promoções
				 _ListaProdutos = (Vector<Produto>) ListarProdutosEmPromocoes();
			 }
			 else
			 {
				 //Buscar por Tipo de Produto e Título
				 _ListaProdutos = (Vector<Produto>) BuscarProdutos(Titulo, TipoBusca);
			 }
			 
		 }//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	     catch( Exception erro){throw new Exception(erro.getMessage());}	
	     
		 
		return _ListaProdutos;
	}
	

	
	public Vector<Produto> BuscarProdutos(int TipoProduto) throws SQLException,Exception
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
				sSQL = sSQL +  "	,t._descricao as _desc_tipoproduto ";
				sSQL = sSQL +  "	,i._url";
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	";
				sSQL = sSQL +  "	(p._status = true)	"; 
				sSQL = sSQL +  "	and (p._tipoproduto = ? or ? = 0)	";
				sSQL = sSQL +  "  order by p._titulo";
				 
				pstmt = conexao.prepareStatement(sSQL);
				pstmt.setInt(1, TipoProduto);
				pstmt.setInt(2, TipoProduto);
				
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
					item.setDescricao_tipoproduto(rs.getString("_desc_tipoproduto"));
					item.setDescricao_categoria(rs.getString("_desc_categoria"));
					item.setDescricao_genero(rs.getString("_desc_genero"));
					
					item.setDetalhesEspecificos(DetalhesEspecificos.BuscarDetalhes(item.getCodigo()));
					
					item.setAvaliacoes(Avaliacao.ListarAvaliacoes(item.getCodigo()));
										
					//Se existe Imagem Cadastrada setar a propriedade senão setar url padrão
					if(rs.getString("_url")!= null) item.setURLImagem(rs.getString("_url"));
					else  item.setURLImagem("./imgs/produtos/1_1.jpg");
										
					_ListaProdutos.addElement(item);
				}
			
			
		}//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	      catch (Exception erro){throw new Exception(erro.getMessage());}	
	      finally { Util.fecharConexao(conexao); }
		 
		 
		return _ListaProdutos;
	}
	
	public Vector<Produto> BuscarProdutosSMS(String ParamBusca,int TipoProduto) throws SQLException,Exception
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
				sSQL = sSQL +  "	,t._descricao as _desc_tipoproduto ";
				sSQL = sSQL +  "	,i._url";
				sSQL = sSQL +  " from produtos as p	";
				sSQL = sSQL +  "	inner join genero as g on g._codigo = p._genero	";
				sSQL = sSQL +  "	inner join categoria as c on c._codigo = p._categoria	";
				sSQL = sSQL +  "	inner join tipoproduto as t on t._codigo = g._tipoproduto	";
				sSQL = sSQL +  "	inner join estoque as est on est._produto = p._codigo	";
				sSQL = sSQL +  "	left join imagem as i on i._produto = p._codigo	";
				sSQL = sSQL +  "	where	";
				sSQL = sSQL +  "	(p._status = true)	"; 
				sSQL = sSQL +  "	and (p._tipoproduto = ? or ? = 0)	";
				sSQL = sSQL +  "	and (est._quantidadedisponivel >= 1)	";
				sSQL = sSQL +  "	and ((p._titulo ilike '%" + ParamBusca +"%')	";
				sSQL = sSQL +  "	or (p._autorartista ilike '%" + ParamBusca +"%'))";
				sSQL = sSQL +  "  order by p._titulo";
				 
				pstmt = conexao.prepareStatement(sSQL);
				pstmt.setInt(1, TipoProduto);
				pstmt.setInt(2, TipoProduto);
				
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
					item.setDescricao_tipoproduto(rs.getString("_desc_tipoproduto"));
					item.setDescricao_categoria(rs.getString("_desc_categoria"));
					item.setDescricao_genero(rs.getString("_desc_genero"));
					
					item.setDetalhesEspecificos(DetalhesEspecificos.BuscarDetalhes(item.getCodigo()));
					
					item.setAvaliacoes(Avaliacao.ListarAvaliacoes(item.getCodigo()));
										
					//Se existe Imagem Cadastrada setar a propriedade senão setar url padrão
					if(rs.getString("_url")!= null) item.setURLImagem(rs.getString("_url"));
					else  item.setURLImagem("./imgs/produtos/1_1.jpg");
										
					_ListaProdutos.addElement(item);
				}
			
			
		}//Final do try 
		 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	      catch (Exception erro){throw new Exception(erro.getMessage());}	
	      finally { Util.fecharConexao(conexao); }
		 
		 
		return _ListaProdutos;
	}
	
	
	
	
	
	
	
	
	
}// final da classe
	
package ovni.negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ovni.util.Util;

public class Estoque {
	
	private long codigo;
	private long produto;
	private int quantidade;	
	private String sql;
	private Connection conexao;
	private Statement st;
	private ResultSet rs;
	
	/**Métodos de acesso*/
	public long getCodigo() {
		return codigo;
	}
	public void setCodigo(long codigo) {		
		this.codigo = codigo;
	}
	public long getProduto() {
		return produto;
	}
	public void setProduto(long produto) {
		this.produto = produto;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	/**
	 * Este método seta os dados do objeto para cadastro.
	 * @param prod
	 * @param qtd
	 * @throws SQLException
	 */
	public void setDados(long prod, int qtd) throws SQLException{
		this.setProduto(prod);
		this.setQuantidade(qtd);
		this.gerarCodigo();
	}
	/**
	 * Este método gera automaticamente o código do produto no estoque.
	 * @throws SQLException
	 */
	public void gerarCodigo() throws SQLException{
		sql = "select nextval('sq_estoque')";
		conexao = Util.getConexao();
		st = conexao.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()){
			this.setCodigo(rs.getLong("nextval"));
		}
		Util.fecharConexao(conexao);
	}
	/**
	 * Este método cadastra o produto no estoque.
	 * @return
	 * @throws SQLException 
	 */
	public String cadastrarProduto(){
		String msg = null;
		conexao = Util.getConexao();
		sql = "insert into estoque values ( "+
				this.getCodigo()+" , "+
				this.getProduto()+" , "+
				"0 , 0)";
		try {
			st = conexao.createStatement();
			st.execute(sql);
		} catch (SQLException e) {
			msg = e.getMessage();
		}finally{
			Util.fecharConexao(conexao);
		}
		
		return msg;
	}
	/**
	 * Este método da baixa na quantidade em estoque.  
	 * @param cod
	 * @param qtd
	 * @return
	 */
	public String retirarProduto(long cod, int qtd){
		
		String status = null;
		conexao = Util.getConexao();				
		int qtdestoque = 0;
		int qtddisponivel = 0;
		sql = "select _quantidadeestoque, _quantidadedisponivel " +
				"from estoque where _produto = " + cod;		
		try{
			st = conexao.createStatement();
		}catch(SQLException e){

		}try{
			rs = st.executeQuery(sql);
			if(rs.next()){
				qtdestoque = rs.getInt("_quantidadeestoque");
				qtddisponivel = rs.getInt("_quantidadedisponivel");
				if(qtdestoque<qtd){
					status = "Quantidade em estoque insuficiente para"+
					" realizar esta operação";
				}else if(qtddisponivel<qtd){
					status = "Quantidade disponivel em estoque insuficiente para"+
					" realizar esta operação";
				}else{
					qtdestoque = qtdestoque - qtd;
					qtddisponivel = qtddisponivel - qtd;
					sql = "update estoque set " +				
					"_quantidadeestoque =  "+qtdestoque+
					" , _quantidadedisponivel = "+ qtddisponivel +
							" where _produto = "+cod;
					try{
						st.execute(sql);
					}catch(SQLException e){
						status = e.getMessage();
					}
				}
			}else{
				status = "Quantidade insuficiente em estoque!";
			}
		} catch (SQLException e) {
			status = e.getMessage();
		}
		finally { 
			Util.fecharConexao(conexao); 
		}
		return status;
	}
	/**
	 * Este método aumenta a quantidade do produto.
	 * @param cod
	 * @param qtd
	 * @return
	 */
	public String inserirProduto(long cod, int qtd){	
		
		String status = null;
		conexao = Util.getConexao();
		int qtdestoque = 0;
		int qtddisponivel = qtd;
		sql = "select _quantidadeestoque,_quantidadedisponivel from estoque where " +
				"_produto = " + cod;
		try {
			st = conexao.createStatement();
		}catch(SQLException e){

		}try {
			rs = st.executeQuery(sql);
			if(rs.next()){
				qtdestoque = rs.getInt("_quantidadeestoque");
				qtdestoque = qtdestoque + qtd;
				qtddisponivel += rs.getInt("_quantidadedisponivel"); 
				sql = "update estoque set _quantidadeestoque = "+ qtdestoque +
					" , _quantidadedisponivel = "+ qtddisponivel +
					" where _produto = "+cod;
				st.execute(sql);
			}else{
				status = "Produto não cadastrado no estoque!";
			}
		} catch (SQLException e) {
			status = e.getMessage();
		}
		finally { 
			Util.fecharConexao(conexao); 
		}
		return status;	
	}
	
	/**
	 * Método para Verificar a Quantidade Disponivel em Estoque
	 * @param bProduto
	 * @param iQuantidade
	 * @return
	 * @throws Exception
	 */
	public boolean VerificarEstoque(long bProduto, int iQuantidade) throws Exception{
    	ResultSet rs = null;
		Connection conexao = null;
		PreparedStatement pstmt = null;
		conexao = Util.getConexao();
		boolean bEstoque = false;
    	try
	       {
	    		String sSQL = "";
			 	sSQL = sSQL +  "  select ";
				sSQL = sSQL +  "	  est._codigo	";
				sSQL = sSQL +  "	, est._quantidadedisponivel";
				sSQL = sSQL +  " from estoque as est	";
				sSQL = sSQL +  "	where est._produto = ?  ";
				sSQL = sSQL +  "  order by est._codigo";
				 
				pstmt = conexao.prepareStatement(sSQL);
				pstmt.setLong(1, bProduto);					
				rs = (ResultSet) pstmt.executeQuery();
				
				while(rs.next())
				{
					if(rs.getInt("_quantidadedisponivel")>=iQuantidade)
					{
						bEstoque = true;
					}
				}	
	       }
	       	catch (Exception erro){throw new Exception(erro.getMessage());}	
	       	return bEstoque;
	     } 

		/**
		 * Método para Atualizar a Quantidade Disponivel do produto
		 * @param lProduto
		 * @param iQuantidade
		 * @return
		 */
		public String AtualizarQuantidadeDisponivel(long lProduto, int iQuantidade){
		
			String status = null;
			conexao = Util.getConexao();
			int qtddisponivel = 0;
			sql = "select _quantidadeestoque, _quantidadedisponivel " +
				"from estoque where _produto = " + lProduto;		
			try
			{
				st = conexao.createStatement();
			}catch(SQLException e){

			}try{
				rs = st.executeQuery(sql);
				if(rs.next()){
					qtddisponivel = rs.getInt("_quantidadedisponivel");
					if(qtddisponivel<iQuantidade)
					{
						status = "Quantidade disponivel em estoque insuficiente para"+
						" realizar esta operação";
					}else
					{
						qtddisponivel = qtddisponivel - iQuantidade;
						sql = "update estoque set " +	
						"_quantidadedisponivel = "+ qtddisponivel +
							" where _produto = "+lProduto;
					try
					{
						st.execute(sql);
					}catch(SQLException e){
						status = e.getMessage();
					}
				}
			}else{
				status = "Quantidade Disponivel insuficiente em estoque!";
			}
		} catch (SQLException e) {
			status = e.getMessage();
		}
		finally { 
			Util.fecharConexao(conexao); 
		}
		return status;
	}
}

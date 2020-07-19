package ovni.negocio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import ovni.util.Util;
public class Avaliacao {
	//Atributos da Classe
	private long _codigo = 0;
	private long _produto = 0;
	private String _avaliacao = null;;
	private String _usuario = null;

	//Métodos de Acesso
	public long getCodigo() {
		return _codigo;
	}
	public void setCodigo(long _codigo) {
		this._codigo = _codigo;
	}
	public long getProduto() {
		return _produto;
	}
	public void setProduto(long _produto) {
		this._produto = _produto;
	}
	public String getAvaliacao() {
		return _avaliacao;
	}
	public void setAvaliacao(String _avaliacao) {
		this._avaliacao = _avaliacao;
	}
	public String getUsuario() {
		return _usuario;
	}
	public void setUsuario(String _usuario) {
		this._usuario = _usuario;
	}
	
	//Método para gerar Código da próxima avaliação
	public long GerarCodigo(){
		long codigo = 0;
		Connection conexao = Util.getConexao();
		String sql = "SELECT NEXTVAL('SQ_AVALIACAO')";
		ResultSet rs = null; 
		try {
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.clearParameters();
			rs = pst.executeQuery();
			if(rs.next()){
				codigo = rs.getLong("nextval");
			}
		} catch (SQLException e) {

		}
		finally { Util.fecharConexao(conexao); }
		return codigo;
	}	
	//Método para Procurar Avaliação de um Usuário
	public boolean VerificarAvaliacao(long produto,
			long usuario){
		ResultSet rs = null;
		boolean avaliacao = false;
		Connection conexao = Util.getConexao();
		String sql = "SELECT _AVALIACAO FROM AVALIACAO " +
		"WHERE _USUARIO = ? AND _PRODUTO = ?";
		try {
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.clearParameters();
			pst.setLong(1, usuario);
			pst.setLong(2, produto);
			rs = pst.executeQuery();
			if(rs.next()){
				avaliacao = true;
			}
		} catch (SQLException e) {

		}
		finally { Util.fecharConexao(conexao); }

		return avaliacao;
	}
	//Método Para Inserir a Avaliação
	public String Inserir(long usuario, 
			long produto, String descricao){
		String status = null;
		Connection conexao = Util.getConexao();
		String sql = "INSERT INTO AVALIACAO VALUES(" +
		this.GerarCodigo()+","+produto+",'"+descricao+"',"+usuario+")";
		try {
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.clearParameters();
			try{
				pst.execute();
				status = "Avaliação Inserida!!";
			}catch(SQLException e){
				status = "Erro no inserir Avaliação!!";
			}
		} catch (SQLException e) {
			status = "Erro no PreparedStatement!!";
		}
		finally { Util.fecharConexao(conexao); }
		return status;
	}
	//Método para listar Avaliações de um produto!
	public static Vector<Avaliacao> ListarAvaliacoes(long codigo){

		ResultSet rs = null;
		
		Vector<Avaliacao> _ListaAvaliacoes = new Vector<Avaliacao>();
		
		Connection conexao = Util.getConexao();
		String sql = "select a._codigo,a._produto,a._Avaliacao,u._nome "+
							"from Avaliacao as a "+
								"inner join usuario as u on "+ 
									"a._usuario = u._codigo "+
										"where a._produto = ?";
		try {
			
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.clearParameters();
			pst.setLong(1, codigo);
			rs = pst.executeQuery();
			
			//Preeche o Vector de Avaliações
			while(rs.next())
			{
				//Cria um item para a lista
				Avaliacao item = new Avaliacao();
				
				//Seta Valores
				item.setCodigo(rs.getLong("_codigo"));
				item.setProduto(rs.getLong("_produto"));
				item.setAvaliacao(rs.getString("_Avaliacao"));
				item.setUsuario(rs.getString("_nome"));
				
				_ListaAvaliacoes.addElement(item);
				
			}
			
			
						
		} catch (SQLException e) {
			rs = null;
		}
		finally { Util.fecharConexao(conexao); }
		return _ListaAvaliacoes;
	}
}

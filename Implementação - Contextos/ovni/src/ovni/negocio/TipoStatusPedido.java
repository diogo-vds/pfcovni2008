package ovni.negocio;
import ovni.util.Util;
import java.sql.*;

public class TipoStatusPedido {
	//atributos
	public int _codigo;
	public String _descricao;
	
	//Metodos de acesso
	public void setCodigo(int _codigo) {
		this._codigo = _codigo;
	}
	public int getCodigo() {
		return _codigo;
	}
	public void setDescricao(String _descricao) {
		this._descricao = _descricao;
	}
	public String getDescricao() {
		return _descricao;
	}
	
	public TipoStatusPedido( )
	{	}
	
	public TipoStatusPedido listarPorCodigo (int codigo) throws SQLException
	{
		TipoStatusPedido lista = new TipoStatusPedido ();
		
		String sql = "SELECT _codigo, _descricao FROM tipostatuspedido WHERE _codigo = ?";
		ResultSet rs = null;
		Connection conexao = Util.getConexao();
		try{
			PreparedStatement pstmt = conexao.prepareStatement(sql);
			pstmt.setInt(1, codigo);
			rs = pstmt.executeQuery();
		}//FINAL DO TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		
		rs.next();		
		lista.setCodigo(rs.getInt("_codigo"));
		lista.setDescricao(rs.getString("_descricao"));		
		
		return lista;		
	}
	
	public ResultSet retornarTipos( ) throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao();
		try{			
			PreparedStatement pstmt = conexao.prepareStatement("Select _codigo, _descricao from TIPOSTATUSPEDIDO");
			rs = pstmt.executeQuery();
		}
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		return rs;
	}//final do retornarTipos
	
	public ResultSet retornarTipoPorCodigo(int iCodigo ) throws SQLException
	{
		ResultSet rs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS CodStatus");
		sSQL.append(" , _descricao AS DescStatus");
		sSQL.append(" FROM tipostatuspedido");
		sSQL.append(" WHERE _codigo = ");
		sSQL.append(iCodigo);
		Connection conexao = Util.getConexao();
		try{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			rs = pstmt.executeQuery();
		}//FINAL DO TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		return rs;
	}//final do retornarTipoPorCodigo
	
	public ResultSet retornarTipoPorDescricao(String sDescricao ) throws SQLException
	{
		ResultSet rs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS CodStatus");
		sSQL.append(" , _descricao AS DescStatus");
		sSQL.append(" FROM tipostatuspedido");
		sSQL.append(" WHERE _descricao = '");
		sSQL.append(sDescricao);
		sSQL.append(" '");
		Connection conexao = Util.getConexao();
		try{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			rs = pstmt.executeQuery();
		}//FINAL DO TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		return rs;
	}//final do retornarTipoPorCodigo

}//final da classe

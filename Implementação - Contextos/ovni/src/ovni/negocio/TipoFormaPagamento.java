package ovni.negocio;
import ovni.util.Util;
import java.sql.*;
import java.util.*;

public class TipoFormaPagamento {
	//atributos
	private int _codigo;
	private String _descricao;
	private float _taxa;
	private boolean _ativo;
	private boolean _tef;
	
	//Metodos de acesso
	public void setCodigo(int iCodigo) {
		this._codigo = iCodigo;
	}
	public int getCodigo() {
		return _codigo;
	}
	public void setDescricao(String sDescricao) {
		this._descricao = sDescricao;
	}
	public String getDescricao() {
		return _descricao;
	}
	
	public void setTaxa(float sMensagem)
	{
		this._taxa = sMensagem;	
	}
	public float getTaxa() {
		return this._taxa;
	}	
	
	public void setAtivo (boolean bool){
		this._ativo = bool;
	}
	
	public boolean isAtivo ( ){
		if (this._ativo == true)
			return true;
		else
			return false;
	}
	
	public void setTEF(boolean bool ){
		this._tef = bool;
	}
	
	public boolean isTEF(){
		if (this._tef == true)
			return true;
		else
			return false;
	}
	
	
	public TipoFormaPagamento( )
	{	}
	
	public Vector<TipoFormaPagamento> retornarTipos(String sParametroConsulta, String sTipoConsulta, boolean bAtivo) throws SQLException
	{
		Vector<TipoFormaPagamento> retorno = new Vector<TipoFormaPagamento>();
		
		ResultSet rs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS CodPagamento");
		sSQL.append(" , _descricao AS DescPagamento");
		sSQL.append(" , _taxa AS Taxa");
		sSQL.append(" , _ativo AS Ativo");
		sSQL.append(" , _tef AS TEF");
		
		if (bAtivo)
			sSQL.append(" WHERE _ativo = TRUE");
		
		if (sTipoConsulta.equals("Codigo"))
		{
			sSQL.append(" AND _codigo = ");
			sSQL.append(sParametroConsulta);
		}	
		if (sTipoConsulta.equals("Descricao"))
		{
			sSQL.append(" AND _descricao = ");
			sSQL.append(sParametroConsulta);
		}			
		sSQL.append(" FROM tipoformapagamento");
		sSQL.append(" ORDER BY _codigo ASC");
		Connection conexao = Util.getConexao();
		try{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			rs = pstmt.executeQuery();
		}//FINAL DO TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
	
		while (rs.next())
		{
			TipoFormaPagamento pgto = new TipoFormaPagamento( );
			pgto.setCodigo(Integer.parseInt(rs.getString("CodPagamento")));
			pgto.setDescricao(rs.getString("DescPagamento"));
			pgto.setTaxa(Float.parseFloat(rs.getString("Taxa")));
			pgto.setAtivo(rs.getBoolean("ativo"));
			pgto.setTEF(rs.getBoolean("TEF"));
			retorno.addElement(pgto);
		}	
		return retorno;
	}
	
	
	public Vector<TipoFormaPagamento> listar(boolean bAtivo) throws SQLException
	{
		Vector<TipoFormaPagamento> lista = new Vector<TipoFormaPagamento>();
				
		ResultSet rs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS CodPagamento");
		sSQL.append(" , _descricao AS DescPagamento");
		sSQL.append(" , _taxa AS Taxa");
		sSQL.append(" , _ativo AS Ativo");
		sSQL.append(" , _tef AS TEF");
		sSQL.append(" FROM tipoformapagamento");
		if (bAtivo)
			sSQL.append(" WHERE _ativo = TRUE");
		sSQL.append(" ORDER BY _codigo ASC");
		Connection conexao = Util.getConexao();
		try{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			rs = pstmt.executeQuery();
		}//FINAL DO TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		
		while (rs.next())
		{
			TipoFormaPagamento pgto = new TipoFormaPagamento( );
			pgto.setCodigo(Integer.parseInt(rs.getString("CodPagamento")));
			pgto.setDescricao(rs.getString("DescPagamento"));
			pgto.setTaxa(Float.parseFloat(rs.getString("Taxa")));
			pgto.setAtivo(rs.getBoolean("ativo"));
			pgto.setTEF(rs.getBoolean("TEF"));
			lista.addElement(pgto);
		}
		return lista;
	}//final do retornarTipos
	
	public TipoFormaPagamento retornarFormaPGTOporCodigo(int iCodigo ) throws SQLException
	{
		TipoFormaPagamento pgto = new TipoFormaPagamento( );
		
		ResultSet rs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS CodPagamento");
		sSQL.append(" , _descricao AS DescPagamento");
		sSQL.append(" , _taxa AS Taxa");
		sSQL.append(" , _ativo AS Ativo");
		sSQL.append(" , _tef AS TEF");
		sSQL.append(" FROM tipoformapagamento");
		sSQL.append(" WHERE _codigo = ?");
		Connection conexao = Util.getConexao();
		try
			{
				PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
				pstmt.setInt(1, iCodigo);
				rs = pstmt.executeQuery();
			}
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		
		while (rs.next())
		{			
			pgto.setCodigo(rs.getInt("CodPagamento"));
			pgto.setDescricao(rs.getString("DescPagamento"));
			pgto.setTaxa(Float.parseFloat(rs.getString("Taxa")));
			pgto.setAtivo(rs.getBoolean("ativo"));
			pgto.setTEF(rs.getBoolean("TEF"));
		}			
		
		return pgto;
	}//final do retornarFormaPGTOporCodigo
	
	public TipoFormaPagamento retornarFormaPGTOporDescricao(String sDescricao) throws SQLException
	{
		ResultSet rs = null;
		TipoFormaPagamento pgto;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS CodPagamento");
		sSQL.append(" , _descricao AS DescPagamento");
		sSQL.append(" FROM tipoformapagamento");
		sSQL.append(" WHERE _descricao = ?");
		Connection conexao = Util.getConexao();
		pgto = new TipoFormaPagamento();
		try{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.setString(1, sDescricao);
			rs = pstmt.executeQuery();
			while (rs.next())
			{				
				pgto.setCodigo(rs.getInt("CodPagamento"));
				pgto.setDescricao(rs.getString("DescPagamento"));				
			}
		}//FINAL DO TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		return pgto;
	}//final do retornarFormaPGTOporDescricao	
}//final da classe


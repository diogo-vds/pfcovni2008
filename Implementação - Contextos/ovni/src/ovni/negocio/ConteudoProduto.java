package ovni.negocio;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import ovni.util.Util;

public class ConteudoProduto {
	//String da Classe
	long codigo =0;  
	long produto =0;  
	long caracttipoproduto =0; 
	String descricao;
	//Atributos de conexão
	PreparedStatement pstmt = null;
	Statement st = null;
	ResultSet rs = null;	

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
	public long getCaracttipoproduto() {
		return caracttipoproduto;
	}
	public void setCaracttipoproduto(long caracttipoproduto) {
		this.caracttipoproduto = caracttipoproduto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}	
	//	Inserir Conteudo Especifico do Produto
	public boolean Inserir(){
		boolean status = false;
		Connection conexao = Util.getConexao();
		Statement st = null;
		try {
			st = conexao.createStatement();
		} catch (SQLException e1) {
		}		
		String sql = "INSERT INTO CONTEUDOPRODUTO VALUES(" +
			getCodigo()+","+getProduto()+"," +
			getCaracttipoproduto()+",'"+getDescricao()+"');";
		try {
			st.execute(sql);
			status = true;
		} catch (SQLException e) {
			status = false;
		}
		finally { Util.fecharConexao(conexao); }
		return status;
	}	
	//Método para Busca Por Código
	public ResultSet buscaCodigo(long codigo) throws SQLException{
		Connection conexao = Util.getConexao();
		try
		{
			Statement st = conexao.createStatement();
			String sql = "select * from conteudoproduto where" +
			" _produto = "+codigo;
			PreparedStatement pstmt= conexao.prepareStatement(sql);
			pstmt.clearParameters();
			rs = st.executeQuery(sql);
		}
		catch(SQLException erro){ throw new SQLException(erro.getMessage());}
		finally { Util.fecharConexao(conexao); }
		return rs;
	}	
	//Método para gerar código
	public long gerarCodigo() throws SQLException, Exception
	{
		Connection conexao = Util.getConexao();
		ResultSet rs = null;
		long Codigo = 0;
		try{			
			pstmt = conexao.prepareStatement("SELECT nextval('sq_conteudoproduto');");
			pstmt.clearParameters();
			rs = pstmt.executeQuery();
			if(rs!= null){ 
				while(rs.next()) 
				{
					Codigo =(long) rs.getInt("nextval");
				}                     
			}
		}catch( SQLException erro){ 
			Codigo = 0;
		}
		finally { Util.fecharConexao(conexao); }
		return Codigo;
	}

	//Método Para excluir conteúdo
	public boolean excluirConteudo(long codigo){
		boolean status = false;
		return status;
	}
}

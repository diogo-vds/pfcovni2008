package ovni.negocio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import ovni.util.Util;

public class Atendimento  
{
		/** Atributos da Classe */
		private long _codigo = 0;
		private String _avaliacao = null;;
		private long _usuario = 0;	

		/** Construtor Vazio de AvaliarAtendimento */
	    public Atendimento() {
	    }
	    
	    /** M�todos de Acesso */
		public long getCodigo() 
		{	return _codigo;		}
		public void setCodigo(long lCodigo) 
		{	this._codigo = lCodigo;		}
		
		public String getAvaliacao() 
		{	return _avaliacao;		}
		public void setAvaliacao(String sAvaliacao) 
		{	this._avaliacao = sAvaliacao;		}
		
		public long getUsuario() 
		{	return _usuario;		}
		public void setUsuario(long lUsuario) 
		{	this._usuario = lUsuario;	}
		
	    
	    /** M�todos de Neg�cio */
	    public void InserirAvaliacao() throws SQLException, Exception{
	    try
	       {
				Operacao("I"); 
	       }
	       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
	     }    
	    
	 // Realiza Opera��o desejada no Banco de Dados
	     public void Operacao(String sTipo) throws SQLException, Exception{
	     Connection conexao = Util.getConexao();  
	     try
	       {
	 	
	        CallableStatement cs;
	 		cs = conexao.prepareCall("{ ? = call operacao_avaliaratendimento(?,?,?,?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, sTipo);
			cs.setLong(3, this.getCodigo());
			cs.setString(4, this.getAvaliacao());
			cs.setLong(5, this.getUsuario());
	 		cs.execute();
	 		String sStatus = cs.getString(1);
	 		cs.close(); 		
	       }
	        catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
		    finally { Util.fecharConexao(conexao); }
	     }
	     
	     
	     /** M�todo para buscar todos Fornecedores */
	 	public ResultSet BuscarTodasAvaliacoes() throws SQLException
	 	{
	 		ResultSet rs = null;
	 		Connection conexao = Util.getConexao( );
	                 /** Inicio do Try */
	 		try
	 		{		
	 			/** Monta a Query */			                   
	 			String sSQL = "";
	            sSQL = sSQL +  "     select                                     ";
	 			sSQL = sSQL +  "     a._avaliacao as Descricao                        ";
	 			sSQL = sSQL +  "    ,a._dataavaliacao as DataAvaliacao            ";
	 			sSQL = sSQL +  "    ,u._nome as Nome              ";
	 			sSQL = sSQL +  "    from avaliaratendimento as a                      ";
	 			sSQL = sSQL +  "   	inner join usuario as u on a._usuario = u._codigo";
	            sSQL = sSQL +  "    order by u._nome;                     ";
	 			
	 			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
	 			rs = pstmt.executeQuery();
	 		}/** Final do Try */ 
	 		catch( SQLException erro)
	                     { throw new SQLException(erro.getMessage() ); }
	 		finally {Util.fecharConexao(conexao);}
	 		return rs ;		
	 	}    
}


package ovni.negocio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import ovni.util.Util;

public class AvaliarAtendimento  
{
		/** Atributos da Classe */
		private long _codigo = 0;
		private String _avaliacao = null;;
		private long _usuario = 0;	

		/** Construtor Vazio de AvaliarAtendimento */
	    public AvaliarAtendimento() {
	    }
	    
	    /** Métodos de Acesso */
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
		
	    
	    /** Métodos de Negócio */
	    public void InserirAvaliacao() throws SQLException, Exception{
	    try
	       {
				Operacao("I"); 
	       }
	       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
	     }    
	    
	 // Realiza Operação desejada no Banco de Dados
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
}


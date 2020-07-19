package ovni.negocio;

import ovni.util.Util;
import java.sql.*;
import java.util.Vector;

public class TipoEndereco {
    
    /** Atributos da Classe */
    private short _Codigo = 0;
    private String _Descricao;
    private String _Status;
          
    /** Mï¿½todos de Acesso */
    public short getCodigo() {
        return _Codigo;
    }
    public void setCodigo(short Codigo) {
        this._Codigo = Codigo;
    }
    
    public String getDescricao() {
        return _Descricao;
    }
    public void setDescricao(String Descricao) {
        this._Descricao = Descricao;
    }
            
    public String getStatus() {
        return _Status;
    }
    public void setStatus(String Status) {
        this._Status = Status;
    }
	
	 /** Mï¿½todos de Negï¿½cio */
    public void InserirTipoEndereco() throws SQLException, Exception{
    try
       {
			Operacao("I"); 
       }
       catch(Exception ex)
       {
            throw new Exception(ex.getMessage());
       }
     }    
     
     public void AtualizarTipoEndereco() throws SQLException, Exception{
     try
       {
			Operacao("A"); 
       }
       catch(Exception ex)
       {
            throw new Exception(ex.getMessage());
       }      
     }   
     
     public void ExcluirTipoEndereco() throws SQLException, Exception{
     try
       {
			Operacao("E");  
       }
       catch(Exception ex)
       {
            throw new Exception(ex.getMessage());
       }       
     }       

     // Realiza Operaï¿½ï¿½o desejada no Banco de Dados
     public void Operacao(String Tipo) throws SQLException, Exception{
    	 Connection conexao = Util.getConexao();
     try
       {
           	
        CallableStatement cs;
 		cs = conexao.prepareCall("{ ? = call operacao_TipoEndereco(?,?,?,?)}");
		cs.registerOutParameter(1, Types.VARCHAR);
		cs.setString(2, Tipo);
		cs.setShort(3, this.getCodigo());
        cs.setString(4, this.getDescricao());
 		cs.execute();
 		String Status = cs.getString(1);
 		setStatus(Status);
 		cs.close(); 
       }
       		catch(Exception ex)
       {
            throw new Exception(ex.getMessage());
       }      
       		finally { Util.fecharConexao(conexao); }
     }
	
	 //Buscar Produtos Titulo
	 public Vector<TipoEndereco> BuscarTodosTipos() throws SQLException
	 {
		Vector<TipoEndereco> vctTipoEndereco = new Vector<TipoEndereco>();
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		try
		{
			
			PreparedStatement pstmt = conexao.prepareStatement("SELECT _codigo as codigo, _descricao as descricao FROM TipoEndereco order by _codigo");
			pstmt.clearParameters();
			rs = pstmt.executeQuery(); 
			
			while(rs.next())
			{
				//Cria uma instância de Produtos
				TipoEndereco _item = new TipoEndereco();
				_item.setCodigo(rs.getShort("codigo"));
				_item.setDescricao(rs.getString("descricao"));
				
				//Insere um novo tipo de produto
				vctTipoEndereco.addElement(_item);
			}
			
		}// FInal do TRY

		catch( SQLException erro)
		{ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }		
		return vctTipoEndereco ;
	}
}

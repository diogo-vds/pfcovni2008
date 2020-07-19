package ovni.negocio;
import ovni.util.Util;
import java.io.*;
import java.sql.*;
import java.math.*; 
import java.util.Vector;

/**
 *
 * @author Pheyjao
 */
public class TipoProduto {
    
    /** Atributos da Classe */
    private short _Codigo = 0;
    private String _Descricao;
    private String _Status;
    
    /** Construtor Vazio de TipoProduto */
    public TipoProduto() {
    }
       
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
    public void InserirTipoProduto() throws SQLException, Exception{
    try
       {
			Operacao("I"); 
       }
       catch(Exception ex)
       {
            throw new Exception(ex.getMessage());
       }
     }    
     
     public void AtualizarTipoProduto() throws SQLException, Exception{
     try
       {
			Operacao("A"); 
       }
       catch(Exception ex)
       {
            throw new Exception(ex.getMessage());
       }      
     }   
     
     public void ExcluirTipoProduto() throws SQLException, Exception{
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
 		cs = conexao.prepareCall("{ ? = call operacao_TipoProduto(?,?,?,?)}");
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
     
     //Buscar Produtos Por Cï¿½digo
	 public Vector<TipoProduto> BuscarPorCodigo(Short iCod) throws SQLException
	 {
		Vector<TipoProduto> _TiposProdutosLista = new Vector<TipoProduto>();
		 
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		try
		{
			
			PreparedStatement pstmt = conexao.prepareStatement("SELECT _codigo as codigo, _descricao as descricao FROM TipoProduto WHERE _CODIGO = ?");
			pstmt.clearParameters( );
			pstmt.setShort(1, iCod);
			rs = pstmt.executeQuery( );
			
			while(rs.next())
			{
				//Cria uma instância de Produtos
				TipoProduto _item = new TipoProduto();
				_item.setCodigo(rs.getShort("codigo"));
				_item.setDescricao(rs.getString("descricao"));
				
				//Insere um novo tipo de produto
				_TiposProdutosLista.addElement(_item);
			}
			
		}// FInal do TRY

		catch( SQLException erro)
		{ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }

		return _TiposProdutosLista ;
	 }
	
	 //Buscar Produtos Titulo
	 public Vector<TipoProduto> BuscarTodosTipos() throws SQLException
	 {
		Vector<TipoProduto> _TiposProdutosLista = new Vector<TipoProduto>();
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		try
		{
			
			PreparedStatement pstmt = conexao.prepareStatement("SELECT _codigo as codigo, _descricao as descricao FROM TipoProduto order by _codigo");
			pstmt.clearParameters();
			rs = pstmt.executeQuery(); 
			
			while(rs.next())
			{
				//Cria uma instância de Produtos
				TipoProduto _item = new TipoProduto();
				_item.setCodigo(rs.getShort("codigo"));
				_item.setDescricao(rs.getString("descricao"));
				
				//Insere um novo tipo de produto
				_TiposProdutosLista.addElement(_item);
			}
			
		}// FInal do TRY

		catch( SQLException erro)
		{ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		
		return _TiposProdutosLista ;
	}
}
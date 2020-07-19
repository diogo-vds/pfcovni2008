package ovni.negocio;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

import ovni.util.Util;

public class Item {

	protected Produto _Produto;	
	protected int _Quantidade ;
	protected float _ValorItem;
	
	public void setProduto( Produto oProduto)
	{ this._Produto = oProduto ; }
	public Produto getProduto( )
	{ return this._Produto ; }

	public void setQuantidade(int iQuantidade)
	{ this._Quantidade = iQuantidade; }
	public int getQuantidade( )
	{ return this._Quantidade;}

	public void setValorItem( float fValor)
	{ this._ValorItem = fValor ; }   
	public float getValorItem( )
	{ return this._ValorItem ; }
	
	public void calcularValorItem(  )
	{ 
		if (this._Produto.getValorPromocional() != 0)
			setValorItem( this._Produto.getValorPromocional() * this._Quantidade);			
		else
			setValorItem( this._Produto.getValor( ) * this._Quantidade ) ;
		
	}
	
	public void addProduto(Produto oProduto, int iQuantidade)
	{
		setProduto(oProduto);
		setQuantidade(iQuantidade);
		calcularValorItem();		
	}
	
	public void alterarQuantidade(int iQuantidade)
	{
		setQuantidade(iQuantidade);
		calcularValorItem();
	}
	
	public Vector<Item> listarItensPedido(long Codigo) throws SQLException
	{
		Vector<Item> lista = new Vector<Item>();
		String sqlItem = "SELECT _produto, _quantidade, _valortotal FROM item WHERE _pedidodesktopwap = ?;";
		String sqlProduto = "SELECT _titulo FROM produtos WHERE _codigo = ?;";

		ResultSet oRs = null;		
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmtItem = conexao.prepareStatement(sqlItem);
			pstmtItem.setLong(1, Codigo);
			oRs = pstmtItem.executeQuery();			
			while (oRs.next())
			{
				Item item = new Item();
				item.setQuantidade(oRs.getInt("_quantidade"));
				item.setValorItem(oRs.getFloat("_valortotal"));
				
				ResultSet oRsProduto = null;
				PreparedStatement pstmtProduto = conexao.prepareStatement(sqlProduto);
				pstmtProduto.setLong(1, oRs.getLong("_produto"));
				oRsProduto = pstmtProduto.executeQuery();
				oRsProduto.next();
				Produto produto = new Produto();
				produto.setTitulo(oRsProduto.getString("_titulo"));
				item.setProduto(produto);
				
				lista.add(item);
			}			
		}
		catch (SQLException e) { throw e ;}
		
		return lista;		
	}
	
	
	public ResultSet retornarItensPedido(long Codigo)throws SQLException
	{
		ResultSet oRs = null;
		Connection conexao = Util.getConexao();
			StringBuilder sSQL = new StringBuilder("SELECT");
			//Diogo - Adicionado o código ao retorno para 
			//implementação do caso de uso enviar pedido.
			sSQL.append(" p._codigo AS Codigo, ");			
			sSQL.append(" p._titulo AS Produto");
			sSQL.append(" , p._valor AS PrecoUnitario");
			sSQL.append(" , i._quantidade AS Quantidade");
			sSQL.append(" , i._valortotal AS Total");
			sSQL.append(" FROM");
			sSQL.append(" item AS i INNER JOIN produtos AS p ON");
			sSQL.append(" p._codigo = i._produto");
			sSQL.append(" INNER JOIN pedidodesktopwap AS ped ON");
			sSQL.append(" ped._codigo = i._pedidodesktopwap");
			sSQL.append(" WHERE i._pedidodesktopwap = ?");
			sSQL.append(" ORDER BY i._codigo");
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setLong(1, Codigo);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException erro){throw new SQLException(erro.getMessage());}
		finally {Util.fecharConexao(conexao);}
		return oRs;		
	}
//	public String inserirItem(ItemPedido item) throws SQLException, Exception
//	{
//        Connection conexao = Util.getConexao(); 
//        String sStatus;
//        try
//        {
//        	CallableStatement cs;
//    		cs = conexao.prepareCall("{ ? = call operacao_item(?,?,?,?)}");
//    		cs.registerOutParameter(1, Types.VARCHAR);
//    		cs.setLong(2, item.getProduto().getCodigo());
//    		cs.setLong(3, item.getPedido().getCodigo());
//    		cs.setInt(4, item.getQuantidade());
//    		cs.setDouble(5, item.getValorItem());
//    		cs.execute();
//    		sStatus = cs.getString(1);
//    		cs.close(); 	
//          }
//        catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
//   	    catch (Exception erro){throw new Exception(erro.getMessage());}	
//   	    finally { Util.fecharConexao(conexao); }
//   	    return sStatus;   	 
//	}
	
	
	
	
		

}

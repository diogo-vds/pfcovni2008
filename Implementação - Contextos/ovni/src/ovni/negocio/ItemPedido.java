package ovni.negocio;
import java.sql.*;

import ovni.util.*;

import java.text.*;
import java.util.Vector;

public class ItemPedido extends Item
{
	private PedidoDesktopWAP _Pedido;

//** Metodos de acesso
	
	public void setPedido(PedidoDesktopWAP _Pedido)
	{ this._Pedido = _Pedido; }
	public PedidoDesktopWAP getPedido()
	{ return _Pedido; }	

//** Fim dos metodos de acesso
		
	public ResultSet retornarItensPedido(long Codigo)throws SQLException
	{
		ResultSet oRs = null;
		Connection conexao = Util.getConexao();
			StringBuilder sSQL = new StringBuilder("SELECT");
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
	public String inserirItem(ItemPedido item) throws SQLException, Exception
	{
        Connection conexao = Util.getConexao(); 
        String sStatus;
        try
        {
        	CallableStatement cs;
    		cs = conexao.prepareCall("{ ? = call operacao_item(?,?,?,?)}");
    		cs.registerOutParameter(1, Types.VARCHAR);
    		cs.setLong(2, item.getProduto().getCodigo());
    		cs.setLong(3, item.getPedido().getCodigo());
    		cs.setInt(4, item.getQuantidade());
    		cs.setDouble(5, item.getValorItem());
    		cs.execute();
    		sStatus = cs.getString(1);
    		cs.close(); 	
          }
        catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
   	    catch (Exception erro){throw new Exception(erro.getMessage());}	
   	    finally { Util.fecharConexao(conexao); }
   	    return sStatus;   	 
	}
	


} // Final da Classe
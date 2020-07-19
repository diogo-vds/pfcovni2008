package ovni.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class RegistrarEnvio {
	ResultSet rs = null;
	PedidoDesktopWAP pedidos = null;
	Estoque estoque = null;
	Item item = null;
	
	/**
	 * Este método retorna o  resultSet com os pedidos que foram pagos
	 * e estão aguardando envio.
	 */
	public ResultSet listarPedidosPendentes(){

		pedidos = new PedidoDesktopWAP();
		rs = pedidos.listarPedidosPagos();
		return rs;
	}
	
	/**
	 * Este método é responsável pelo registro do envio dos pedidos.
	 * @throws SQLException 
	 */
	public String enviarPedidos(long cod ) throws SQLException{
		String msg = null;
		estoque = new Estoque();
		item = new Item();
		pedidos = new PedidoDesktopWAP();		
		rs = item.retornarItensPedido(cod);
		while(rs.next()){
			msg = estoque.retirarProduto(rs.getLong("Codigo"), rs.getInt("Quantidade"));				
		}
		if(msg == null){
			pedidos.alterarStatusPedido(cod, "ENVIADO PARA CORREIOS");
			msg = "Pedido "+cod+" enviado para transportadora.";
		}		
		return msg;
	}

}

package ovni.relatorios;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ovni.util.Util;

public class RelatorioVendas {
	
	private ResultSet rs;
	private String sql;
	private Connection con;
	private Statement st;
	

	public ResultSet PedidosCelular(){
		con = Util.getConexao();
		sql = " select * from pedidosms ";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Util.fecharConexao(con);
		return rs;
	}
	
	public ResultSet pedidosDesktop(){
		con = Util.getConexao();
		sql = " select * from pedidodesktopwap";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Util.fecharConexao(con);
		return rs;
	}
}

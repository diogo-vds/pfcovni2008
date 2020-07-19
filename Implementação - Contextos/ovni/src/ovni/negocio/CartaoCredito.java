package ovni.negocio;

import java.io.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Vector;

import ovni.util.*;

public class CartaoCredito implements Runnable{

	private Vector<CartaoCredito> carts = new Vector<CartaoCredito>();
	
	private long _numeroCartao;
	private int _codigoSeguranca;
	private String _NomeCartao;
	private int _Parcelas;
	private int _TipoBandeira;
	private long _PedidoDesktopWAP;
	private double _valorTotal;
	private int _MesValidade;
	private int _AnoValidade;
	private boolean _Aprovado;
	private int _Tentativas;
	
	private String _erroTEF;
	
	
	
	public void setnumeroCartao(long _numeroCartao) {
		this._numeroCartao = _numeroCartao;
	}
	public long getnumeroCartao() {
		return _numeroCartao;
	}
	public void setcodigoSeguranca(int _codigoSeguranca) {
		this._codigoSeguranca = _codigoSeguranca;
	}
	public int getcodigoSeguranca() {
		return _codigoSeguranca;
	}
	public void setNomeCartao(String _NomeCartao) {
		this._NomeCartao = _NomeCartao;
	}
	public String getNomeCartao() {
		return _NomeCartao;
	}
	public void setParcelas(int _Parcelas) {
		this._Parcelas = _Parcelas;
	}
	public int getParcelas() {
		return _Parcelas;
	}
	public void setTipoBandeira(int _TipoBandeira) {
		this._TipoBandeira = _TipoBandeira;
	}
	public int getTipoBandeira() {
		return _TipoBandeira;
	}
	public void setPedidoDesktopWAP(long _PedidoDesktopWAP) {
		this._PedidoDesktopWAP = _PedidoDesktopWAP;
	}
	public long getPedidoDesktopWAP() {
		return _PedidoDesktopWAP;
	}
	public void setvalorTotal(double _valorTotal) {
		this._valorTotal = _valorTotal;
	}
	public double getvalorTotal() {
		return _valorTotal;
	}
	public void setMesValidade(int _MesValidade) {
		this._MesValidade = _MesValidade;
	}
	public int getMesValidade() {
		return _MesValidade;
	}
	public void setAnoValidade(int _AnoValidade) {
		this._AnoValidade = _AnoValidade;
	}
	public int getAnoValidade() {
		return _AnoValidade;
	}	
	public void setAprovado(boolean _Aprovado) {
		this._Aprovado = _Aprovado;
	}
	public boolean isAprovado() {
		return _Aprovado;
	}
	public void setTentativas(int _Tentativas) {
		this._Tentativas = _Tentativas;
	}
	public int getTentativas() {
		return _Tentativas;
	}
	public void setErroTEF(String _erroTEF) {
		this._erroTEF = _erroTEF;
	}
	public String getErroTEF() {
		return _erroTEF;
	}
	public CartaoCredito()
	{
	}
	
	public static Vector<CartaoCredito> listar () throws SQLException
	{
		Vector<CartaoCredito> lista = new Vector<CartaoCredito>();
		
		ResultSet oRs = null;
		String sql = "SELECT _numerocartao, _codigoseguranca, _nomeimpresso, _parcelas, _pedidodesktopwap, _valortotal, _mesvalidade, _anovalidade, _tentativas, _aprovado FROM dadoscartao";
		
		Connection conexao = Util.getConexao();		
		Statement stmt = null;
		try
		{
			stmt = conexao.createStatement();
			oRs = stmt.executeQuery(sql);
			
			while (oRs.next())
			{
				CartaoCredito cartao = new CartaoCredito();
				cartao.setnumeroCartao(oRs.getLong("_numerocartao"));
				cartao.setcodigoSeguranca(oRs.getInt("_codigoseguranca"));
				cartao.setNomeCartao(oRs.getString("_nomeimpresso"));
				cartao.setParcelas(oRs.getInt("_parcelas"));
				cartao.setPedidoDesktopWAP(oRs.getLong("_pedidodesktopwap"));
				cartao.setvalorTotal(oRs.getDouble("_valortotal"));
				cartao.setMesValidade(oRs.getInt("_mesvalidade"));
				cartao.setAnoValidade(oRs.getInt("_anovalidade"));
				cartao.setTentativas(oRs.getInt("_tentativas"));
				cartao.setAprovado(oRs.getBoolean("_aprovado"));
				lista.addElement(cartao);
			}			
		}
		catch (SQLException e) {
			throw e;
		}		
		return lista;
		
	}
	
	public void confirmarPagamento()
	{
		Thread ta = new Thread(this);		
		ta.start();	
	}
	
	
	
	
	public void run()
	{	
		try {
			carts = CartaoCredito.listar();
		} catch (SQLException e) { setErroTEF(e.getMessage());}		
		
		for (int ind = 0; ind < carts.size(); ind++)
		{
			try 
			{
				String nomeArq = TEF.getPathREQ() + carts.elementAt(ind).getnumeroCartao() + ".txt";
				BufferedWriter escreve = new BufferedWriter(new FileWriter(nomeArq));
				escreve.write(Long.toString(carts.elementAt(ind).getnumeroCartao()));
				escreve.write("|");
				escreve.write(Integer.toString(carts.elementAt(ind).getcodigoSeguranca()));
				escreve.write("|");
				escreve.write(carts.elementAt(ind).getNomeCartao());
				escreve.write("|");
				escreve.write(Double.toString(carts.elementAt(ind).getvalorTotal()));
				escreve.write("|");
				escreve.write(Integer.toString(carts.elementAt(ind).getParcelas()));
				escreve.newLine();
				escreve.close();		
			}
			catch (Exception e) {setErroTEF(e.getMessage());}
			
			try
			{
				boolean naoLido = true;
				
				while (naoLido)
				{
					Thread.sleep(10000);
					File f = new File(TEF.getPathRESP() + carts.elementAt(ind).getnumeroCartao() + ".txt");
		
					if (f.exists())
					{
						BufferedReader in = new BufferedReader(new FileReader(f));
						String str;
						str = in.readLine();
				        in.close();
				        if (str.equals("APROVADO"))
				        {	
				        	carts.elementAt(ind).setAprovado(true);
				        	f.delete();
				        	naoLido = false;				       
				        }
				        else
				        {
				        	carts.elementAt(ind).setAprovado(false);
				        	f.delete();
				        	naoLido = false;				      
				        }
					}
					else
					{					
						Thread.sleep(10000);
					}
				}			
			}
			catch (Exception e) {setErroTEF(e.getMessage());}		
			
		}
		//depois do for
		try {
			updateStatusAprovado(carts);
		} catch (SQLException e) {setErroTEF(e.getMessage());}
		
	}

	public void updateStatusAprovado(Vector<CartaoCredito> cart) throws SQLException
	{
		String sqlCartao = "UPDATE dadoscartao set _aprovado = ?, _tentativas = ? WHERE _pedidodesktopwap = ?";
		String sqlPedido = "UPDATE pedidodesktopwap set _tipostatuspedido = 3, _datapagamento = current_date, _horapagamento = current_time WHERE _codigo = ?";
		
		Connection conexao = Util.getConexao();		
		try
		{
			conexao.setAutoCommit(false);
			for (int i = 0; i < cart.size(); i++ )
			{
				
				if (cart.elementAt(i).isAprovado())
				{
					PreparedStatement pstmtCartao = conexao.prepareStatement(sqlCartao);	
					pstmtCartao.setBoolean(1, cart.elementAt(i).isAprovado());
					pstmtCartao.setInt(2, cart.elementAt(i).getTentativas());					
					pstmtCartao.setLong(3, cart.elementAt(i).getPedidoDesktopWAP());
					pstmtCartao.executeUpdate();
					
					PreparedStatement pstmtPedido = conexao.prepareStatement(sqlPedido);
					pstmtPedido.setLong(1, cart.elementAt(i).getPedidoDesktopWAP());
					pstmtPedido.executeUpdate();
				}
				else
				{
					PreparedStatement pstmtCartao = conexao.prepareStatement(sqlCartao);	
					pstmtCartao.setBoolean(1, cart.elementAt(i).isAprovado());
					pstmtCartao.setInt(2, cart.elementAt(i).getTentativas()+1);
					pstmtCartao.setLong(3, cart.elementAt(i).getPedidoDesktopWAP());
					pstmtCartao.executeUpdate();
				}
			}
			conexao.commit();
		}
		catch (SQLException e) {conexao.rollback(); setErroTEF(e.getMessage());}
		finally{Util.fecharConexao(conexao);}		
	}	
	
}

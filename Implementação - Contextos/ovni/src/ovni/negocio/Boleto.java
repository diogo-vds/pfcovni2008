package ovni.negocio;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import ovni.util.Util;

public class Boleto {
	//Atributos de Classe
	private long _codigo =0;
	private double _valor = 0;
	private double _valorboleto = 0;
	private int _nossonumero = 666;
	private String _linhadigitavel = null;
	private long _numeropedido = 0;
	private long _usuario = 0;	
	private Date _datavencimento = null;
	private Date _dataprocessamento = null;
	private String _cedente = null;
	private boolean _aprovado = false;

	//Métodos de Acesso
	
	public long getCodigo() {
		return _codigo;
	}
	public void setCodigo(long _codigo) {
		this._codigo = _codigo;
	}
	public double getValor() {
		return _valor;
	}
	public void setValor(double _valor) {
		this._valor = _valor;
	}
	public double getValorboleto() {
		return _valorboleto;
	}
	public void setValorboleto(double _valorboleto) {
		this._valorboleto = _valorboleto;
	}
	public int getNossonumero() {
		return _nossonumero;
	}
	public void setNossonumero(int _nossonumero) {
		this._nossonumero = _nossonumero;
	}
	public String getLinhadigitavel() {
		return _linhadigitavel;
	}
	public void setLinhadigitavel(String _linhadigitavel) {
		this._linhadigitavel = _linhadigitavel;
	}
	public long getNumeropedido() {
		return _numeropedido;
	}
	public void setNumeropedido(long _numeropedido) {
		this._numeropedido = _numeropedido;
	}
	public long getUsuario() {
		return _usuario;
	}
	public void setUsuario(long _usuario) {
		this._usuario = _usuario;
	}
	public Date getDataprocessamento() {
		return _dataprocessamento;
	}
	public void setDataprocessamento(Date _dataprocessamento) {
		this._dataprocessamento = _dataprocessamento;
	}
	public Date getDatavencimento() {
		return _datavencimento;
	}
	public void setDatavencimento(Date _datavencimento) {
		this._datavencimento = _datavencimento;
	}
	public String getCedente() {
		return _cedente;
	}
	public void setCedente(String _cedente) {
		this._cedente = _cedente;
	}
	public void setAprovado(boolean _aprovado) {
		this._aprovado = _aprovado;
	}
	public boolean isAprovado() {
		return _aprovado;
	}
	/**
	 * Parâmetros
	 * @param valor
	 * @param numeropedido
	 * @param usuario
	 * Método que seta os dados no objeto.
	 */
	public void setDados(double valor,long numeropedido,long usuario){
		this.setCodigo(this.GerarCodigo());
		this.setValor(valor);
		this.setValorboleto(this.getValor()+3);
		this.setNossonumero(666);
		this.setNumeropedido(numeropedido);
		this.setUsuario(usuario);	
		this.CalcularData();
		this.setCedente("Ovni");		
		this.setLinhadigitavel( Long.toString(this.getCodigo())+
								Double.toString(this.getValor())+
								Double.toString(this.getValorboleto())+
								Integer.toString(this.getNossonumero())+
								Long.toString(this.getNumeropedido())+
								Long.toString(this.getUsuario())+
								this.formatarDataBoleto()+
								this.formatarDataVencimento());		
	}
	/**
	 * Este método seta as datas de processamento e a data de vencimento do boleto.
	 * A data de processamento é a data atual do sistema
	 * A data de vencimento é de 5 dias após a data de processamento.
	 */
	public void CalcularData(){   
		Date hoje = new Date();   
		int dias = 5;   
		Date nova_data = new Date(hoje.getTime()+((1000*24*60*60)*dias));   
		SimpleDateFormat df = new SimpleDateFormat("ddMMyyyy");   
		this.setDatavencimento(nova_data);
		this.setDataprocessamento(hoje);		
	}
	/**
	 * Este método é responsável por gerar o código do boleto.
	 * 
	 */
	public long GerarCodigo(){
		long codigo = 0;
		Connection conexao = Util.getConexao();
		String sql = "select nextval('sq_boleto')";
		Statement st;
		try {
			st = conexao.createStatement();
			ResultSet rRs = st.executeQuery(sql);
			rRs.next();
			codigo = rRs.getLong("nextval");			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		finally { Util.fecharConexao(conexao); }
		return codigo;
		
	}
	/**
	 * Este método gera o boleto salvando os dados na base.
	 */
	public void Gerar(){
		SimpleDateFormat df = new SimpleDateFormat("yyMMdd");
		boolean status = false;
		Connection conexao = Util.getConexao();
		this.setCodigo(5);
		String sql = "Insert into boleto values(" +
		"nextval('sq_boleto'),"+
		this.getValor()+","+
		this.getValorboleto()+","+
		this.getNossonumero()+","+
		this.getNumeropedido()+","+
		this.getUsuario()+",'"+
		df.format(this.getDatavencimento()) +"','"+
		df.format(this.getDataprocessamento())+"','"+
		this.getCedente()+"');";
		String gerar = null;
		try {
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.clearParameters();
			try{
				pst.execute();
				status = true;
			}catch(SQLException e){
				status = false;
				gerar = e.getMessage();
			}			
		} catch (SQLException e) {
			status = false;
			gerar = e.getMessage();
		}
		finally { Util.fecharConexao(conexao); }
		//return status;
	}
	/**
	 * Parâmetro	
	 * @param pedido
	 * Este método busca um boleto pelo número do pedido
	 */
	public ResultSet buscarBoleto(long pedido) throws SQLException{
		
		ResultSet rRs = null;
		Connection conexao = Util.getConexao();
		String status = null;
		String sql = "select * from boleto where _numeropedido = ? ";
		try {
			PreparedStatement pst = conexao.prepareStatement(sql);
			pst.clearParameters();
			pst.setLong(1, pedido);
			rRs = pst.executeQuery();			
		} catch (SQLException e) {			
			e.printStackTrace();
		}	
		finally { Util.fecharConexao(conexao); }

		return rRs;
	}
	/**
	 * 
	 * @param codigo
	 * Este método busca todos os boletos de um usuário e retorna
	 * um resultset com os dados.
	 */
	public ResultSet listarBoletos(long codigo){
		ResultSet rRs = null;
		String sql = "SELECT _codigo, _numeroPedido,_valorBoleto FROM BOLETO WHERE _USUARIO = ?" +
				" AND _aprovado = false AND _datavencimento > current_date";
		Connection con = Util.getConexao();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.clearParameters();
			pst.setLong(1,codigo);
			rRs = pst.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			Util.fecharConexao(con);
		}
		
		return rRs;
	}
	/**
	 * Método que formata a data de vencimento do boleto.
	 * @return
	 */
	public String formatarDataVencimento(){   
		Date hoje = new Date();   
		int dias = 5;   
		Date nova_data = new Date(hoje.getTime()+((1000*24*60*60)*dias));   
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss:SSS");   
		return df.format(nova_data);
	}
	/**
	 * Método que formata a data do boleto.
	 * @return
	 */
	public String formatarDataBoleto(){   
		Date hoje = new Date();   
		int dias = 5;   
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss:SSS");   
		return df.format(hoje);
	}

	public void confirmarPagamento(String filePath)
	{
		Vector<Boleto> boletos = new Vector<Boleto>();
		
		try 
		{
			File f = new File(filePath);
			BufferedReader in = new BufferedReader(new FileReader(f));
			String[] texto;
			String str;
			while ((str = in.readLine()) !=null )
			{
				texto = str.split("\\|");
				Boleto bo = new Boleto();
				bo.setNossonumero(Integer.parseInt(texto[0]));
				bo.setNumeropedido(Long.parseLong(texto[1]));
				if (texto[2].equals("APROVADO"))
					bo.setAprovado(true);
				else
					bo.setAprovado(false);
				boletos.addElement(bo);
			}		
			updateStatusAprovado(boletos);
		}
		catch (Exception e) {	}
	}	
	public void updateStatusAprovado(Vector<Boleto> listaBoletos) throws SQLException
	{
		Vector<Boleto> boletos = listaBoletos;
		
		String sqlBoleto = "UPDATE boleto set _aprovado = true WHERE _numeropedido = ?";
		String sqlPedido = "UPDATE pedidodesktopwap set _tipostatuspedido = 3, _datapagamento = current_date, _horapagamento = current_time WHERE _codigo = ?";
		
		Connection conexao = Util.getConexao();		
		try
		{
			conexao.setAutoCommit(false);
			for (int i = 0; i < boletos.size(); i++ )
			{
				if (boletos.elementAt(i).isAprovado())
				{
					PreparedStatement pstmtBoleto = conexao.prepareStatement(sqlBoleto);					
					pstmtBoleto.setLong(1, boletos.elementAt(i).getNumeropedido());
					pstmtBoleto.executeUpdate();
					
					PreparedStatement pstmtPedido = conexao.prepareStatement(sqlPedido);
					pstmtPedido.setLong(1, boletos.elementAt(i).getNumeropedido());
					pstmtPedido.executeUpdate();
				}				
			}
			conexao.commit();
		}
		catch (SQLException e) {conexao.rollback();}
		finally{Util.fecharConexao(conexao);}		
	}
	

}

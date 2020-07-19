package ovni.negocio;
import ovni.util.Util;
import java.sql.*;
import java.util.Calendar;
import java.util.Vector;
import javax.mail.MessagingException;

public class PedidoDesktopWAP {
//Atributos
	private long _codigo;
	private Usuario _usuario;
	private TipoStatusPedido _tipoStatus;
	private TipoFormaPagamento _tipoFormas;
	private CartaoCredito _cartao;
	private Boleto _boleto;
	private Endereco _endereco;
	private Vector<Item> _Itens = new Vector<Item>();
	private Date _dataPedido;
	private Date _dataPagamento;
	private String _horaPedido;
	private String _horaPagamento;
	private float _valorFrete;
	private float _valorTotalPedido;
	private String _codigoRastreanemto;
	private int QuantidadeParcelas;
	
	
//Metodos de acesso
	public void setCodigo(long _codigo) {
		this._codigo = _codigo;
	}
	public long getCodigo() {
		return _codigo;
	}
	public void setUsuario(Usuario _usuario) {
		this._usuario = _usuario;
	}
	public Usuario getUsuario() {
		return _usuario;
	}
	public void setTipoStatus(TipoStatusPedido _tipoStatus) {
		this._tipoStatus = _tipoStatus ;
	}
	public TipoStatusPedido getTipoStatus() {
		return this._tipoStatus ;
	}
	public void setTipoFormas(TipoFormaPagamento _tipoFormas) {
		this._tipoFormas = _tipoFormas;
	}
	public TipoFormaPagamento getTipoFormas() {
		return this._tipoFormas;
	}
	public void setEndereco(Endereco _endereco) {
		this._endereco = _endereco;
	}
	public Endereco getEndereco() {
		return _endereco;
	}
	public void setItem(Item oItem)
	{ this._Itens.addElement(oItem) ;}
	public void setItem(Vector<Item> itens){
		this._Itens = itens;
	}
	public Item getItem( int iPosicao)
	{ return this._Itens.elementAt(iPosicao) ; }
	public void setDataPedido(int ano, int mes, int dia) {
    	this._dataPedido = Util.retornarData(ano, mes, dia);
	}
	public void setDataPedido(Date data){
		this._dataPedido = data;
	}
	public Date getDataPedido() {
		return _dataPedido;
	}
	public void setDataPagamento(int ano, int mes, int dia) { 
    	this._dataPagamento = Util.retornarData(ano, mes, dia);
	}
	public void setDataPagamento(Date data){
		this._dataPagamento = data;
	}
	
	public Date getDataPagamento() {
		return _dataPagamento;
	}
	public void setHoraPedido(String _horaPedido) {
		this._horaPedido = _horaPedido;
	}
	public String getHoraPedido() {
		return _horaPedido;
	}
	public void setHoraPagamento(String _horaPagamento) {
		this._horaPagamento = _horaPagamento;
	}
	public String getHoraPagamento() {
		return _horaPagamento;
	}
	public void setValorFrete(float _valorFrete) {
		this._valorFrete = _valorFrete;
	}
	public float getValorFrete() {
		return _valorFrete;
	}
	public void setCodigoRastreanemto(String _codigoRastreanemto) {
		this._codigoRastreanemto = _codigoRastreanemto;
	}
	public String getCodigoRastreanemto() {
		return _codigoRastreanemto;
	}
	public void setvalorTotal(float _valorTotal) {
		this._valorTotalPedido = _valorTotal;
	}
	public float getvalorTotal() {
		return _valorTotalPedido;
	}
		
	public void setQuantidadeParcelas(int quantidadeParcelas) {
		QuantidadeParcelas = quantidadeParcelas;
	}
	public int getQuantidadeParcelas() {
		return QuantidadeParcelas;
	}	

	public void setCartao(CartaoCredito _cartao) {
		this._cartao = _cartao;
	}
	public CartaoCredito getCartao() {
		return _cartao;
	}
	
	public void setboleto(Boleto _boleto) {
		this._boleto = _boleto;
	}
	public Boleto getboleto() {
		return _boleto;
	}
	//Contrutor
	public PedidoDesktopWAP()
	{	}
	
	public PedidoDesktopWAP(Carrinho car)
	{		
		for (int i = 0; i < car.getNumeroItens(); i++ )
		{
			_Itens.addElement(car.getItem(i));
			CalcularValorTotal();
		}
	}
	
	/**
	 * 
	 * @return Um inteiro com a quantidade de itens
	 */
	public int getNumeroItens()
	{ return(_Itens.size()); }
	
	/**
	 * 
	 * @return um float com o peso total dos itens
	 */
	public float calcularPesoItens( )
	{
		float dPeso = 0;
		for (int i=0; i < _Itens.size(); i++ )
		{
			dPeso +=  (float)_Itens.elementAt(i).getProduto().getPeso() * _Itens.elementAt(i).getQuantidade();
		}
		return dPeso;		
	}
	
	/**
	 * Calcula o valor total do pedido
	 */
	public void CalcularValorTotal( )
	{
		this._valorTotalPedido = 0;
		for (int iCont = 0; iCont<=_Itens.size()-1; iCont++)
		{
			this._valorTotalPedido += _Itens.elementAt(iCont).getValorItem();
		}
		this._valorTotalPedido = this._valorTotalPedido + this._valorFrete;
	}	
	
	/**
	 * Atualiza o endereço do pedido e corrige o valor do Frete
	 * @param end : Endereco para atualizar
	 * @throws Exception
	 */
	public void atualizarEndereco(Endereco end) throws Exception
	{
		setEndereco(end);
		setValorFrete(FreteCorreios.executar(41106, end.getCep(), calcularPesoItens()));
		CalcularValorTotal();
	}
	
	public void adicionarFormaPagamento(TipoFormaPagamento pgto){
		setTipoFormas(pgto);
		if (!pgto.isTEF())
			setQuantidadeParcelas(1);
	}
	
	public void adicionarDadosCartao(CartaoCredito cartao){
		setCartao(cartao);
		setQuantidadeParcelas(cartao.getParcelas());
	}
	
	public long gerarCodigo( ) throws SQLException
	{
		Connection conexao = Util.getConexao();
		ResultSet oRs;
		long codigo;
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement("SELECT nextval('sq_PedidoDesktopWap');");
			oRs = pstmt.executeQuery();
			oRs.next();
			codigo = oRs.getLong("nextval");			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }		
		return codigo;
	}
	
	public synchronized void inserir() throws SQLException, Exception
	{
		//SQL para consulta em estoque
		String sqlConsultaEstoque = "SELECT _quantidadedisponivel FROM estoque WHERE _produto = ?";		
		
		//SQL para atualizar o estoque
		String sqlAtualizarEstoque = "UPDATE estoque set _quantidadedisponivel = ( (SELECT _quantidadedisponivel FROM estoque WHERE _produto = ? ) - ? ) WHERE _produto = ?";
		
		// SQL para recuperar o proximo codigo da tabela pedidos
		String sqlGerarCodigo = "SELECT nextval('sq_PedidoDesktopWap');" ;
		
		// SQL para inserir dados na tabela pedidodesktopwap
		StringBuilder sbSQLInserirPedido = new StringBuilder();
		sbSQLInserirPedido.append(" INSERT INTO pedidodesktopwap");
		sbSQLInserirPedido.append(" (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _totalpedido, _horapedido");
		sbSQLInserirPedido.append(" , _parcelas, _codigoendereco ) ");
		sbSQLInserirPedido.append(" VALUES ( ?, ?, ?, ?, current_date, ?, current_time, ?, ?)");
		
		// SQL para inserir dados na tabela item
		StringBuilder sbSQLItem = new StringBuilder();
		sbSQLItem.append(" INSERT INTO item");
		sbSQLItem.append(" (_produto, _pedidodesktopwap, _quantidade, _valortotal )");
		sbSQLItem.append(" VALUES (?, ?, ?, ?)");
		
		//SQL para inserir dados na tabela boleto
		StringBuilder sbSQLBoleto = new StringBuilder();
		sbSQLBoleto.append(" INSERT INTO boleto");
		sbSQLBoleto.append(" (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente, _linhadigitavel, _aprovado)");
		sbSQLBoleto.append(" VALUES (?, ?, ?, ?, ?, ?, (current_date + 5), current_date, ?, ?, false)");
		
		//SQL para inserir dados na tabela dadoscartao
		StringBuilder sbSQLCartao = new StringBuilder();
		sbSQLCartao.append(" INSERT INTO dadoscartao");
		sbSQLCartao.append(" (_numerocartao, _codigoseguranca, _nomeimpresso, _parcelas, _pedidodesktopwap, _valortotal, _mesvalidade, _anovalidade)");
		sbSQLCartao.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
		
		Connection conexao = Util.getConexao();
		conexao.setAutoCommit(false);	
//
//		try
//		{
			for (int i = 0; i < this.getNumeroItens(); i++)
			{
//				PreparedStatement pstmtConsultaEstoque = conexao.prepareStatement(sqlConsultaEstoque);
//				pstmtConsultaEstoque.clearParameters();
//				pstmtConsultaEstoque.setLong(1, this.getItem(i).getProduto().getCodigo());
//				ResultSet result = pstmtConsultaEstoque.executeQuery();		
//				
//				result.next();				
//				int qdtDisponivel = result.getInt("_quantidadedisponivel");
//				
//				if (qdtDisponivel < this.getItem(i).getQuantidade())
//				{
//					throw new Exception();
//				}
				Estoque est = new Estoque();
				if (!est.VerificarEstoque(this.getItem(i).getProduto().getCodigo(), this.getItem(i).getQuantidade()))
				{
					throw new Exception("Estoque não disponível!!!");
				}
			}
//		}
//		catch (Exception e) 
//		{ throw new Exception("Estoque indisponível");}
			
			try
			{
			PreparedStatement pstmtGerarCodigo = conexao.prepareStatement(sqlGerarCodigo);
			ResultSet result = pstmtGerarCodigo.executeQuery();
			result.next();
			long codigo = result.getLong("nextval");
			this.setCodigo(codigo);
					
			PreparedStatement pstmtInserirPedido = conexao.prepareStatement(sbSQLInserirPedido.toString());
			pstmtInserirPedido.setLong(1, getCodigo());
			pstmtInserirPedido.setLong(2, getUsuario().getCodigo());
			pstmtInserirPedido.setInt(3, 1);
			pstmtInserirPedido.setInt(4, getTipoFormas().getCodigo());
			pstmtInserirPedido.setFloat(5, getvalorTotal()+ getTipoFormas().getTaxa());
			pstmtInserirPedido.setInt(6, getQuantidadeParcelas());
			pstmtInserirPedido.setLong(7, getEndereco().getCodigo());
			pstmtInserirPedido.execute();		
			
		
			PreparedStatement pstmtItem = conexao.prepareStatement(sbSQLItem.toString());
			PreparedStatement pstmtAtualizarEstoque = conexao.prepareStatement(sqlAtualizarEstoque);
			for (int indice = 0; indice < this.getNumeroItens(); indice++)
			{
				pstmtItem.clearParameters();
				pstmtItem.setLong(1, getItem(indice).getProduto().getCodigo());
				pstmtItem.setLong(2, getCodigo());
				pstmtItem.setInt(3, getItem(indice).getQuantidade());
				pstmtItem.setFloat(4, getItem(indice).getValorItem());
				pstmtItem.execute();
				
				
				pstmtAtualizarEstoque.clearParameters();
				pstmtAtualizarEstoque.setLong(1, getItem(indice).getProduto().getCodigo());
				pstmtAtualizarEstoque.setInt(2, getItem(indice).getQuantidade());
				pstmtAtualizarEstoque.setLong(3, getItem(indice).getProduto().getCodigo());
				pstmtAtualizarEstoque.executeUpdate();
			}			
			
			if (!getTipoFormas().isTEF())
			{

				setboleto(new Boleto());				
				getboleto().setDados(getvalorTotal(), getCodigo(), getUsuario().getCodigo());
				PreparedStatement pstmtBoleto = conexao.prepareStatement(sbSQLBoleto.toString());
				pstmtBoleto.setLong(1, getboleto().getCodigo());
				pstmtBoleto.setDouble(2, getboleto().getValor());
				pstmtBoleto.setDouble(3, getboleto().getValorboleto());
				pstmtBoleto.setInt(4, 666);
				pstmtBoleto.setLong(5, getboleto().getNumeropedido());
				pstmtBoleto.setLong(6, getboleto().getUsuario());
				pstmtBoleto.setString(7, getboleto().getCedente());
				pstmtBoleto.setString(8, getboleto().getLinhadigitavel());
				pstmtBoleto.execute();
				
			}
			else
			{
				PreparedStatement pstmtCartao = conexao.prepareStatement(sbSQLCartao.toString());
				pstmtCartao.setLong(1, getCartao().getnumeroCartao());
				pstmtCartao.setInt(2, getCartao().getcodigoSeguranca());
				pstmtCartao.setString(3, getCartao().getNomeCartao());
				pstmtCartao.setInt(4, getCartao().getParcelas());
				pstmtCartao.setLong(5, getCodigo());
				pstmtCartao.setFloat(6, getvalorTotal());
				pstmtCartao.setInt(7, getCartao().getMesValidade());
				pstmtCartao.setInt(8, getCartao().getAnoValidade());
				pstmtCartao.execute();
			}	
			
			conexao.commit();
			conexao.setAutoCommit(true);
		}
		catch (SQLException e) { conexao.rollback(); throw e; }
		finally { Util.fecharConexao(conexao);}
		
		enviarEmailPedido();
	}
	
	public void enviarEmailPedido()
	{
		
		StringBuilder sb = new StringBuilder();
		
		sb.append(" <table>");
		sb.append("  <tr>");
		sb.append("    <th colspan=\"3\"> Dados Gerais </th>");
		sb.append("  </tr>");
		sb.append("  <tr>");
		sb.append("    <th> NumeroPedido </th>");
		sb.append("	   <th> Forma de Pagamento</th>");
		sb.append("    <th> Valor Total  </th>");
		sb.append("  </tr>");
		sb.append("  <tr>");
		sb.append("    <td>");
		sb.append(getCodigo());
		sb.append("    </td>");
		sb.append("    <td>");
		sb.append(getTipoFormas().getDescricao());
		sb.append("    </td>");
		sb.append("    <td>");
		sb.append(Util.formatarDouble(getvalorTotal()));
		sb.append("    </td>");
		sb.append("   </tr>");
		sb.append("</table>");
		sb.append("<br><br>");
		sb.append("<table border=\"1\">");
		sb.append("  <tr>");
		sb.append("   <th colspan=\"3\"> Dados dos Itens </th>");
		sb.append("  </tr>");
		sb.append("  <tr>");
		sb.append("   <th> Produto </th>");
		sb.append("   <th> Quantidade </th>");
		sb.append("   <th> Valor Total </th>");
		sb.append("  </tr>");
		
		for (int i = 0; i <= getNumeroItens()-1;i++)
		{
			sb.append("  <tr>");
			sb.append("   <td>");
			sb.append(getItem(i).getProduto().getTitulo());
			sb.append("   </td>");
			sb.append("   <td>");
			sb.append(getItem(i).getQuantidade());
			sb.append("   </td>");
			sb.append("   <td>");
			sb.append(getItem(i).getValorItem());
			sb.append("   </td>");
		}
		sb.append("  </table>");
			
		try
		{
			Email email = new Email();
			email.setAssunto("Pedido de numero: "+getCodigo());
			email.setConteudo(sb.toString());
			email.setPara(getUsuario().getEmail());
			email.enviarPromocao(); 
		}
		catch (MessagingException e) { }
	}
	
	public Vector<PedidoDesktopWAP> listar(String params[] , String sTPbusca, long CodUsu) throws SQLException
	{
		Vector<PedidoDesktopWAP> lista = new Vector<PedidoDesktopWAP>();
		
		if (sTPbusca.equalsIgnoreCase("Data"))
		{
			//recupera dados da data de inicio
			int dtIniDia = 1;
			int dtIniMes = Integer.parseInt(params[0]);
			int dtIniAno = Integer.parseInt(params[1]);
			
			//recupera dados da data de fim
			int dtFimDia = 31;
			int dtFimMes = Integer.parseInt(params[2]);
			int dtFimAno = Integer.parseInt(params[3]);
			
			//cria o objeto do tipo data
			Date dtIni = Util.retornarData(dtIniAno, dtIniMes, dtIniDia);
			Date dtFim = Util.retornarData(dtFimAno, dtFimMes, dtFimDia);

			//recupera os pedidos entre a data selecionada
			lista = this.listarPorData(dtIni, dtFim, CodUsu);			
		}
		if (sTPbusca.equalsIgnoreCase("Status"))
		{
			lista = this.listarPorStatus(Integer.parseInt(params[0]), CodUsu);			
		}
		if (sTPbusca.equalsIgnoreCase("Codigo"))
		{
			PedidoDesktopWAP ped = this.listarPorCodigo(Long.parseLong(params[0]), CodUsu);
			if (ped != null)
				lista.addElement(ped);
			else
				lista.clear();
		}		
		return lista;
	}
	
	public Vector<PedidoDesktopWAP> listar(String params[] , String sTPbusca) throws SQLException
	{
		Vector<PedidoDesktopWAP> lista = new Vector<PedidoDesktopWAP>();
		
		if (sTPbusca.equalsIgnoreCase("Data"))
		{
			//recupera dados da data de inicio
			int dtIniDia = 1;
			int dtIniMes = Integer.parseInt(params[0]);
			int dtIniAno = Integer.parseInt(params[1]);
			
			//recupera dados da data de fim
			int dtFimDia = 31;
			int dtFimMes = Integer.parseInt(params[2]);
			int dtFimAno = Integer.parseInt(params[3]);
			
			//cria o objeto do tipo data
			Date dtIni = Util.retornarData(dtIniAno, dtIniMes, dtIniDia);
			Date dtFim = Util.retornarData(dtFimAno, dtFimMes, dtFimDia);

			//recupera os pedidos entre a data selecionada
			lista = this.listarPorData(dtIni, dtFim);			
		}
		if (sTPbusca.equalsIgnoreCase("Status"))
		{
			lista = this.listarPorStatus(Integer.parseInt(params[0]));			
		}
		if (sTPbusca.equalsIgnoreCase("Codigo"))
		{
			PedidoDesktopWAP ped = this.listarPorCodigo(Long.parseLong(params[0]));
			if (ped != null)
				lista.addElement(ped);
			else
				lista.clear();
		}		
		return lista;
	}
	
	public Vector<PedidoDesktopWAP> listarPorData(Date dtInit, Date dtFim) throws SQLException
	{
		
		Vector<PedidoDesktopWAP> lista = new Vector<PedidoDesktopWAP>();
		
		ResultSet oRs = null;			
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo");
		sSQL.append(" , u._nome AS Nome");
		sSQL.append(" , t._descricao AS Status");
		sSQL.append(" , t._codigo AS CodStatus");
		sSQL.append(" , f._descricao AS Pagamento");
		sSQL.append(" , p._formapagamento AS CodPag");
		sSQL.append(" , p._datapedido AS DataPedido");
		sSQL.append(" , p._horapedido AS HoraPedido");
		sSQL.append(" , p._datapagamento AS DataPagamento");
		sSQL.append(" , p._horapagamento AS HoraPagamento");
		sSQL.append(" , p._parcelas AS Parcelas");
		sSQL.append(" , p._codigorastreamento AS Rastreamento");
		sSQL.append(" , p._totalpedido AS TotalPedido");
		sSQL.append(" , e._codigo AS CodEndereco");
		sSQL.append(" FROM pedidodesktopwap AS p INNER JOIN usuario AS u ON");
		sSQL.append(" p._usuario = u._codigo");
		sSQL.append(" INNER JOIN tipostatuspedido AS t ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" INNER JOIN tipoformapagamento  AS f ON");
		sSQL.append(" p._formapagamento = f._codigo");
		sSQL.append(" INNER JOIN endereco AS e ON");
		sSQL.append(" p._codigoendereco = e._codigo");
		sSQL.append(" WHERE");
		sSQL.append(" p._datapedido BETWEEN ? AND ? ORDER BY p._datapedido ASC");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setDate(1, (Date)dtInit);
			pstmt.setDate(2, (Date)dtFim);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		
		while (oRs.next())
		{
			PedidoDesktopWAP pedido = new PedidoDesktopWAP();
			pedido.setCodigo(oRs.getLong("Codigo"));
			pedido.setDataPedido(oRs.getDate("DataPedido"));
			pedido.setHoraPedido(oRs.getString("HoraPedido"));
			pedido.setDataPagamento(oRs.getDate("DataPagamento"));			
			pedido.setHoraPagamento(oRs.getString("HoraPagamento"));
			pedido.setQuantidadeParcelas(oRs.getInt("Parcelas"));
			pedido.setCodigoRastreanemto(oRs.getString("Rastreamento"));
			pedido.setvalorTotal(oRs.getFloat("TotalPedido"));
			// Preenche o status do pedido
				TipoStatusPedido tipo = new TipoStatusPedido();
				tipo = tipo.listarPorCodigo(oRs.getInt("CodStatus"));
				pedido.setTipoStatus(tipo);
			// Preenche a forma de pagameto
				TipoFormaPagamento pgto = new TipoFormaPagamento();
				pgto = pgto.retornarFormaPGTOporCodigo(oRs.getInt("CodPag"));
				pedido.setTipoFormas(pgto);
			// preenche o endereco
				Endereco end = new Endereco();
				end = end.BuscarEnderecoCodigo(oRs.getLong("CodEndereco"), "U");
				pedido.setEndereco(end);			
			// preenche os itens
				Item item = new Item();
				Vector<Item> itens = item.listarItensPedido(oRs.getLong("Codigo"));
				pedido.setItem(itens);				
			// inseri pedido no vetor
				lista.addElement(pedido);			
		}				
		return lista;		
	}		
	
	public Vector<PedidoDesktopWAP> listarPorData(Date dtInit, Date dtFim, long CodUsu) throws SQLException
	{
		
		Vector<PedidoDesktopWAP> lista = new Vector<PedidoDesktopWAP>();
		
		ResultSet oRs = null;			
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo");
		sSQL.append(" , u._nome AS Nome");
		sSQL.append(" , t._descricao AS Status");
		sSQL.append(" , t._codigo AS CodStatus");
		sSQL.append(" , f._descricao AS Pagamento");
		sSQL.append(" , p._formapagamento AS CodPag");
		sSQL.append(" , p._datapedido AS DataPedido");
		sSQL.append(" , p._horapedido AS HoraPedido");
		sSQL.append(" , p._datapagamento AS DataPagamento");
		sSQL.append(" , p._horapagamento AS HoraPagamento");
		sSQL.append(" , p._parcelas AS Parcelas");
		sSQL.append(" , p._codigorastreamento AS Rastreamento");
		sSQL.append(" , p._totalpedido AS TotalPedido");
		sSQL.append(" , e._codigo AS CodEndereco");
		sSQL.append(" FROM pedidodesktopwap AS p INNER JOIN usuario AS u ON");
		sSQL.append(" p._usuario = u._codigo");
		sSQL.append(" INNER JOIN tipostatuspedido AS t ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" INNER JOIN tipoformapagamento  AS f ON");
		sSQL.append(" p._formapagamento = f._codigo");
		sSQL.append(" INNER JOIN endereco AS e ON");
		sSQL.append(" p._codigoendereco = e._codigo");
		sSQL.append(" WHERE");
		sSQL.append(" (  (p._datapedido BETWEEN ? AND ?) AND ( p._usuario = ? )  )ORDER BY p._datapedido ASC");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setDate(1, (Date)dtInit);
			pstmt.setDate(2, (Date)dtFim);
			pstmt.setLong(3, CodUsu);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		
		while (oRs.next())
		{
			PedidoDesktopWAP pedido = new PedidoDesktopWAP();
			pedido.setCodigo(oRs.getLong("Codigo"));
			pedido.setDataPedido(oRs.getDate("DataPedido"));
			pedido.setHoraPedido(oRs.getString("HoraPedido"));
			pedido.setDataPagamento(oRs.getDate("DataPagamento"));			
			pedido.setHoraPagamento(oRs.getString("HoraPagamento"));
			pedido.setQuantidadeParcelas(oRs.getInt("Parcelas"));
			pedido.setCodigoRastreanemto(oRs.getString("Rastreamento"));
			pedido.setvalorTotal(oRs.getFloat("TotalPedido"));
			// Preenche o status do pedido
				TipoStatusPedido tipo = new TipoStatusPedido();
				tipo = tipo.listarPorCodigo(oRs.getInt("CodStatus"));
				pedido.setTipoStatus(tipo);
			// Preenche a forma de pagameto
				TipoFormaPagamento pgto = new TipoFormaPagamento();
				pgto = pgto.retornarFormaPGTOporCodigo(oRs.getInt("CodPag"));
				pedido.setTipoFormas(pgto);
			// preenche o endereco
				Endereco end = new Endereco();
				end = end.BuscarEnderecoCodigo(oRs.getLong("CodEndereco"),"U");
				pedido.setEndereco(end);			
			// preenche os itens
				Item item = new Item();
				Vector<Item> itens = item.listarItensPedido(oRs.getLong("Codigo"));
				pedido.setItem(itens);				
			// inseri pedido no vetor
				lista.addElement(pedido);			
		}				
		return lista;		
	}	
	
	public Vector<PedidoDesktopWAP> listarPorStatus(int codigo) throws SQLException
	{
		
		Vector<PedidoDesktopWAP> lista = new Vector<PedidoDesktopWAP>();
		
		ResultSet oRs = null;			
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo");
		sSQL.append(" , u._nome AS Nome");
		sSQL.append(" , t._descricao AS Status");
		sSQL.append(" , t._codigo AS CodStatus");
		sSQL.append(" , f._descricao AS Pagamento");
		sSQL.append(" , p._formapagamento AS CodPag");
		sSQL.append(" , p._datapedido AS DataPedido");
		sSQL.append(" , p._horapedido AS HoraPedido");
		sSQL.append(" , p._datapagamento AS DataPagamento");
		sSQL.append(" , p._horapagamento AS HoraPagamento");
		sSQL.append(" , p._parcelas AS Parcelas");
		sSQL.append(" , p._codigorastreamento AS Rastreamento");
		sSQL.append(" , p._totalpedido AS TotalPedido");
		sSQL.append(" , e._codigo AS CodEndereco");
		sSQL.append(" FROM pedidodesktopwap AS p INNER JOIN usuario AS u ON");
		sSQL.append(" p._usuario = u._codigo");
		sSQL.append(" INNER JOIN tipostatuspedido AS t ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" INNER JOIN tipoformapagamento  AS f ON");
		sSQL.append(" p._formapagamento = f._codigo");
		sSQL.append(" INNER JOIN endereco AS e ON");
		sSQL.append(" p._codigoendereco = e._codigo");
		sSQL.append(" WHERE");
		sSQL.append(" p._tipostatuspedido = ? ORDER BY p._datapedido ASC");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setLong(1, codigo);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		
		while (oRs.next())
		{
			PedidoDesktopWAP pedido = new PedidoDesktopWAP();
			pedido.setCodigo(oRs.getLong("Codigo"));
			pedido.setDataPedido(oRs.getDate("DataPedido"));
			pedido.setHoraPedido(oRs.getString("HoraPedido"));
			pedido.setDataPagamento(oRs.getDate("DataPagamento"));			
			pedido.setHoraPagamento(oRs.getString("HoraPagamento"));
			pedido.setQuantidadeParcelas(oRs.getInt("Parcelas"));
			pedido.setCodigoRastreanemto(oRs.getString("Rastreamento"));
			pedido.setvalorTotal(oRs.getFloat("TotalPedido"));
			// Preenche o status do pedido
				TipoStatusPedido tipo = new TipoStatusPedido();
				tipo = tipo.listarPorCodigo(oRs.getInt("CodStatus"));
				pedido.setTipoStatus(tipo);
				tipo = null;
			// Preenche a forma de pagameto
				TipoFormaPagamento pgto = new TipoFormaPagamento();
				pgto = pgto.retornarFormaPGTOporCodigo(oRs.getInt("CodPag"));
				pedido.setTipoFormas(pgto);
				pgto = null;
			// preenche o endereco
				Endereco end = new Endereco();
				end = end.BuscarEnderecoCodigo(oRs.getLong("CodEndereco"),"U");
				pedido.setEndereco(end);	
				end = null;
			// preenche os itens
				Item item = new Item();
				Vector<Item> itens = item.listarItensPedido(oRs.getLong("Codigo"));
				pedido.setItem(itens);	
				item = null;
				itens = null;
			// inseri item no vetor
				lista.addElement(pedido);			
		}				
		return lista;		
	}	
	
	public Vector<PedidoDesktopWAP> listarPorStatus(int codigo, long CodUsu) throws SQLException
	{
		
		Vector<PedidoDesktopWAP> lista = new Vector<PedidoDesktopWAP>();
		
		ResultSet oRs = null;			
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo");
		sSQL.append(" , u._nome AS Nome");
		sSQL.append(" , t._descricao AS Status");
		sSQL.append(" , t._codigo AS CodStatus");
		sSQL.append(" , f._descricao AS Pagamento");
		sSQL.append(" , p._formapagamento AS CodPag");
		sSQL.append(" , p._datapedido AS DataPedido");
		sSQL.append(" , p._horapedido AS HoraPedido");
		sSQL.append(" , p._datapagamento AS DataPagamento");
		sSQL.append(" , p._horapagamento AS HoraPagamento");
		sSQL.append(" , p._parcelas AS Parcelas");
		sSQL.append(" , p._codigorastreamento AS Rastreamento");
		sSQL.append(" , p._totalpedido AS TotalPedido");
		sSQL.append(" , e._codigo AS CodEndereco");
		sSQL.append(" FROM pedidodesktopwap AS p INNER JOIN usuario AS u ON");
		sSQL.append(" p._usuario = u._codigo");
		sSQL.append(" INNER JOIN tipostatuspedido AS t ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" INNER JOIN tipoformapagamento  AS f ON");
		sSQL.append(" p._formapagamento = f._codigo");
		sSQL.append(" INNER JOIN endereco AS e ON");
		sSQL.append(" p._codigoendereco = e._codigo");
		sSQL.append(" WHERE");
		sSQL.append(" ( p._tipostatuspedido = ? AND p._usuario = ? ) ORDER BY p._datapedido ASC");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setLong(1, codigo);
			pstmt.setLong(2, CodUsu);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		
		while (oRs.next())
		{
			PedidoDesktopWAP pedido = new PedidoDesktopWAP();
			pedido.setCodigo(oRs.getLong("Codigo"));
			pedido.setDataPedido(oRs.getDate("DataPedido"));
			pedido.setHoraPedido(oRs.getString("HoraPedido"));
			pedido.setDataPagamento(oRs.getDate("DataPagamento"));			
			pedido.setHoraPagamento(oRs.getString("HoraPagamento"));
			pedido.setQuantidadeParcelas(oRs.getInt("Parcelas"));
			pedido.setCodigoRastreanemto(oRs.getString("Rastreamento"));
			pedido.setvalorTotal(oRs.getFloat("TotalPedido"));
			// Preenche o status do pedido
				TipoStatusPedido tipo = new TipoStatusPedido();
				tipo = tipo.listarPorCodigo(oRs.getInt("CodStatus"));
				pedido.setTipoStatus(tipo);
				tipo = null;
			// Preenche a forma de pagameto
				TipoFormaPagamento pgto = new TipoFormaPagamento();
				pgto = pgto.retornarFormaPGTOporCodigo(oRs.getInt("CodPag"));
				pedido.setTipoFormas(pgto);
				pgto = null;
			// preenche o endereco
				Endereco end = new Endereco();
				end = end.BuscarEnderecoCodigo(oRs.getLong("CodEndereco"), "U");
				pedido.setEndereco(end);	
				end = null;
			// preenche os itens
				Item item = new Item();
				Vector<Item> itens = item.listarItensPedido(oRs.getLong("Codigo"));
				pedido.setItem(itens);	
				item = null;
				itens = null;
			// inseri item no vetor
				lista.addElement(pedido);			
		}				
		return lista;		
	}	
	
	public PedidoDesktopWAP listarPorCodigo(long codigo) throws SQLException
	{
		PedidoDesktopWAP pedido = new PedidoDesktopWAP();
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo");
		sSQL.append(" , u._nome AS Nome");
		sSQL.append(" , t._descricao AS Status");
		sSQL.append(" , t._codigo AS CodStatus");
		sSQL.append(" , f._descricao AS Pagamento");
		sSQL.append(" , p._formapagamento AS CodPag");
		sSQL.append(" , p._datapedido AS DataPedido");
		sSQL.append(" , p._horapedido AS HoraPedido");
		sSQL.append(" , p._datapagamento AS DataPagamento");
		sSQL.append(" , p._horapagamento AS HoraPagamento");
		sSQL.append(" , p._parcelas AS Parcelas");
		sSQL.append(" , p._codigorastreamento AS Rastreamento");
		sSQL.append(" , p._totalpedido AS TotalPedido");
		sSQL.append(" , e._codigo AS CodEndereco");
		sSQL.append(" FROM pedidodesktopwap AS p INNER JOIN usuario AS u ON");
		sSQL.append(" p._usuario = u._codigo");
		sSQL.append(" INNER JOIN tipostatuspedido AS t ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" INNER JOIN tipoformapagamento  AS f ON");
		sSQL.append(" p._formapagamento = f._codigo");
		sSQL.append(" INNER JOIN endereco AS e ON");
		sSQL.append(" p._codigoendereco = e._codigo");
		sSQL.append(" WHERE");
		sSQL.append(" p._codigo = ?");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setLong(1, codigo);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		
		if (oRs.next())
		{
			pedido.setCodigo(oRs.getLong("Codigo"));
			pedido.setDataPedido(oRs.getDate("DataPedido"));
			pedido.setHoraPedido(oRs.getString("HoraPedido"));
			pedido.setDataPagamento(oRs.getDate("DataPagamento"));			
			pedido.setHoraPagamento(oRs.getString("HoraPagamento"));
			pedido.setQuantidadeParcelas(oRs.getInt("Parcelas"));
			pedido.setCodigoRastreanemto(oRs.getString("Rastreamento"));
			pedido.setvalorTotal(oRs.getFloat("TotalPedido"));
			// Preenche o status do pedido
				TipoStatusPedido tipo = new TipoStatusPedido();
				tipo = tipo.listarPorCodigo(oRs.getInt("CodStatus"));
				pedido.setTipoStatus(tipo);
			// Preenche a forma de pagameto
				TipoFormaPagamento pgto = new TipoFormaPagamento();
				pgto = pgto.retornarFormaPGTOporCodigo(oRs.getInt("CodPag"));
				pedido.setTipoFormas(pgto);
			// preenche o endereco
				Endereco end = new Endereco();
				end = end.BuscarEnderecoCodigo(oRs.getLong("CodEndereco"),"U");
				pedido.setEndereco(end);
				
			// Preenche os itens do pedido
				Item item = new Item();
				Vector<Item> itens = item.listarItensPedido(codigo);
				pedido.setItem(itens);				
		}	
		else
		{
			pedido = null;
		}	
		return pedido;
	}
	
	public PedidoDesktopWAP listarPorCodigo(long codigo, long CodUsu) throws SQLException
	{
		PedidoDesktopWAP pedido = new PedidoDesktopWAP();
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo");
		sSQL.append(" , u._nome AS Nome");
		sSQL.append(" , t._descricao AS Status");
		sSQL.append(" , t._codigo AS CodStatus");
		sSQL.append(" , f._descricao AS Pagamento");
		sSQL.append(" , p._formapagamento AS CodPag");
		sSQL.append(" , p._datapedido AS DataPedido");
		sSQL.append(" , p._horapedido AS HoraPedido");
		sSQL.append(" , p._datapagamento AS DataPagamento");
		sSQL.append(" , p._horapagamento AS HoraPagamento");
		sSQL.append(" , p._parcelas AS Parcelas");
		sSQL.append(" , p._codigorastreamento AS Rastreamento");
		sSQL.append(" , p._totalpedido AS TotalPedido");
		sSQL.append(" , e._codigo AS CodEndereco");
		sSQL.append(" FROM pedidodesktopwap AS p INNER JOIN usuario AS u ON");
		sSQL.append(" p._usuario = u._codigo");
		sSQL.append(" INNER JOIN tipostatuspedido AS t ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" INNER JOIN tipoformapagamento  AS f ON");
		sSQL.append(" p._formapagamento = f._codigo");
		sSQL.append(" INNER JOIN endereco AS e ON");
		sSQL.append(" p._codigoendereco = e._codigo");
		sSQL.append(" WHERE");
		sSQL.append("  ( p._codigo = ? AND p._usuario = ? )");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setLong(1, codigo);
			pstmt.setLong(2, CodUsu);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		
		if (oRs.next())
		{
			pedido.setCodigo(oRs.getLong("Codigo"));
			pedido.setDataPedido(oRs.getDate("DataPedido"));
			pedido.setHoraPedido(oRs.getString("HoraPedido"));
			pedido.setDataPagamento(oRs.getDate("DataPagamento"));			
			pedido.setHoraPagamento(oRs.getString("HoraPagamento"));
			pedido.setQuantidadeParcelas(oRs.getInt("Parcelas"));
			pedido.setCodigoRastreanemto(oRs.getString("Rastreamento"));
			pedido.setvalorTotal(oRs.getFloat("TotalPedido"));
			// Preenche o status do pedido
				TipoStatusPedido tipo = new TipoStatusPedido();
				tipo = tipo.listarPorCodigo(oRs.getInt("CodStatus"));
				pedido.setTipoStatus(tipo);
			// Preenche a forma de pagameto
				TipoFormaPagamento pgto = new TipoFormaPagamento();
				pgto = pgto.retornarFormaPGTOporCodigo(oRs.getInt("CodPag"));
				pedido.setTipoFormas(pgto);
			// preenche o endereco
				Endereco end = new Endereco();
				end = end.BuscarEnderecoCodigo(oRs.getLong("CodEndereco"),"U");
				pedido.setEndereco(end);
				
			// Preenche os itens do pedido
				Item item = new Item();
				Vector<Item> itens = item.listarItensPedido(codigo);
				pedido.setItem(itens);				
		}	
		else
		{
			pedido = null;
		}	
		return pedido;
	}
	
	public long retornarEnderecoPedido(long lCodigoPedido) throws SQLException
	{
		long codigoEndereco;
		String sSQL = "SELECT _codigoendereco FROM pedidodesktopwap WHERE _codigo = ?";
		
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.setLong(1, lCodigoPedido);
			
			ResultSet oRs = pstmt.executeQuery();
			oRs.next();
			codigoEndereco = oRs.getLong("_codigoendereco");			
		}
		catch (SQLException e) { throw e;}
		
		return codigoEndereco;
	}
	
	public ResultSet retornarTodosPedidos() throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao();
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS Codigo, _datapedido AS Data,  _tipostatuspedido AS Status");
		sSQL.append(" FROM");
		sSQL.append(" PEDIDODESKTOPWAP");
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			rs = pstmt.executeQuery();
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }		
		return rs;	
	}
	
	public ResultSet retornarPedidosCodigo(int Codigo, Usuario CodUsu) throws SQLException
	{
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo, p._datapedido AS Data, t._descricao AS Status, t._codigo AS CodStatus");
		sSQL.append(" FROM");
		sSQL.append(" pedidodesktopwap AS p INNER JOIN tipostatuspedido AS t");
		sSQL.append(" ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" WHERE ( (p._codigo = ?)");
		sSQL.append(" AND (p._usuario = ?) )");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setInt(1, Codigo);
			pstmt.setLong(2, CodUsu.getCodigo());
			oRs = pstmt.executeQuery();
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		return oRs;	
	}

	public ResultSet retornarPedidosStatus(int Status, Usuario CodUsu) throws SQLException
	{
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo, p._datapedido AS Data, t._descricao AS Status, t._codigo AS CodStatus");
		sSQL.append(" FROM");
		sSQL.append(" pedidodesktopwap AS p INNER JOIN tipostatuspedido AS t");
		sSQL.append(" ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" WHERE (");
		sSQL.append(" (t._codigo = ?)");
		sSQL.append(" AND");
		sSQL.append(" (p._usuario = ?) )");
		Connection conexao = Util.getConexao();
		try
		{			
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setInt(1, Status);
			pstmt.setLong(2, CodUsu.getCodigo());
			oRs = pstmt.executeQuery();
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		return oRs;	
	}
	
	public ResultSet retornarPedidosData(Date Ini, Date Fim, Usuario CodUsu) throws SQLException
	{
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo, p._datapedido AS Data, t._descricao AS Status, t._codigo AS CodStatus");
		sSQL.append(" FROM");
		sSQL.append(" pedidodesktopwap AS p INNER JOIN tipostatuspedido AS t");
		sSQL.append(" ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" WHERE (");
		sSQL.append(" (p._datapedido BETWEEN ? AND ? )");
		sSQL.append(" AND");
		sSQL.append(" (p._usuario = ?) )");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setDate(1, Ini);
			pstmt.setDate(2, Fim);
			pstmt.setLong(3, CodUsu.getCodigo());
			oRs = pstmt.executeQuery();
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		return oRs;	
	}	
	
	public ResultSet retornarDetalhes (long Codigo)throws SQLException
	{
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" p._codigo AS Codigo");
		sSQL.append(" , u._nome AS Nome");
		sSQL.append(" , t._descricao AS Status");
		sSQL.append(" , t._codigo AS CodStatus");
		sSQL.append(" , f._descricao AS Pagamento");
		sSQL.append(" , p._datapedido AS DataPedido");
		sSQL.append(" , p._horapedido AS HoraPedido");
		sSQL.append(" , p._datapagamento AS DataPagamento");
		sSQL.append(" , p._horapagamento AS HoraPagamento");
		sSQL.append(" , p._parcelas AS Parcelas");
		sSQL.append(" , p._codigorastreamento AS Rastreamento");
		sSQL.append(" , p._totalpedido AS TotalPedido");
		sSQL.append(" , e._codigo AS CodEndereco");
		sSQL.append(" FROM pedidodesktopwap AS p INNER JOIN usuario AS u ON");
		sSQL.append(" p._usuario = u._codigo");
		sSQL.append(" INNER JOIN tipostatuspedido AS t ON");
		sSQL.append(" p._tipostatuspedido = t._codigo");
		sSQL.append(" INNER JOIN tipoformapagamento  AS f ON");
		sSQL.append(" p._formapagamento = f._codigo");
		sSQL.append(" INNER JOIN endereco AS e ON");
		sSQL.append(" p._codigoendereco = e._codigo");
		sSQL.append(" WHERE");
		sSQL.append(" p._codigo = ?");
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.clearParameters();
			pstmt.setLong(1, Codigo);
			oRs = pstmt.executeQuery();			
		}
		catch(SQLException ex){throw new SQLException(ex.getMessage());}
		finally { Util.fecharConexao(conexao); }
		return oRs;
	}
		
//	public void inserirPedido(PedidoDesktopWAP pedido) throws SQLException, Exception
//	{
//        Connection conexao = Util.getConexao(); 
//        String sStatus;
//        try
//        {
//        	CallableStatement cs;
//    		cs = conexao.prepareCall("{ ? = call operacao_pedidodesktopwap(?,?,?,?,?,?,?,?)}");
//    		cs.registerOutParameter(1, Types.VARCHAR);
//    		cs.setString(2, "I");
//    		cs.setLong(3, pedido.getCodigo());
//    		cs.setLong(4, pedido.getUsuario().getCodigo());
//    		cs.setInt(5, pedido.getTipoStatus().getCodigo());
//    	 	cs.setInt(6, pedido.getTipoFormas().getCodigo());
//    		cs.setDouble(7, pedido.getvalorTotal());
//    		cs.setInt(8, pedido.getQuantidadeParcelas());
//    		cs.setLong(9, pedido.getEndereco().getCodigo());//
//    		cs.execute();
//    		sStatus = cs.getString(1);
//    		cs.close(); 	
//          }
//        catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
//   	    catch (Exception erro){throw new Exception(erro.getMessage());}	
//   	    finally { Util.fecharConexao(conexao); }
//	}
	
	public void alterarPedido(int status, String codigoRastreamento) throws SQLException, Exception
	{
		String sSQL = "UPDATE pedidodesktopwap SET _tipostatuspedido = ?, _codigorastreamento = ? WHERE _codigo = ?";
		
		Connection conexao = Util.getConexao();
		try
		{
			conexao.setAutoCommit(false);
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			pstmt.setInt(1, status);
			pstmt.setString(2, codigoRastreamento);
			pstmt.setLong(3, getCodigo());
			pstmt.executeUpdate();
			conexao.commit();
		}
        catch (SQLException erro){ conexao.rollback(); throw new SQLException(erro.getMessage()); }
   	    catch (Exception erro){throw new Exception(erro.getMessage());}	
   	    finally { Util.fecharConexao(conexao); }
	}
	
	//Totais de Pedidos	
	public ResultSet TotalizacaoPedidos() throws SQLException
	{
		Connection conexao = Util.getConexao( );
		try
		{	//Monta Query
			String sSQL = "";
			
			sSQL += "select ";
			sSQL += "   count(pd.*) as total "; 
			sSQL += "   ,pd._tipostatuspedido ";
			sSQL += "   ,st._descricao ";
			sSQL += "from pedidodesktopwap as pd ";
			sSQL += "  inner join tipostatuspedido as st on st._codigo = pd._tipostatuspedido ";
			sSQL += "group by ";
			sSQL += "pd._tipostatuspedido ";
			sSQL += ",st._descricao ";
			sSQL += "order by total desc; ";			
			
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			ResultSet rs = (ResultSet)pstmt.executeQuery();		
			
			return rs;
			
		}// FInal do TRY
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		
		
	}// Fim do Método
	
	
	
	//Início - Diogo
	/**
	 * Método que lista o código de 
	 * todos os pedidos pagos, com status aguardando envio.
	 */
	public ResultSet listarPedidosPagos(){
		ResultSet rs = null;
		String sql = "select _codigo from pedidodesktopwap " +
				"where _tipostatuspedido=3";
		Connection con = Util.getConexao();
		try {
			Statement pst = con.createStatement();
			rs = pst.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Util.fecharConexao(con);
		}
		return rs;
	}

	/**
	 * Método que atualiza o status dos pedidos enviados.
	 */
	public String alterarStatusPedido(long cod, String descricao){
		Connection con = Util.getConexao();
		String status = null;
		String sql = "update pedidodesktopwap set _tipostatuspedido = 4 " +
				" where _codigo ="+ cod;
		try {
			Statement pst = con.createStatement();
			pst.execute(sql);
		}catch(SQLException e) {
			status = e.getMessage();
		}finally{
			Util.fecharConexao(con);
		}
		return status;
	}
	//Fim - Diogo 
	
	
} //Final da Classe


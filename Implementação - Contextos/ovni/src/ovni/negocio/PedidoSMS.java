package ovni.negocio;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

import ovni.util.TEF;
import ovni.util.Util;

public class PedidoSMS  implements Runnable
{
		// Atributos da Classe
		private Vector<PedidoSMS> SMSs = new Vector<PedidoSMS>();

		private long _codigo = 0;
		private Produto _produto;
		private Usuario _usuario;
		private int _quantidade;
		private double _valorTotal;
		private double _valorFrete;
		private double _valorcompra;
		private int _tipostatuspedido;
		private String _descrstatuspedido;
		private Endereco _endereco;
		private FreteCorreios _frete;
		private int _servicoenvio = 41106;
		private boolean _aprovado;
		 
	    // Métodos de Acesso 
		public long getCodigo() 
		{	return _codigo;		}
		public void setCodigo(long lCodigo) 
		{	this._codigo = lCodigo;		}
		
		public Produto getProduto() 
		{	return _produto;		}
		public void setProduto(Produto oProduto) 
		{	this._produto = oProduto;		}
		
		public Usuario getUsuario() 
		{	return _usuario;		}
		public void setUsuario(Usuario oUsuario) 
		{	this._usuario = oUsuario;	}
		
		public int getQuantidade() 
		{	return _quantidade;		}
		public void setQuantidade(int iQuantidade) 
		{	this._quantidade = iQuantidade;		}
		
		public void setvalorTotal(double _valorTotal) 
		{	this._valorTotal = _valorTotal;		}
		public double getvalorTotal() 
		{	return _valorTotal;		}
		
		public void setValorFrete(double _valorFrete) 
		{	this._valorFrete = _valorFrete;		}
		public double getValorFrete()
		{	return _valorFrete;		}
		
		public void setValorCompra(double _valorcompra) 
		{	this._valorcompra = _valorcompra;		}
		public double getValorCompra() 
		{	return _valorcompra;		}
		
		public int getTipoStatusPedido() 
		{	return _tipostatuspedido;		}
		public void setTipoStatusPedido(int iTipoStatusPedido) 
		{	this._tipostatuspedido = iTipoStatusPedido;		}
		
		public String getDescrStatusPedido()
		{  return _descrstatuspedido;    }
	    public void setDescrStatusPedido(String sDescrStatusPedido)
	    {  this._descrstatuspedido = sDescrStatusPedido;}
		
	    public Endereco getEndereco() 
		{	return _endereco;		}
		public void setEndereco(Endereco oEndereco) 
		{	this._endereco = oEndereco;		}
		
		public FreteCorreios getFreteCorreios() 
		{	return _frete;		}
		public void setFreteCorreios(FreteCorreios oFreteCorreios) 
		{	this._frete = oFreteCorreios;	}
		
		public int getServicoEnvio() 
		{	return _servicoenvio;		}
		public void setServicoEnvio(int iServicoEnvio) 
		{	this._servicoenvio = iServicoEnvio;		}
	    
	    // Métodos de Negócio
	    
	    public void setAprovado(boolean _aprovado) {
			this._aprovado = _aprovado;
		}
		public boolean isAprovado() {
			return _aprovado;
		}
		/**
	     * Método para Gerar Pedido via SMS
	     * @return Vector<PedidoSMS>	
	     * @throws SQLException
	     * @throws Exception
	     */
	    public Vector<PedidoSMS> GerarPedido() throws SQLException, Exception
	    {
	       	Vector<PedidoSMS> vctPedidoSMS = new Vector<PedidoSMS>(); 
	    	try
	        {	    		
	    			GerarCodigo();
	    			this.setValorFrete(this.getFreteCorreios().executar(this.getServicoEnvio(),this.getEndereco().getCep(),this.getProduto().getPeso()));	    		
	    			CalcularValorTotal();
	    			String sStatus = Operacao("I"); 
	    			if(sStatus.equals("SUCESSO"))
	    			{
	    				vctPedidoSMS = AcompanharStatusPedido(this._codigo);	    			
	    			}
	       }
	       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
		    return vctPedidoSMS;
	     }  
	    
	    /**
	     * Método para Calcular o valor Total do Pedido
	     * @throws Exception
	     */
	    public void CalcularValorTotal() throws Exception{
		    try
		       {
					this.setvalorTotal(this.getQuantidade() * this.getProduto().getValor());
					this.setValorCompra(this.getvalorTotal() + this.getValorFrete());
		       }
		       	catch (Exception erro){throw new Exception(erro.getMessage());}	
		     }    
	    
	    
	  /**
	   * Método para realizar a Operação desejada no Banco de Dados
	   * @param sTipo
	   * @return String
	   * @throws SQLException
	   * @throws Exception
	   */
	  public String Operacao(String sTipo) throws SQLException, Exception{
	    	 Connection conexao = Util.getConexao(); 
	         String sStatus;
	    	 try
	           {	                  	
	                CallableStatement cs;
	                cs = conexao.prepareCall("{ ? = call operacao_gerarpedidosms(?,?,?,?,?,?,?,?)}");
	                cs.registerOutParameter(1, Types.VARCHAR);
	                cs.setString(2, sTipo);
	                cs.setLong(3, this.getCodigo());
	                cs.setLong(4, this.getProduto().getCodigo());
	                cs.setLong(5, this.getUsuario().getCodigo());	 			
	                cs.setDouble(6, this.getvalorTotal());
	                cs.setDouble(7, this.getValorFrete());
	                cs.setDouble(8, this.getValorCompra());
	                cs.setLong(9, this.getEndereco().getCodigo());
	 				cs.execute();
	 				sStatus = cs.getString(1);
	 				cs.close(); 	 				
	       }
	        catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
		    finally { Util.fecharConexao(conexao); }
		    return sStatus;
	     }
	     
	    /**
	     * Método para Gerar o Código do Pedido
	     * @throws SQLException
	     * @throws Exception
	     */
	    public void GerarCodigo() throws SQLException, Exception
	 	{
	     	ResultSet rs = null;
	     	Connection conexao = Util.getConexao();
	     	try
	        	{
	 			
	 			PreparedStatement pstmt = conexao.prepareStatement("SELECT nextval('sq_pedidosms');");
	 			pstmt.clearParameters();
	 			rs = pstmt.executeQuery(); 
	 			if(rs!= null)
	     		{ 
	     			while(rs.next()) 
	     			{
	     				this.setCodigo(rs.getLong("nextval"));
	     			}                     
	     		}   		
	        	}
	         catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
	 	    catch (Exception erro){throw new Exception(erro.getMessage());}	 
	 	    finally { Util.fecharConexao(conexao); }
	     }        
	    
	    
	    /**
	     * Método para Acompanhar o Status do Pedido via SMS
	     * @param lPedido
	     * @return Vector<PedidoSMS>
	     * @throws SQLException
	     * @throws Exception
	     */
	    public Vector<PedidoSMS> AcompanharStatusPedido(long lPedido)  throws SQLException,Exception
	 	{
	    	ResultSet rs = null;
			Connection conexao = null;
			PreparedStatement pstmt = null;
			conexao = Util.getConexao();
			Vector<PedidoSMS> vctPedidoSMS = new Vector<PedidoSMS>(); 			
			 try {	
				 	String sSQL = "";
				 	sSQL = sSQL +  "  select ";
					sSQL = sSQL +  "	  ped._codigo	";
					sSQL = sSQL +  "	, ped._usuario";
					sSQL = sSQL +  "	, ped._produto	";
					sSQL = sSQL +  "	, ped._statuspedido	";
					sSQL = sSQL +  "	, ped._valortotal	";
					sSQL = sSQL +  "	, ped._frete	";
					sSQL = sSQL +  "	, ped._datapedido	";
					sSQL = sSQL +  "	, ped._valorcompra	";
					sSQL = sSQL +  "	,tps._descricao as _desc_tipostatus ";
					sSQL = sSQL +  " from pedidosms as ped	";
					sSQL = sSQL +  "	inner join tipostatuspedido as tps on tps._codigo = ped._statuspedido	";
					sSQL = sSQL +  "	where ped._codigo = ?  ";
					sSQL = sSQL +  "  order by ped._datapedido";
					 
					pstmt = conexao.prepareStatement(sSQL);
					pstmt.setLong(1, lPedido);					
					rs = (ResultSet) pstmt.executeQuery();
					
					while(rs.next())
					{
						PedidoSMS item = new PedidoSMS();
						Usuario oUsuario = new Usuario();
						oUsuario = oUsuario.BuscarDetalhesDoUsuario(rs.getLong("_usuario"));
						
						Produto oProduto = new Produto();
						oProduto = oProduto.buscarporcodigo(rs.getLong("_produto"));
						
						item.setCodigo(rs.getLong("_codigo"));
						item.setUsuario(oUsuario);
						item.setProduto(oProduto);
						item.setTipoStatusPedido(rs.getInt("_statuspedido"));
						item.setvalorTotal(rs.getDouble("_valortotal"));
						item.setValorFrete(rs.getDouble("_frete"));
						item.setValorCompra(rs.getDouble("_valorcompra"));
						item.setDescrStatusPedido(rs.getString("_desc_tipostatus"));
						vctPedidoSMS.addElement(item);
					}	
			}//Final do try 
			 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		     catch (Exception erro){throw new Exception(erro.getMessage());}	
		     finally { Util.fecharConexao(conexao); }		 
			return vctPedidoSMS;
		}
	    
	    /**
	     * Método para Acompanhar o Status do Pedido via SMS
	     * @param lUsuario, lCodigo
	     * @return Vector<PedidoSMS>
	     * @throws SQLException
	     * @throws Exception
	     */
	    public Vector<PedidoSMS> AcompanharStatusPedidoSMS(long lUsuario, long lCodigo)  throws SQLException,Exception
	 	{
	    	ResultSet rs = null;
			Connection conexao = null;
			PreparedStatement pstmt = null;
			conexao = Util.getConexao();
			Vector<PedidoSMS> vctPedidoSMS = new Vector<PedidoSMS>(); 			
			 try {	
				 	String sSQL = "";
				 	sSQL = sSQL +  "  select ";
					sSQL = sSQL +  "	  ped._codigo	";
					sSQL = sSQL +  "	, ped._usuario";
					sSQL = sSQL +  "	, ped._produto	";
					sSQL = sSQL +  "	, ped._statuspedido	";
					sSQL = sSQL +  "	, ped._valortotal	";
					sSQL = sSQL +  "	, ped._frete	";
					sSQL = sSQL +  "	, ped._datapedido	";
					sSQL = sSQL +  "	, ped._valorcompra	";
					sSQL = sSQL +  "	,tps._descricao as _desc_tipostatus ";
					sSQL = sSQL +  " from pedidosms as ped	";
					sSQL = sSQL +  "	inner join tipostatuspedido as tps on tps._codigo = ped._statuspedido	";
					sSQL = sSQL +  "	where ped._usuario = ? and ped._codigo = ? ";
					sSQL = sSQL +  "  order by ped._datapedido";
					 
					pstmt = conexao.prepareStatement(sSQL);
					pstmt.setLong(1, lUsuario);	
					pstmt.setLong(2, lCodigo);	
					rs = (ResultSet) pstmt.executeQuery();
					
					while(rs.next())
					{
						PedidoSMS item = new PedidoSMS();
						Usuario oUsuario = new Usuario();
						oUsuario = oUsuario.BuscarDetalhesDoUsuario(rs.getLong("_usuario"));
						
						Produto oProduto = new Produto();
						oProduto = oProduto.buscarporcodigo(rs.getLong("_produto"));
						
						item.setCodigo(rs.getLong("_codigo"));
						item.setUsuario(oUsuario);
						item.setProduto(oProduto);
						item.setTipoStatusPedido(rs.getInt("_statuspedido"));
						item.setvalorTotal(rs.getDouble("_valortotal"));
						item.setValorFrete(rs.getDouble("_frete"));
						item.setValorCompra(rs.getDouble("_valorcompra"));
						item.setDescrStatusPedido(rs.getString("_desc_tipostatus"));
						vctPedidoSMS.addElement(item);
					}	
			}//Final do try 
			 catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		     catch (Exception erro){throw new Exception(erro.getMessage());}	
		     finally { Util.fecharConexao(conexao); }		 
			return vctPedidoSMS;
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
				sSQL += "   ,pd._statuspedido ";
				sSQL += "   ,st._descricao ";
				sSQL += "from pedidosms as pd ";
				sSQL += "  inner join tipostatuspedido as st on st._codigo = pd._statuspedido ";
				sSQL += "group by ";
				sSQL += "pd._statuspedido ";
				sSQL += ",st._descricao ";
				sSQL += "order by total desc; ";			
				
				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
				ResultSet rs = (ResultSet)pstmt.executeQuery();		
				
				return rs;
				
			}// FInal do TRY
			catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
			finally { Util.fecharConexao(conexao); }
			
			
		}// Fim do Método
	    
		public static Vector<PedidoSMS> listar( ) throws SQLException
		{
			Vector<PedidoSMS> lista = new Vector<PedidoSMS>();
			
			//sql para consulta
			String sqlConsulta = "SELECT _codigo, _usuario, _valortotal FROM pedidosms";
			
			//sql para recuperar o usuario
			String sqlRecuperarUsuario = "SELECT * FROM usuario WHERE _codigo = ?";
			
			Connection conexao = Util.getConexao();
			ResultSet oRs = null;
			ResultSet oRsUsu = null;
			try
			{
				PreparedStatement pstmtConsulta = conexao.prepareStatement(sqlConsulta);
				PreparedStatement pstmtUsuario = conexao.prepareStatement(sqlRecuperarUsuario);
				oRs = pstmtConsulta.executeQuery();
			
				while (oRs.next())
				{
					PedidoSMS pedido = new PedidoSMS();
					pedido.setCodigo(oRs.getLong("_codigo"));
					pedido.setvalorTotal(oRs.getDouble("_valortotal"));
					
					pstmtUsuario.setLong(1, oRs.getLong("_usuario"));
					oRsUsu = pstmtUsuario.executeQuery();
					oRsUsu.next();
					
					Usuario usu = new Usuario();
					usu.Preecher(oRsUsu);
					
					pedido.setUsuario(usu);
					
					lista.addElement(pedido);					
				}
			}
			catch (SQLException e) { }
			finally { Util.fecharConexao(conexao); }
						
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
				SMSs = PedidoSMS.listar();
			} catch (SQLException e) { }		
			
			for (int ind = 0; ind < SMSs.size(); ind++)
			{
				try 
				{
					String nomeArq = TEF.getPathSMSSEND() + SMSs.elementAt(ind).getCodigo() + ".txt";
					BufferedWriter escreve = new BufferedWriter(new FileWriter(nomeArq));
					escreve.write(Long.toString(SMSs.elementAt(ind).getUsuario().getCelular()));
					escreve.write("|");
					escreve.write(Double.toString(SMSs.elementAt(ind).getvalorTotal()));
					escreve.newLine();
					escreve.close();		
				}
				catch (Exception e) {}
				
				try
				{
					boolean naoLido = true;
					
					while (naoLido)
					{
						Thread.sleep(10000);
						File f = new File(TEF.getPathSMSRECEIVE() + SMSs.elementAt(ind).getUsuario().getCelular() + ".txt");
			
						if (f.exists())
						{
							BufferedReader in = new BufferedReader(new FileReader(f));
							String str;
							str = in.readLine();
					        in.close();
					        if (str.equals("APROVADO"))
					        {	
					        	SMSs.elementAt(ind).setAprovado(true);
					        	f.delete();
					        	naoLido = false;				       
					        }
					        else
					        {
					        	SMSs.elementAt(ind).setAprovado(false);
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
				catch (Exception e) {}		
				
			}
			//depois do for
			try {
				updateStatusAprovado(SMSs);
			} catch (SQLException e) {}
			
		}

		public void updateStatusAprovado(Vector<PedidoSMS> SMSs) throws SQLException
		{
			String sqlPedido = "UPDATE pedidosms set _statuspedido = 3 WHERE _codigo = ?";
			
			Connection conexao = Util.getConexao();		
			try
			{
				conexao.setAutoCommit(false);
				for (int i = 0; i < SMSs.size(); i++ )
				{
					
					if (SMSs.elementAt(i).isAprovado())
					{				
						PreparedStatement pstmtPedido = conexao.prepareStatement(sqlPedido);
						pstmtPedido.setLong(1, SMSs.elementAt(i).getCodigo());
						pstmtPedido.executeUpdate();
					}
				}
				conexao.commit();
			}
			catch (SQLException e) {conexao.rollback();}
			finally{Util.fecharConexao(conexao);}		
		}		
}



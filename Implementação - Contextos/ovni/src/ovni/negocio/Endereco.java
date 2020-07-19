package ovni.negocio;
import ovni.util.Util;
import java.sql.*;
import java.math.*; 
import java.util.Vector;

public class Endereco {
    
    /** Atributos da Classe */
    private long _codigo = 0;
    private String _cep;
    private String _rua;
    private int _numero;
    private int _caixapostal;
    private String _complemento;
    private String _bairro;
    private String _municipio;
    private String _estado;
    private String _pais;
    private String _nomereceptor;
    private String _referenciaentrega;
    private int _tipoendereco;
    private long _codigoobjeto;
    private String _tipoobjeto;
    private String _status;
    private String _desctipoendereco;
    private boolean _endcelular;
	 
    /** Construtor Vazio de Produto */
    public Endereco() {
    }
       
    /** Métodos de Acesso */     
    public long getCodigo() 
    {  return _codigo;    }
    public void setCodigo(long lCodigo)
    {  this._codigo = lCodigo;    }
    
    public String getCep() 
    {  return _cep;    }
    public void setCep(String sCep)
    {  this._cep = sCep;    }
    
    public String getRua() 
    {  return _rua;    }
    public void setRua(String sRua)
    {  this._rua = sRua;    }
   
    public int getNumero() 
    {  return _numero;    }
    public void setNumero(int iNumero)
    {  this._numero = iNumero;    }
    
    public int getCaixaPostal() 
    {  return _caixapostal;    }
    public void setCaixaPostal(int iCaixaPostal)
    {  this._caixapostal = iCaixaPostal;    }
    
    public String getComplemento() 
    {  return _complemento;    }
    public void setComplemento(String sComplemento)
    {  this._complemento = sComplemento;    }
   
    public String getBairro() 
    {  return _bairro;    }
    public void setBairro(String sBairro)
    {  this._bairro = sBairro;    }   
   
    public String getMunicipio() 
    {  return _municipio;    }
    public void setMunicipio(String sMunicipio)
    {  this._municipio = sMunicipio;    }
    
    public String getEstado() 
    {  return _estado;    }
    public void setEstado(String sEstado)
    {  this._estado = sEstado;    }
    
    public String getPais() 
    {  return _pais;    }
    public void setPais(String sPais)
    {  this._pais = sPais;    }
    
    public String getNomeReceptor() 
    {  return _nomereceptor;    }
    public void setNomeReceptor(String sNomeReceptor)
    {  this._nomereceptor = sNomeReceptor;    }
    
    public String getReferenciaEntrega() 
    {  return _referenciaentrega;    }
    public void setReferenciaEntrega(String sReferenciaEntrega)
    {  this._referenciaentrega = sReferenciaEntrega;    }
    
    public int getTipoEndereco() 
    {  return _tipoendereco;    }
    public void setTipoEndereco(int iTipoEndereco)
    {  this._tipoendereco = iTipoEndereco;    }
    
    public long getCodigoObjeto() 
    {  return _codigoobjeto;    }
    public void setCodigoObjeto(long lCodigoObjeto)
    {  this._codigoobjeto = lCodigoObjeto;    }    
    
    public String getTipoObjeto()
    {  return _tipoobjeto;    }
    public void setTipoObjeto(String sTipoObjeto)
    {  this._tipoobjeto = sTipoObjeto;    }  
    
    public String getDescTipoEndereco()
    {  return _desctipoendereco;    }
    public void setDescTipoEndereco(String sDescTipoEndereco)
    {  this._desctipoendereco = sDescTipoEndereco;    } 
    
    public String getStatus()
    {  return _status;    }
    public void setStatus(String sStatus)
    {  this._status = sStatus;    } 
    
    public boolean getEndCelular() 
    {  return _endcelular;    }
    public void setEndCelular(boolean bEndCelular)
    {  this._endcelular = bEndCelular;    }
    
    /** Métodos de Negócio */
    public void InserirEndereco() throws SQLException, Exception{
    try
       {
			Operacao("I"); 
       }
       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
     }    
     
     public void AtualizarEndereco() throws SQLException, Exception{
     try
       {
			Operacao("A"); 
       }
       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
     }   
     
     public void ExcluirEndereco() throws SQLException, Exception{
     try
       {
			Operacao("E");  
       }
       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
     }         
    
     // Realiza Operação desejada no Banco de Dados
     public void Operacao(String sTipo) throws SQLException, Exception{
    	 Connection conexao = Util.getConexao();  
     try
       {       	         	
    	 CallableStatement cs;
  		cs = conexao.prepareCall("{ ? = call operacao_endereco(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
 		cs.registerOutParameter(1, Types.VARCHAR);
 		cs.setString(2, sTipo);
 		cs.setString(3, this.getTipoObjeto());
 		cs.setLong(4, this.getCodigo());
        cs.setString(5, this.getCep());
  		cs.setString(6, this.getRua());
  		cs.setInt(7, this.getNumero());
  		cs.setInt(8, this.getCaixaPostal());
  		cs.setString(9, this.getComplemento());
  		cs.setString(10, this.getBairro());
  		cs.setString(11, this.getMunicipio());
  		cs.setString(12, this.getEstado());
  		cs.setString(13, this.getPais());
  		cs.setString(14, this.getNomeReceptor());
  		cs.setString(15, this.getReferenciaEntrega());
  		cs.setInt(16, this.getTipoEndereco());
  		cs.setLong(17, this.getCodigoObjeto());
  		cs.setBoolean(18, this.getEndCelular());
  		cs.execute();
 		String Status = cs.getString(1);
 		setStatus(Status);
 		cs.close();	
       }
       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
	    finally { Util.fecharConexao(conexao); }
     }

 	// Método para Pesquisar Endereço disponiveis... 
 	public Vector<Endereco> BuscarEnderecoTodos(long lCodigoObjeto,String sTipoObjeto) throws SQLException
 	{
 		ResultSet rs = null;
 		Connection conexao = Util.getConexao( );
 		Vector<Endereco> vctEndereco = new Vector<Endereco>();
         /** Inicio do Try */
 		try
 		{
 			if(sTipoObjeto.equals("F"))
 			{
 				/** Monta a Query para Fornecedor*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._fornecedor as CodigoObjeto	   			          	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";
 				sSQL = sSQL +  "    where e._fornecedor= ?       						    ";	
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();			
 				while(rs.next())
 				{
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("NomeReceptor"));		
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}
 			else
 			{
 				/** Monta a Query para Usuario*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
             	sSQL = sSQL +  "    ,e._usuario as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";	
 				sSQL = sSQL +  "    where e._usuario= ? 							        ";	
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();
 				while(rs.next())
 				{		
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("NomeReceptor"));
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}	
 		}/** Final do Try */ 
 		catch( SQLException erro) { throw new SQLException(erro.getMessage() ); }
 		finally { Util.fecharConexao(conexao); }
 		return vctEndereco ;
 	}  
 	
 	// Método para Pesquisar Endereço disponiveis... 
 	public Vector<Endereco> BuscarEnderecoTipoEndereco(long lCodigoObjeto,String sTipoObjeto,String sTipoEndereco) throws SQLException
 	{
 		ResultSet rs = null;
 		Connection conexao = Util.getConexao( );
 		Vector<Endereco> vctEndereco = new Vector<Endereco>();
         /** Inicio do Try */
 		try
 		{
 			if(sTipoObjeto.equals("F"))
 			{
 				/** Monta a Query para Fornecedor*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     							";
 				sSQL = sSQL +  "     e._codigo as Codigo                        							";
 				sSQL = sSQL +  "    ,e._cep as Cep            												";
 				sSQL = sSQL +  "    ,e._rua as Rua              											";
 				sSQL = sSQL +  "    ,e._numero as Numero                            						";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          								";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          				";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        											";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      						";
             	sSQL = sSQL +  "    ,e._estado as Estado                          							";
 				sSQL = sSQL +  "    ,e._pais as Pais                              							";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor										";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             					";
             	sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
             	sSQL = sSQL +  "    ,e._fornecedor as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";				
 				sSQL = sSQL +  "    where e._fornecedor= ? and tpe._descricao ILIKE '%"+sTipoEndereco+"%'   ";	
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
 				
 	           
 	           
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();			
 				while(rs.next())
 				{
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("NomeReceptor"));	
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}
 			else
 			{
 				/** Monta a Query para Usuario*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
             	sSQL = sSQL +  "    ,e._usuario as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";				
 				sSQL = sSQL +  "    where e._usuario= ? and tpe._descricao ILIKE '%"+sTipoEndereco+"%'   ";	
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
 				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();			
 				while(rs.next())
 				{
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("NomeReceptor"));		
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}	
 		}/** Final do Try */ 
 		catch( SQLException erro) { throw new SQLException(erro.getMessage() ); }
 		finally { Util.fecharConexao(conexao); }
 		return vctEndereco ;
 	}  
 	
 	// Método para Pesquisar Endereço disponiveis... 
 	public Vector<Endereco> BuscarEnderecoRua(long lCodigoObjeto,String sTipoObjeto,String sRua) throws SQLException
 	{
 		ResultSet rs = null;
 		Connection conexao = Util.getConexao( );
 		Vector<Endereco> vctEndereco = new Vector<Endereco>();
         /** Inicio do Try */
 		try
 		{
 			if(sTipoObjeto.equals("F"))
 			{
 				/** Monta a Query para Fornecedor*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._fornecedor as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";
 				sSQL = sSQL +  "    where e._fornecedor= ? and e._rua ILIKE '%"+sRua+"%'     ";	
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
 				   				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();			
 				while(rs.next())
 				{
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("ReferenciaEntrega"));			
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}
 			else
 			{
 				/** Monta a Query para Usuario*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._usuario as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";
 				sSQL = sSQL +  "    where e._usuario = ? and e._rua ILIKE '%"+sRua+"%'       ";		
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();
 				while(rs.next())
 				{		
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("ReferenciaEntrega"));		
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}	
 		}/** Final do Try */ 
 		catch( SQLException erro) { throw new SQLException(erro.getMessage() ); }
 		finally { Util.fecharConexao(conexao); }
 		return vctEndereco ;
 	}  
 	
 	// Método para Pesquisar Endereço disponiveis... 
 	public Vector<Endereco> BuscarEndereco(int iTipoEndereco,long lCodigoObjeto,String sTipoObjeto) throws SQLException
 	{
 		ResultSet rs = null;
 		Connection conexao = Util.getConexao( );
 		Vector<Endereco> vctEndereco = new Vector<Endereco>();
         /** Inicio do Try */
 		try
 		{
 			if(sTipoObjeto.equals("F"))
 			{
 				/** Monta a Query para Fornecedor*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._fornecedor as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";
 				sSQL = sSQL +  "    where e._tipoendereco= ? and e._fornecedor= ?           ";	
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, iTipoEndereco);
 				pstmt.setLong(2, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();			
 				while(rs.next())
 				{
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("ReferenciaEntrega"));		
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}
 			else
 			{
 				/** Monta a Query para Usuario*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._usuario as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";
 				sSQL = sSQL +  "    where e._tipoendereco= ? and e._usuario= ? 		        ";	
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, iTipoEndereco);
 				pstmt.setLong(2, lCodigoObjeto);
 				rs = (ResultSet) pstmt.executeQuery();
 				while(rs.next())
 				{		
 					Endereco oEndereco = new Endereco();
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("ReferenciaEntrega"));	
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 					vctEndereco.addElement(oEndereco);
 				}
 			}	
 		}/** Final do Try */ 
 		catch( SQLException erro) { throw new SQLException(erro.getMessage() ); }
 		finally { Util.fecharConexao(conexao); }
 		return vctEndereco ;
 	}  
 	
 	public Endereco BuscarEnderecoCelular(long lUsuario) throws SQLException
 	{
 		ResultSet rs = null;
 		Connection conexao = Util.getConexao( );
 		Endereco oEndereco = new Endereco();
         /** Inicio do Try */
 		try
 		{
 			/** Monta a Query para Usuario*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     							";
 				sSQL = sSQL +  "     e._codigo as Codigo                        							";
 				sSQL = sSQL +  "    ,e._cep as Cep            												";
 				sSQL = sSQL +  "    ,e._rua as Rua              											";
 				sSQL = sSQL +  "    ,e._numero as Numero                            						";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          								";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          				";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        											";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      						";
             	sSQL = sSQL +  "    ,e._estado as Estado                          							";
 				sSQL = sSQL +  "    ,e._pais as Pais                              							";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            					";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor										";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             					";
             	sSQL = sSQL +  "    ,e._usuario as CodigoObjeto	             								";
 				sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";
 				sSQL = sSQL +  "    where e._celular = TRUE and e._usuario= ? 		        				";		
 	            sSQL = sSQL +  "    order by tpe._codigo;                    								";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lUsuario);
 				rs = pstmt.executeQuery();
 			
 			while(rs.next())
 			{
 				oEndereco.setCodigo(rs.getLong("Codigo"));
 				oEndereco.setCep(rs.getString("Cep"));
 				oEndereco.setRua(rs.getString("Rua"));
 				oEndereco.setNumero(rs.getInt("Numero"));
 				oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 				oEndereco.setComplemento(rs.getString("Complemento"));
 				oEndereco.setBairro(rs.getString("Bairro"));
 				oEndereco.setMunicipio(rs.getString("Municipio"));
 				oEndereco.setPais(rs.getString("Pais"));
 				oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 				oEndereco.setReferenciaEntrega(rs.getString("ReferenciaEntrega"));
 				oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 				oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 			}
 		}/** Final do Try */ 
 		catch( SQLException erro) { throw new SQLException(erro.getMessage() ); }
 		finally { Util.fecharConexao(conexao); }
 		return oEndereco ;
 	}  
 	
 	public Endereco BuscarEnderecoCodigo(long lEndereco,String sTipoObjeto) throws SQLException
 	{
 		ResultSet rs = null;
 		Connection conexao = Util.getConexao( );
 		Endereco oEndereco = new Endereco();
         /** Inicio do Try */
 		try
 		{
 			if(sTipoObjeto.equals("F"))
 			{
 				/** Monta a Query para Fornecedor*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
 				sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._fornecedor as CodigoObjeto	   			          	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";
 				sSQL = sSQL +  "    where e._codigo= ?       						    ";		
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lEndereco);
 				rs = (ResultSet) pstmt.executeQuery();			
 				while(rs.next())
 				{
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("NomeReceptor"));		
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 				}
 			}
 			else
 			{
 				/** Monta a Query para Usuario*/	
 				String sSQL = "";				
 				sSQL = sSQL +  "     select                                     			";
 				sSQL = sSQL +  "     e._codigo as Codigo                        			";
 				sSQL = sSQL +  "    ,e._cep as Cep            								";
 				sSQL = sSQL +  "    ,e._rua as Rua              							";
 				sSQL = sSQL +  "    ,e._numero as Numero                            		";
 				sSQL = sSQL +  "    ,e._caixapostal as CaixaPostal          				";
             	sSQL = sSQL +  "    ,e._complemento as Complemento                          ";
 				sSQL = sSQL +  "    ,e._bairro as Bairro        							";
 				sSQL = sSQL +  "    ,e._municipio as Municipio                      		";
             	sSQL = sSQL +  "    ,e._estado as Estado                          			";
 				sSQL = sSQL +  "    ,e._pais as Pais                              			";
 				sSQL = sSQL +  "    ,e._nomereceptor as NomeReceptor						";
             	sSQL = sSQL +  "    ,e._referenciaentrega as ReferenciaEntrega             	";
             	sSQL = sSQL +  "    ,e._celular as EnderecoCelular			            	";
             	sSQL = sSQL +  "    ,e._usuario as CodigoObjeto	             	";
             	sSQL = sSQL +  "    ,tpe._descricao as TipoEndereco             							";
             	sSQL = sSQL +  "    from endereco as e		                      							";
             	sSQL = sSQL +  "	inner join tipoendereco as tpe on tpe._codigo = e._tipoendereco			";	
 				sSQL = sSQL +  "    where e._codigo= ? 							        ";		
 	            sSQL = sSQL +  "    order by tpe._codigo;                    ";
    				
 				PreparedStatement pstmt = conexao.prepareStatement(sSQL);
 				pstmt.clearParameters();
 				pstmt.setLong(1, lEndereco);
 				rs = (ResultSet) pstmt.executeQuery();
 				while(rs.next())
 				{		
 					oEndereco.setCodigo(rs.getLong("Codigo"));
 					oEndereco.setCep(rs.getString("Cep"));
 					oEndereco.setRua(rs.getString("Rua"));
 					oEndereco.setNumero(rs.getInt("Numero"));
 					oEndereco.setCaixaPostal(rs.getInt("CaixaPostal"));
 					oEndereco.setComplemento(rs.getString("Complemento"));
 					oEndereco.setBairro(rs.getString("Bairro"));
 					oEndereco.setMunicipio(rs.getString("Municipio"));
 					oEndereco.setEstado(rs.getString("Estado"));
 					oEndereco.setDescTipoEndereco(rs.getString("TipoEndereco"));
 					oEndereco.setPais(rs.getString("Pais"));
 					oEndereco.setNomeReceptor(rs.getString("NomeReceptor"));
 					oEndereco.setReferenciaEntrega(rs.getString("NomeReceptor"));
 					oEndereco.setEndCelular(rs.getBoolean("EnderecoCelular"));
 					oEndereco.setCodigoObjeto(rs.getLong("CodigoObjeto"));
 				}
 			}
 		}/** Final do Try */ 
 		catch( SQLException erro) { throw new SQLException(erro.getMessage() ); }
 		finally { Util.fecharConexao(conexao); }
 		return oEndereco ;
 	}  
	
	public ResultSet retornarUltimoEndereco(long Codigo) throws SQLException
	{
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _codigo AS CodEndereco");
		sSQL.append(" , _cep AS CEP");
		sSQL.append(" , _rua AS Rua");
		sSQL.append(" , _numero AS Numero");
		sSQL.append(" , _bairro AS Bairro");
		sSQL.append(" , _municipio AS Cidade");
		sSQL.append(" , _estado AS Estado");
		sSQL.append(" FROM endereco");
		sSQL.append(" WHERE _usuario = ?");
		sSQL.append(" ORDER BY _ultimo DESC");
		
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.setLong(1, Codigo);
			oRs = pstmt.executeQuery();
		}
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}
		
		return oRs;
	}
		
	public ResultSet retornarEnderecoPorCodigo(long Codigo) throws SQLException
	{
		ResultSet oRs = null;
		StringBuilder sSQL = new StringBuilder("SELECT");
		sSQL.append(" _cep AS CEP");
		sSQL.append(" , _rua AS Rua");
		sSQL.append(" , _numero AS Numero");
		sSQL.append(" , _bairro AS Bairro");
		sSQL.append(" , _municipio AS Cidade");
		sSQL.append(" , _estado AS Estado");
		sSQL.append(" , _nomereceptor AS Receptor");
		sSQL.append(" FROM endereco");
		sSQL.append(" WHERE _codigo = ?");
		
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmt = conexao.prepareStatement(sSQL.toString());
			pstmt.setLong(1, Codigo);
			oRs = pstmt.executeQuery();
		}
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}		
		return oRs;
	}
	
	/**
	 * Método para definir o ultimo endereco utilizado pelo usuario em um pedido
	 * @param codigoUsuario - Código do usuario
	 * @param codigoEndereco - Código do ultimo endereco usado em pedido
	 * @throws SQLException
	 */
	public void atribuirUltimo(long codigoUsuario, long codigoEndereco) throws SQLException
	{
		String sqlRemover = "UPDATE endereco SET _ultimo = FALSE WHERE _usuario = ?";
		String sqlAtribuir = "UPDATE endereco SET _ultimo = TRUE WHERE _codigo = ?";
		
		Connection conexao = Util.getConexao();
		try
		{
			PreparedStatement pstmtRemover = conexao.prepareStatement(sqlRemover);
			pstmtRemover.setLong(1, codigoUsuario);
			pstmtRemover.executeUpdate();
			PreparedStatement pstmtAtribuir = conexao.prepareStatement(sqlAtribuir);
			pstmtAtribuir.setLong(1, codigoEndereco);
			pstmtAtribuir.executeUpdate();
			
		}
		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}
	}
}
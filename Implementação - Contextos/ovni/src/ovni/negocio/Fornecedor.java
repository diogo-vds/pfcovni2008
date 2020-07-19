package ovni.negocio;

import ovni.util.Util;
import java.sql.*;
import java.util.Vector;

/** Inicio da Classe FORNECEDOR */
public class Fornecedor 
{ 
    
    /** Atributos da Classe */
    private long _codigo;
    private String _nomefantasia;
    private String _razaosocial;
    private long _cnpj;
    private long _inscrestadual;
    private long _cei;
    private long _inscrmunicipal;
    private String _contato;
    private String _cargo;
    private int _ddd;
    private int _telefoneprincipal;
    private int _ramal;
    private int _telefoneopcional;
    private int _fax;
    private int _celular;
    private String _email;
    private String _status;   
       	       
    /** Métodos de Acesso */
    public long getCodigo() 
    {  return _codigo;    }
    public void setCodigo(long lCodigo)
    {  this._codigo = lCodigo;    }
    
    public String getNomeFantasia()
    {  return _nomefantasia;    }
    public void setNomeFantasia(String sNomeFantasia) 
    {  this._nomefantasia = sNomeFantasia;    }    
    
    public String getRazaoSocial() 
    {  return _razaosocial;    }
    public void setRazaoSocial(String sRazaoSocial)
    {  this._razaosocial = sRazaoSocial;    }     
    
    public long getCnpj()
    {  return _cnpj;    }
    public void setCnpj(long lCnpj) 
    {  this._cnpj = lCnpj;    }    
    
    public long getInscrEstadual() 
    {  return _inscrestadual;    }
    public void setInscrEstadual(long lInscrEstadual) 
    {  this._inscrestadual = lInscrEstadual;   } 
    
    public long getCEI() 
    {  return _cei;    }
    public void setCEI(long lCEI) 
    {  this._cei = lCEI;   }   
    
    public long getInscrMunicipal() 
    {  return _inscrmunicipal;    }
    public void setInscrMunicipal(long lInscrMunicipal) 
    {  this._inscrmunicipal = lInscrMunicipal;    }
        
    public String getContato() 
    {  return _contato;    }
    public void setContato(String sContato) 
    {  this._contato = sContato;    }
    
    public String getCargo() 
    {  return _cargo;    }
    public void setCargo(String sCargo) 
    {  this._cargo = sCargo;    }
        
    public int getDDD() 
    {  return _ddd;    }
    public void setDDD(int iDDD)
    {  this._ddd = iDDD;   }    
    
    public int getTelefonePrincipal()
    {  return _telefoneprincipal;    }
    public void setTelefonePrincipal(int iTelefonePrincipal)
    {  this._telefoneprincipal = iTelefonePrincipal;    }    
    
    public int getTelefoneOpcional() 
    {  return _telefoneopcional;    }
    public void setTelefoneOpcional(int iTelefoneOpcional)
    {  this._telefoneopcional = iTelefoneOpcional;    }
        
    public int getFax() 
    {  return _fax;    }
    public void setFax(int iFax)
    {  this._fax = iFax;    }    
    
    public int getCelular() 
    {  return _celular;    }
    public void setCelular(int iCelular)
    {  this._celular = iCelular;    }     
    
    public String getEmail()
    {  return _email;    }
    public void setEmail(String sEmail)
    {  this._email = sEmail;    }            
    
    public int getRamal() 
    {  return _ramal;    }
    public void setRamal(int iRamal) 
    {  this._ramal = iRamal;    }  
    
    public String getStatus()
    {  return _status;    }
    public void setStatus(String sStatus)
    {  this._status = sStatus;    }   
    
    // Métodos de Negócio
    
    /**
     * Método para Inserção de novo Fornecedor
     * @throws SQLException
     * @throws Exception
     */
    public void InserirFornecedor() throws SQLException, Exception{
    try
       {
			Operacao("I"); 
       }
        catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
     }    
     
    /**
     * Método para Atualização dos dados de Fornecedor
     * @throws SQLException
     * @throws Exception
     */
     public void AtualizarFornecedor() throws SQLException, Exception{
     try
       {
			Operacao("A"); 
       }
        catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	 
     }   
     
     /**
      * Método para Exclusão dos dados de Fornecedor
      * @throws SQLException
      * @throws Exception
      */
     public void ExcluirFornecedor() throws SQLException, Exception{
     try
       {
			Operacao("E");  
       }
        catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	  
     }         
    
     /**
      *  Método para realizar Operação desejada no Banco de Dados
      * @param sTipo
      * @throws SQLException
      * @throws Exception
      */
     public void Operacao(String sTipo) throws SQLException, Exception{ 
    	 Connection conexao = Util.getConexao(); 
     try
       {
              	
            CallableStatement cs;
            cs = conexao.prepareCall("{ ? = call operacao_fornecedor(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter(1, Types.VARCHAR);
            cs.setString(2, sTipo);
            cs.setLong(3, this.getCodigo());
            cs.setString(4, this.getNomeFantasia());
            cs.setString(5, this.getRazaoSocial());
            cs.setLong(6, this.getCnpj());
            cs.setLong(7, this.getInscrEstadual());
            cs.setLong(8, this.getCEI());
            cs.setLong(9, this.getInscrMunicipal());
            cs.setString(10, this.getContato());
            cs.setString(11, this.getCargo());
            cs.setInt(12, this.getDDD());
            cs.setInt(13, this.getTelefonePrincipal());
            cs.setInt(14, this.getRamal());
            cs.setInt(15, this.getTelefoneOpcional());
            cs.setInt(16, this.getFax());
            cs.setInt(17, this.getCelular());
            cs.setString(18, this.getEmail());
            cs.execute();
            String Status = cs.getString(1);
            setStatus(Status);
            cs.close();   
       }
        catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
	    finally {Util.fecharConexao(conexao);}	
     }     
              
    /**
     *  Método para buscar todos Fornecedores
     * @return
     * @throws SQLException
     */
	public Vector<Fornecedor> BuscarTodosFornecedor() throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
        Vector<Fornecedor> vctFornecedor = new Vector<Fornecedor>();
		/** Inicio do Try */
		try
		{		
			/** Monta a Query */			                   
			String sSQL = "";
            sSQL = sSQL +  "     select                                     ";
			sSQL = sSQL +  "     f._codigo as Codigo                        ";
			sSQL = sSQL +  "    ,f._nomefantasia as NomeFantasia            ";
			sSQL = sSQL +  "    ,f._razaosocial as RazaoSocial              ";
			sSQL = sSQL +  "    ,f._cnpj as Cnpj                            ";			
			sSQL = sSQL +  "    ,f._contato as Contato                      ";                        
			sSQL = sSQL +  "    ,f._ddd as DDD                              ";
			sSQL = sSQL +  "    ,f._telefoneprincipal as TelefonePrincipal	"; 
			sSQL = sSQL +  "    ,f._inscrestadual as InscrEstadual          ";
			sSQL = sSQL +  "    ,f._cei as CEI					            ";
			sSQL = sSQL +  "    ,f._inscrmunicipal as InscrMunicipal        ";
			sSQL = sSQL +  "    ,f._cargo as Cargo				            ";
			sSQL = sSQL +  "    ,f._ramal as Ramal				            ";
			sSQL = sSQL +  "    ,f._telefoneopcional as TelefoneOpcional    ";
			sSQL = sSQL +  "    ,f._fax as Fax					            ";
			sSQL = sSQL +  "    ,f._celular as Celular			            ";
			sSQL = sSQL +  "    ,f._email as Email				            ";			
			sSQL = sSQL +  "    from fornecedores as f                      ";
            sSQL = sSQL +  "    order by f._razaosocial;                    ";
			
            PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Fornecedor item = new Fornecedor();
				item.setCodigo(rs.getLong("Codigo"));
				item.setNomeFantasia(rs.getString("NomeFantasia"));
				item.setRazaoSocial(rs.getString("RazaoSocial"));
				item.setCnpj(rs.getLong("Cnpj"));
				item.setContato(rs.getString("Contato"));
				item.setDDD(rs.getInt("DDD"));
				item.setTelefoneOpcional(rs.getInt("TelefoneOpcional"));
				item.setTelefonePrincipal(rs.getInt("TelefonePrincipal"));
				item.setInscrEstadual(rs.getLong("InscrEstadual"));
				item.setInscrMunicipal(rs.getLong("InscrMunicipal"));
				item.setCEI(rs.getLong("CEI"));
				item.setCargo(rs.getString("Cargo"));
				item.setRamal(rs.getInt("Ramal"));
				item.setFax(rs.getInt("Fax"));
				item.setCelular(rs.getInt("Celular"));
				item.setEmail(rs.getString("Email"));			
				
				vctFornecedor.addElement(item);
			}	
		}/** Final do Try */ 
		catch( SQLException erro)
                    { throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}
		return vctFornecedor ;		
	}
    
    /**
     * Método para buscar Detalhes do Fornecedor por Código
     * @param lCodigo
     * @return
     * @throws SQLException
     */
	public Vector<Fornecedor> BuscarDetalhesDoFornecedorPorCodigo(long lCodigo) throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		Vector<Fornecedor> vctFornecedor = new Vector<Fornecedor>();
        // Inicio do Try
		try
		{
			/** Monta a Query */			                   
			String sSQL = "";
            sSQL = sSQL +  "     select                                     ";
			sSQL = sSQL +  "     f._codigo as Codigo                        ";
			sSQL = sSQL +  "    ,f._nomefantasia as NomeFantasia            ";
			sSQL = sSQL +  "    ,f._razaosocial as RazaoSocial              ";
			sSQL = sSQL +  "    ,f._cnpj as Cnpj                            ";			
			sSQL = sSQL +  "    ,f._contato as Contato                      ";                        
			sSQL = sSQL +  "    ,f._ddd as DDD                              ";
			sSQL = sSQL +  "    ,f._telefoneprincipal as TelefonePrincipal	"; 
			sSQL = sSQL +  "    ,f._inscrestadual as InscrEstadual          ";
			sSQL = sSQL +  "    ,f._cei as CEI					            ";
			sSQL = sSQL +  "    ,f._inscrmunicipal as InscrMunicipal        ";
			sSQL = sSQL +  "    ,f._cargo as Cargo				            ";
			sSQL = sSQL +  "    ,f._ramal as Ramal				            ";
			sSQL = sSQL +  "    ,f._telefoneopcional as TelefoneOpcional    ";
			sSQL = sSQL +  "    ,f._fax as Fax					            ";
			sSQL = sSQL +  "    ,f._celular as Celular			            ";
			sSQL = sSQL +  "    ,f._email as Email				            ";			
			sSQL = sSQL +  "    from fornecedores as f                      ";
			sSQL = sSQL +  "    where f._codigo = ?                         ";		
   			sSQL = sSQL +  "    order by f._razaosocial                     ";		
			
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			pstmt.setLong(1, lCodigo);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Fornecedor item = new Fornecedor();
				item.setCodigo(rs.getLong("Codigo"));
				item.setNomeFantasia(rs.getString("NomeFantasia"));
				item.setRazaoSocial(rs.getString("RazaoSocial"));
				item.setCnpj(rs.getLong("Cnpj"));
				item.setContato(rs.getString("Contato"));
				item.setDDD(rs.getInt("DDD"));
				item.setTelefoneOpcional(rs.getInt("TelefoneOpcional"));
				item.setTelefonePrincipal(rs.getInt("TelefonePrincipal"));
				item.setInscrEstadual(rs.getLong("InscrEstadual"));
				item.setInscrMunicipal(rs.getLong("InscrMunicipal"));
				item.setCEI(rs.getLong("CEI"));
				item.setCargo(rs.getString("Cargo"));
				item.setRamal(rs.getInt("Ramal"));
				item.setFax(rs.getInt("Fax"));
				item.setCelular(rs.getInt("Celular"));
				item.setEmail(rs.getString("Email"));			
				
				vctFornecedor.addElement(item);
			}
		} //Final do Try 
		catch( SQLException erro)
                    { throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}
		return vctFornecedor ;
	}
        
     /**
     * Método para buscar Detalhes do Fornecedor por Nome Fantasia
     * @param sNomeFantasia
     * @return
     * @throws SQLException
     */
    public Vector<Fornecedor> BuscarDetalhesDoFornecedorPorNomeFantasia(String sNomeFantasia) throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		Vector<Fornecedor> vctFornecedor = new Vector<Fornecedor>();
		// Inicio do Try
		try
		{
			/** Monta a Query */			                   
			String sSQL = "";
            sSQL = sSQL +  "     select                                     ";
			sSQL = sSQL +  "     f._codigo as Codigo                        ";
			sSQL = sSQL +  "    ,f._nomefantasia as NomeFantasia            ";
			sSQL = sSQL +  "    ,f._razaosocial as RazaoSocial              ";
			sSQL = sSQL +  "    ,f._cnpj as Cnpj                            ";			
			sSQL = sSQL +  "    ,f._contato as Contato                      ";                        
			sSQL = sSQL +  "    ,f._ddd as DDD                              ";
			sSQL = sSQL +  "    ,f._telefoneprincipal as TelefonePrincipal	"; 
			sSQL = sSQL +  "    ,f._inscrestadual as InscrEstadual          ";
			sSQL = sSQL +  "    ,f._cei as CEI					            ";
			sSQL = sSQL +  "    ,f._inscrmunicipal as InscrMunicipal        ";
			sSQL = sSQL +  "    ,f._cargo as Cargo				            ";
			sSQL = sSQL +  "    ,f._ramal as Ramal				            ";
			sSQL = sSQL +  "    ,f._telefoneopcional as TelefoneOpcional    ";
			sSQL = sSQL +  "    ,f._fax as Fax					            ";
			sSQL = sSQL +  "    ,f._celular as Celular			            ";
			sSQL = sSQL +  "    ,f._email as Email				            ";			
			sSQL = sSQL +  "    from fornecedores as f                      ";
			sSQL = sSQL +  "    where f._nomefantasia ILIKE '%"+sNomeFantasia+"%'       ";		
   			sSQL = sSQL +  "    order by f._razaosocial                     			";			
			

			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Fornecedor item = new Fornecedor();
				item.setCodigo(rs.getLong("Codigo"));
				item.setNomeFantasia(rs.getString("NomeFantasia"));
				item.setRazaoSocial(rs.getString("RazaoSocial"));
				item.setCnpj(rs.getLong("Cnpj"));
				item.setContato(rs.getString("Contato"));
				item.setDDD(rs.getInt("DDD"));
				item.setTelefoneOpcional(rs.getInt("TelefoneOpcional"));
				item.setTelefonePrincipal(rs.getInt("TelefonePrincipal"));
				item.setInscrEstadual(rs.getLong("InscrEstadual"));
				item.setInscrMunicipal(rs.getLong("InscrMunicipal"));
				item.setCEI(rs.getLong("CEI"));
				item.setCargo(rs.getString("Cargo"));
				item.setRamal(rs.getInt("Ramal"));
				item.setFax(rs.getInt("Fax"));
				item.setCelular(rs.getInt("Celular"));
				item.setEmail(rs.getString("Email"));			
				
				vctFornecedor.addElement(item);
			}
		}// Final do Try
		catch( SQLException erro)
                    { throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}
		return vctFornecedor ;
	}
        
        /**
         * Método para buscar Detalhes do Fornecedor por CNPJ
         * @param iCnpj
         * @return
         * @throws SQLException
         */
    public Vector<Fornecedor> BuscarDetalhesDoFornecedorPorCnpj(long iCnpj) throws SQLException
        {
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		Vector<Fornecedor> vctFornecedor = new Vector<Fornecedor>();
        //Inicio do Try
		try
		{
			/** Monta a Query */			                   
			String sSQL = "";
            sSQL = sSQL +  "     select                                     ";
			sSQL = sSQL +  "     f._codigo as Codigo                        ";
			sSQL = sSQL +  "    ,f._nomefantasia as NomeFantasia            ";
			sSQL = sSQL +  "    ,f._razaosocial as RazaoSocial              ";
			sSQL = sSQL +  "    ,f._cnpj as Cnpj                            ";			
			sSQL = sSQL +  "    ,f._contato as Contato                      ";                        
			sSQL = sSQL +  "    ,f._ddd as DDD                              ";
			sSQL = sSQL +  "    ,f._telefoneprincipal as TelefonePrincipal	"; 
			sSQL = sSQL +  "    ,f._inscrestadual as InscrEstadual          ";
			sSQL = sSQL +  "    ,f._cei as CEI					            ";
			sSQL = sSQL +  "    ,f._inscrmunicipal as InscrMunicipal        ";
			sSQL = sSQL +  "    ,f._cargo as Cargo				            ";
			sSQL = sSQL +  "    ,f._ramal as Ramal				            ";
			sSQL = sSQL +  "    ,f._telefoneopcional as TelefoneOpcional    ";
			sSQL = sSQL +  "    ,f._fax as Fax					            ";
			sSQL = sSQL +  "    ,f._celular as Celular			            ";
			sSQL = sSQL +  "    ,f._email as Email				            ";			
			sSQL = sSQL +  "    from fornecedores as f                      ";
			sSQL = sSQL +  "    where f._cnpj ILIKE '%"+iCnpj+"%'           ";		
   			sSQL = sSQL +  "    order by f._razaosocial                     ";	
						
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Fornecedor item = new Fornecedor();
				item.setCodigo(rs.getLong("Codigo"));
				item.setNomeFantasia(rs.getString("NomeFantasia"));
				item.setRazaoSocial(rs.getString("RazaoSocial"));
				item.setCnpj(rs.getLong("Cnpj"));
				item.setContato(rs.getString("Contato"));
				item.setDDD(rs.getInt("DDD"));
				item.setTelefoneOpcional(rs.getInt("TelefoneOpcional"));
				item.setTelefonePrincipal(rs.getInt("TelefonePrincipal"));
				item.setInscrEstadual(rs.getLong("InscrEstadual"));
				item.setInscrMunicipal(rs.getLong("InscrMunicipal"));
				item.setCEI(rs.getLong("CEI"));
				item.setCargo(rs.getString("Cargo"));
				item.setRamal(rs.getInt("Ramal"));
				item.setFax(rs.getInt("Fax"));
				item.setCelular(rs.getInt("Celular"));
				item.setEmail(rs.getString("Email"));			
				
				vctFornecedor.addElement(item);
			}
		}//Final do Try 
		catch( SQLException erro)
                    { throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}
		return vctFornecedor ;
	}
	
	 /**
	  *  Método para buscar Detalhes do Fornecedor por Razão Social
	  * @param sRazaoSocial
	  * @return
	  * @throws SQLException
	  */
    public Vector<Fornecedor> BuscarDetalhesDoFornecedorPorRazaoSocial(String sRazaoSocial) throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		Vector<Fornecedor> vctFornecedor = new Vector<Fornecedor>();
        //Inicio do Try
		try
		{
			/** Monta a Query */
					                   
			String sSQL = "";				
			sSQL = sSQL +  "     select                                     			";
			sSQL = sSQL +  "     f._codigo as Codigo                        			";
			sSQL = sSQL +  "    ,f._nomefantasia as NomeFantasia            			";
			sSQL = sSQL +  "    ,f._razaosocial as RazaoSocial              			";
			sSQL = sSQL +  "    ,f._cnpj as Cnpj                            			";
			sSQL = sSQL +  "    ,f._inscrestadual as InscrEstadual          			";
            sSQL = sSQL +  "    ,f._cei as CEI                              			";
			sSQL = sSQL +  "    ,f._inscrmunicipal as InscrMunicipal        			";
			sSQL = sSQL +  "    ,f._contato as Contato                      			";
            sSQL = sSQL +  "    ,f._cargo as Cargo                          			";
			sSQL = sSQL +  "    ,f._ddd as DDD                              			";
			sSQL = sSQL +  "    ,f._telefoneprincipal as TelefonePrincipal				";
            sSQL = sSQL +  "    ,f._ramal as Ramal                  					";
			sSQL = sSQL +  "    ,f._telefoneopcional as TelefoneOpcional				";
			sSQL = sSQL +  "    ,f._fax as Fax                              			";
			sSQL = sSQL +  "    ,f._celular as Celular                      			";
			sSQL = sSQL +  "    ,f._email as Email                          			";
			sSQL = sSQL +  "    from fornecedores as f                      			";
			sSQL = sSQL +  "    where f._razaosocial ILIKE '%"+sRazaoSocial+"%'         ";	
   			sSQL = sSQL +  "    order by f._razaosocial                     			";			

			
			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Fornecedor item = new Fornecedor();
				item.setCodigo(rs.getLong("Codigo"));
				item.setNomeFantasia(rs.getString("NomeFantasia"));
				item.setRazaoSocial(rs.getString("RazaoSocial"));
				item.setCnpj(rs.getLong("Cnpj"));
				item.setContato(rs.getString("Contato"));
				item.setDDD(rs.getInt("DDD"));
				item.setTelefoneOpcional(rs.getInt("TelefoneOpcional"));
				item.setTelefonePrincipal(rs.getInt("TelefonePrincipal"));
				item.setInscrEstadual(rs.getLong("InscrEstadual"));
				item.setInscrMunicipal(rs.getLong("InscrMunicipal"));
				item.setCEI(rs.getLong("CEI"));
				item.setCargo(rs.getString("Cargo"));
				item.setRamal(rs.getInt("Ramal"));
				item.setFax(rs.getInt("Fax"));
				item.setCelular(rs.getInt("Celular"));
				item.setEmail(rs.getString("Email"));			
				
				vctFornecedor.addElement(item);
			}
		}/** Final do Try */ 
		catch( SQLException erro)
                    { throw new SQLException(erro.getMessage() ); }
		finally {Util.fecharConexao(conexao);}
		return vctFornecedor ;
	}  
	
	/** Método para */
	public long GerarCodigoFornecedor() throws SQLException, Exception
	{
    	ResultSet rs = null;
    	long CodigoFornecedor = 0;
    	Connection conexao = Util.getConexao();
    	try
       	{
			
			PreparedStatement pstmt = conexao.prepareStatement("SELECT nextval('sq_Fornecedores');");
			pstmt.clearParameters();
			rs = pstmt.executeQuery(); 
			if(rs!= null)
    		{ 
    			while(rs.next()) 
    			{
    				 CodigoFornecedor = rs.getLong("nextval");
    			}                     
    		}   		
       	}
        catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	 
	    finally {Util.fecharConexao(conexao);}
	    return CodigoFornecedor;
     }         
}
/** Final da Classe FORNECEDOR */

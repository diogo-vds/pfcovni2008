package ovni.negocio;
import ovni.util.Util;
import java.sql.Date;
import java.sql.*;
import java.util.*;

public class Usuario {
    
    // Atributos da Classe 
    private long _codigo = 0;
    private int _tipousuario;
	private String _nome;
	private long _cpf;
	private long _rg;
	private String _orgaoemissor;
	private String _naturalidade;
	private java.sql.Date _datanascimento;
	private String _sexo;
	private String _email;
	private String _senha;
    private int _ddd;
    private int _telefoneprincipal;
    private int _ramal;
    private int _telefoneopcional;
    private int _fax;
    private int _celular; 
    private java.sql.Date _dataultimoacesso;   
    private String _status;
    private Vector<Endereco> Enderecos = new Vector<Endereco>();
           	
    // Métodos de Acesso
    public long getCodigo()
    { return _codigo;    }
    public void setCodigo(long lCodigo)
    { this._codigo = lCodigo;}
    
    public int getTipoUsuario()
    { return _tipousuario;    }
    public void setTipoUsuario(int iTipoUsuario)
    { this._tipousuario = iTipoUsuario;}
    
    public String getNome()
    { return _nome;    }
    public void setNome(String sNome)
    { this._nome = sNome;}
    
    public long getCPF()
    { return _cpf;    }
    public void setCPF(long lCPF)
    { this._cpf = lCPF;}
    
    public long getRG()
    { return _rg;    }
    public void setRG(long lRG)
    { this._rg = lRG;}
    
    public String getOrgaoEmissor()
    { return _orgaoemissor;    }
    public void setOrgaoEmissor(String sOrgaoEmissor)
    { this._orgaoemissor = sOrgaoEmissor;}
    
    public String getNaturalidade()
    { return _naturalidade;    }
    public void setNaturalidade(String sNaturalidade)
    { this._naturalidade = sNaturalidade;}
    
    public Date getDataNascimento()
    { return _datanascimento;  }    
    public void setDataNascimento(int ano, int mes, int dia)
    { 
    	Calendar calendario = Calendar.getInstance();
    	calendario.set(Calendar.YEAR, ano);
    	calendario.set(Calendar.MONTH, mes);
    	calendario.set(Calendar.DATE, dia);
    	java.util.Date data = calendario.getTime();   
        this._datanascimento = new java.sql.Date(data.getTime());
    }
    public void setDataNascimento(Date dDataNascimento)
    { this._datanascimento = dDataNascimento;}
    
    public String getSexo()
    { return _sexo;    }
    public void setSexo(String sSexo)
    { this._sexo = sSexo;}
    
    public String getEmail()
    { return _email;    }
    public void setEmail(String sEmail)
    { this._email = sEmail;}
    
    public String getSenha()
    { return _senha;    }
    public void setSenha(String sSenha)
    { this._senha = Util.encriptarSenha(sSenha);}
           
    public int getDDD()
    { return _ddd;    }
    public void setDDD(int iDDD)
    { this._ddd = iDDD;}    
    
    public int getTelefonePrincipal() 
    { return _telefoneprincipal;    }
    public void setTelefonePrincipal(int iTelefonePrincipal)
    { this._telefoneprincipal = iTelefonePrincipal;}    
    
    public int getRamal() 
    { return _ramal;    }
    public void setRamal(int iRamal)
    { this._ramal = iRamal;} 
    
    public int getTelefoneOpcional()
    { return _telefoneopcional;    }
    public void setTelefoneOpcional(int iTelefoneOpcional)
    { this._telefoneopcional = iTelefoneOpcional;}    
    
    public int getFax()
    { return _fax;    }
    public void setFax(int iFax)
    { this._fax = iFax;}    
    
    public int getCelular()
    { return _celular;    }
    public void setCelular(int iCelular)
    { this._celular = iCelular;}
    
    public String getStatus()
    { return _status;    }
    public void setStatus(String sStatus)
    { this._status = sStatus;    }
    
    public Date getDataUltimoAcesso()
    { return _dataultimoacesso;  }    
    public void setDataUltimoAcesso(int ano, int mes, int dia)
    { 
    	Calendar calendario = Calendar.getInstance();
    	calendario.set(Calendar.YEAR, ano);
    	calendario.set(Calendar.MONTH, mes);
    	calendario.set(Calendar.DATE, dia);
    	java.util.Date data = calendario.getTime();   
        this._dataultimoacesso = new java.sql.Date(data.getTime());
    }
    
    public void setEnderecos(Vector<Endereco> e){
    	this.Enderecos = e;
    }
    public Endereco getEndereco(int iPosicao){
    	return this.Enderecos.elementAt(iPosicao);
    }
    public Endereco getEnderecoPorCodigo(int iCodigo){
    	Endereco end = new Endereco();
    	for (int i = 0; i < Enderecos.size(); i++)
    	{
    		if (Enderecos.elementAt(i).getCodigo() == iCodigo)
    			end = Enderecos.elementAt(i);
    	}
    	return end;    
    }
    public Vector<Endereco> getListaEnderecos(){
    	return this.Enderecos;
    }
    
    
    // Método de Negócio
    /**
     * Método para Inserir Usuário
     * @throws SQLException
     * @throws Exception
     */
     public void InserirUsuario() throws SQLException, Exception{
     try
       {
			Operacao("I"); 
       }
       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
     }    
    
     /**
      * Método para Atualizar Usuário
      * @throws SQLException
      * @throws Exception
      */
     public void AtualizarUsuario() throws SQLException, Exception{
     try
       {
			Operacao("A"); 
       }
      	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	 
     }   
     
     /**
      * Método para Excluir Usuário
      * @throws SQLException
      * @throws Exception
      */
     public void ExcluirUsuario() throws SQLException, Exception{
     try
       {
			Operacao("E");  
       }
       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	  
     }         
    
     /**
	   * Método para realizar a Operação desejada no Banco de Dados
	   * @param sTipo
	   * @return String
	   * @throws SQLException
	   * @throws Exception
	   */
     public void Operacao(String sTipo) throws SQLException, Exception{
     Connection conexao = Util.getConexao();  
     try
       { 	
    	 CallableStatement cs;
 		 cs = conexao.prepareCall("{ ? = call operacao_usuario(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		 cs.registerOutParameter(1, Types.VARCHAR);
		 cs.setString(2, sTipo);
		 cs.setLong(3, this.getCodigo());
		 cs.setInt(4, this.getTipoUsuario());
         cs.setString(5, this.getNome());
 		 cs.setLong(6, this.getCPF());
 		 cs.setLong(7, this.getRG());
 		 cs.setString(8, this.getOrgaoEmissor());
 		 cs.setString(9, this.getNaturalidade());
 		 cs.setDate(10, this.getDataNascimento());
 		 cs.setString(11, this.getSexo());
 		 cs.setString(12, this.getEmail());
 		 cs.setString(13, this.getSenha());
 		 cs.setInt(14, this.getDDD());
 		 cs.setInt(15, this.getTelefonePrincipal());
 		 cs.setInt(16, this.getRamal());
 		 cs.setInt(17, this.getTelefoneOpcional());
 		 cs.setInt(18, this.getFax());
 		 cs.setInt(19, this.getCelular());
 		 cs.setDate(20, this.getDataUltimoAcesso());
 		 cs.execute();
 		 String sStatus = cs.getString(1);
 		 setStatus(sStatus);
 		 cs.close(); 		
       }
        catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}	
	    finally { Util.fecharConexao(conexao); }
     }
     
    /**
     * Método para Buscar dados do Usuário por Código
     * @param lCodigo
     * @return Usuario
     * @throws SQLException
     */	
	public Usuario BuscarDetalhesDoUsuario(long lCodigo) throws SQLException{
	ResultSet rs = null;
	Connection conexao = Util.getConexao( );
	Usuario oUsuario = new Usuario();
	try
	  {
			String sSQL = "";	
			sSQL = sSQL +  "    select 											";
			sSQL = sSQL +  "		 u._codigo as Codigo						";
			sSQL = sSQL +  "		,u._tipousuario as TipoUsuario				";
			sSQL = sSQL +  "		,u._nome as Nome							";
			sSQL = sSQL +  "		,u._cpf as Cpf								";
			sSQL = sSQL +  "		,u._rg  as Rg								";
			sSQL = sSQL +  "		,u._orgaoemissor as OrgaoEmissor			";
			sSQL = sSQL +  "		,u._naturalidade as Naturalidade			";
			sSQL = sSQL +  "		,u._dataNascimento as DataNascimento		";
			sSQL = sSQL +  "		,u._sexo as Sexo							";
			sSQL = sSQL +  "		,u._email as Email							";
			sSQL = sSQL +  "		,u._senha as Senha							";
			sSQL = sSQL +  "		,u._ddd as DDD								";
			sSQL = sSQL +  "		,u._telefoneprincipal as TelefonePrincipal	";
			sSQL = sSQL +  "		,u._ramal as Ramal							";
			sSQL = sSQL +  "		,u._telefoneopcional as TelefoneOpcional	";
			sSQL = sSQL +  "		,u._fax as Fax								";
			sSQL = sSQL +  "		,u._celular as Celular						";
			sSQL = sSQL +  "   from usuario as u								";
			sSQL = sSQL +  "   where u._codigo = ?		    					";		

			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			pstmt.setLong(1, lCodigo);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				oUsuario.setCodigo(rs.getLong("Codigo"));
				oUsuario.setTipoUsuario(rs.getInt("TipoUsuario"));
				oUsuario.setNome(rs.getString("Nome"));
				oUsuario.setCPF(rs.getLong("Cpf"));
				oUsuario.setRG(rs.getLong("Rg"));
				oUsuario.setOrgaoEmissor(rs.getString("OrgaoEmissor"));
				oUsuario.setNaturalidade(rs.getString("Naturalidade"));
				oUsuario.setDataNascimento(rs.getDate("DataNascimento"));
				oUsuario.setSexo(rs.getString("Sexo"));
				oUsuario.setEmail(rs.getString("Email"));
				oUsuario.setDDD(rs.getInt("DDD"));
				oUsuario.setTelefonePrincipal(rs.getInt("TelefonePrincipal"));
				oUsuario.setRamal(rs.getInt("Ramal"));
				oUsuario.setTelefoneOpcional(rs.getInt("TelefoneOpcional"));
				oUsuario.setFax(rs.getInt("Fax"));
				oUsuario.setCelular(rs.getInt("Celular"));
			}
	   }
		catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
		finally { Util.fecharConexao(conexao); }		
		return oUsuario ;
	}
	
	/**
	 * Método para Gerar o Código para Usuário
	 * @return long
	 * @throws SQLException
	 * @throws Exception
	 */
	public long GerarCodigoUsuario() throws SQLException, Exception{
    ResultSet rs = null;
    Connection conexao = Util.getConexao();
    long lCodigoUsuario = 0;
    try
      {
    		PreparedStatement pstmt = conexao.prepareStatement("SELECT nextval('sq_Usuario');");
			pstmt.clearParameters();
			rs = pstmt.executeQuery(); 
			if(rs!= null)
    		{ 
    			while(rs.next()) 
    			{
    				 lCodigoUsuario = rs.getLong("nextval");
    			}                     
    		}   		
      }
      catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
	  catch (Exception erro){throw new Exception(erro.getMessage());}	 
	  finally { Util.fecharConexao(conexao); }
	  return lCodigoUsuario;
    }         
	

	/**
	 * Método para Gerar a Data de Último acesso do Usuário ao site
	 * @param lCodigo
	 * @throws SQLException
	 * @throws Exception
	 */
	public void GerarDataUltimoAcesso(long lCodigo) throws SQLException, Exception{
    	Connection conexao = Util.getConexao();
    	try
       	{
		    PreparedStatement pstmt = conexao.prepareStatement("update usuario set _dataultimoacesso = current_date where _codigo = ?;");
			pstmt.clearParameters();
			pstmt.setLong(1, lCodigo);
			pstmt.execute();
       	}
        catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}
	    finally { Util.fecharConexao(conexao); }
    }
	
	/**
	 * Método para Verificar a Disponibilidade de email para cadastro
	 * @param sEmail
	 * @return boolean
	 * @throws SQLException
	 * @throws Exception
	 */
	public boolean verificarEmail(String sEmail) throws SQLException, Exception
	{
    	ResultSet rs = null;
    	boolean bOk = false;
    	Connection conexao = Util.getConexao();
    	
    	try
       	{
			
		    PreparedStatement pstmt = conexao.prepareStatement("select _codigo from usuario where _email = ? ");
			pstmt.clearParameters();
			pstmt.setString(1, sEmail);
			rs = (ResultSet) pstmt.executeQuery();
			
			if(rs.next())
			{
				bOk = false;
			}
			else
			{
				bOk = true;				
			}
       	}
        catch( SQLException erro){ throw new SQLException(erro.getMessage()); }
	    catch (Exception erro){throw new Exception(erro.getMessage());}
	    finally { Util.fecharConexao(conexao); }
	    
	    return bOk;
    }
	
	/**
	 * Método para Buscar os Tipos de Usuário Disponivel
	 * @return
	 * @throws SQLException
	 */
	public ResultSet BuscarTipoUsuario() throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		try
		{
			
			PreparedStatement pstmt = conexao.prepareStatement("SELECT * FROM TipoUsuario;");
			pstmt.clearParameters( );
			rs = pstmt.executeQuery( );
		}// FInal do TRY

		catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		return rs ;
	}
	
	/**
	 * Método para Validar dados do Usuário
	 * @return boolean
	 * @throws SQLException
	 */
	public boolean Validar() throws SQLException
	{
		boolean bOk = false;
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		try
		{
			String sSQl = "";
			
			sSQl += "	SELECT"; 
			sSQl += "		  _codigo"; 
			sSQl += "		, _tipousuario"; 
			sSQl += "		, _nome"; 
			sSQl += "		, _cpf"; 
			sSQl += "		, _rg"; 
			sSQl += "		, _orgaoemissor"; 
			sSQl += "		, _naturalidade"; 
			sSQl += "		, _datanascimento"; 
			sSQl += "		, _sexo"; 
			sSQl += "		, _ddd"; 
			sSQl += "		, _telefoneprincipal"; 
			sSQl += "		, _ramal"; 
			sSQl += "		, _telefoneopcional"; 
			sSQl += "		, _fax"; 
			sSQl += "		, _celular"; 
			sSQl += "		, _dataultimoacesso ";
			sSQl += "	FROM usuario ";
			sSQl += "		where _email = ? and _senha = ?";
			
			PreparedStatement pstmt = conexao.prepareStatement(sSQl);
			pstmt.clearParameters( );
			pstmt.setString(1, this._email );
			pstmt.setString(2, this._senha );
			rs = pstmt.executeQuery( );
			
			if(rs.next())
			{
				bOk = true;				
				Preecher(rs);
				
			}
			else
			{
				bOk = false;
			}
			
		}// FInal do TRY

		catch( SQLException erro) { throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }
		return bOk;
	}
	
	/**
	 * Método para Preencher Objeto de Usuário
	 * @param rs
	 * @throws SQLException
	 */
	public void Preecher(ResultSet rs) throws SQLException
	{
		try{
			
			this.setCodigo(rs.getLong("_codigo"));
			this.setTipoUsuario(rs.getInt("_tipousuario"));
			this.setNome(rs.getString("_nome"));
			this.setCPF(rs.getLong("_cpf"));
			this.setRG(rs.getLong("_rg"));
			this.setOrgaoEmissor(rs.getString("_orgaoemissor"));
			this.setNaturalidade(rs.getString("_naturalidade"));
			this.setDataNascimento(Integer.parseInt( rs.getDate("_datanascimento").toString().substring(0,4))
										,1
											,1);
			
			this.setSexo(rs.getString("_sexo"));
			this.setDDD(rs.getInt("_ddd"));
			this.setTelefonePrincipal(rs.getInt("_telefoneprincipal"));
			this.setRamal(rs.getInt("_ramal"));
			this.setTelefoneOpcional(rs.getInt("_telefoneopcional"));
			this.setFax(rs.getInt("_fax"));
			this.setCelular(rs.getInt("_celular"));	
			
			Endereco end = new Endereco();
			this.setEnderecos(end.BuscarEnderecoTodos(this.getCodigo(), "U"));

		}
		catch( SQLException erro)
		{ throw new SQLException(erro.getMessage() ); }	
		
	}
	
	/**
	 * Método para Buscar dados do Usuário pelo número de Celular
	 * @param iCelular
	 * @return Usuario
	 * @throws SQLException
	 */
	public Usuario BuscarUsuarioCelular(int iCelular) throws SQLException
	{
		ResultSet rs = null;
		Connection conexao = Util.getConexao( );
		Usuario oUsuario = new Usuario();
		try
		{
			//Monta a Query	
		
			String sSQL = "";	
			sSQL = sSQL +  "    select 											";
			sSQL = sSQL +  "		 u._codigo as Codigo						";
			sSQL = sSQL +  "		,u._tipousuario as TipoUsuario				";
			sSQL = sSQL +  "		,u._nome as Nome							";
			sSQL = sSQL +  "		,u._cpf as Cpf								";
			sSQL = sSQL +  "		,u._rg  as Rg								";
			sSQL = sSQL +  "		,u._orgaoemissor as OrgaoEmissor			";
			sSQL = sSQL +  "		,u._naturalidade as Naturalidade			";
			sSQL = sSQL +  "		,u._dataNascimento as DataNascimento		";
			sSQL = sSQL +  "		,u._sexo as Sexo							";
			sSQL = sSQL +  "		,u._email as Email							";
			sSQL = sSQL +  "		,u._senha as Senha							";
			sSQL = sSQL +  "		,u._ddd as DDD								";
			sSQL = sSQL +  "		,u._telefoneprincipal as TelefonePrincipal	";
			sSQL = sSQL +  "		,u._ramal as Ramal							";
			sSQL = sSQL +  "		,u._telefoneopcional as TelefoneOpcional	";
			sSQL = sSQL +  "		,u._fax as Fax								";
			sSQL = sSQL +  "		,u._celular as Celular						";
			sSQL = sSQL +  "   from usuario as u								";
			sSQL = sSQL +  "   where u._celular = ?		    					";		

			PreparedStatement pstmt = conexao.prepareStatement(sSQL);
			pstmt.clearParameters();
			pstmt.setLong(1, iCelular);
			rs = pstmt.executeQuery();				
			
			while(rs.next())
			{							
				oUsuario.setCodigo(rs.getLong("Codigo"));
				oUsuario.setTipoUsuario(rs.getInt("TipoUsuario"));
				oUsuario.setNome(rs.getString("Nome"));
				oUsuario.setCPF(rs.getLong("Cpf"));
				oUsuario.setRG(rs.getLong("Rg"));
				oUsuario.setOrgaoEmissor(rs.getString("OrgaoEmissor"));
				oUsuario.setNaturalidade(rs.getString("Naturalidade"));
				oUsuario.setDataNascimento(Integer.parseInt( rs.getDate("DataNascimento").toString().substring(0,4))
											,1
												,1);
				
				oUsuario.setSexo(rs.getString("Sexo"));
				oUsuario.setSexo(rs.getString("Email"));
				oUsuario.setDDD(rs.getInt("DDD"));
				oUsuario.setTelefonePrincipal(rs.getInt("TelefonePrincipal"));
				oUsuario.setRamal(rs.getInt("Ramal"));
				oUsuario.setTelefoneOpcional(rs.getInt("TelefoneOpcional"));
				oUsuario.setFax(rs.getInt("Fax"));
				oUsuario.setCelular(rs.getInt("Celular"));	
			}
		}// FInal do TRY
		catch( SQLException erro)
		{ throw new SQLException(erro.getMessage() ); }
		finally { Util.fecharConexao(conexao); }		
		return oUsuario ;
	}
	
	public static ArrayList<Usuario> listarUsuariosDePromocao() throws SQLException
	{
		//SQL para recuperar usuarios de promocao
		String sql = "SELECT _nome, _email FROM usuario WHERE _recebepromocoes = TRUE";
		
		ArrayList<Usuario> lista = new ArrayList<Usuario>();
		
		ResultSet oRs = null;
		Connection conexao = Util.getConexao();
		try 
		{
			Statement stmt = conexao.createStatement();			
			oRs = stmt.executeQuery(sql);
			
			while (oRs.next())
			{
				Usuario usu = new Usuario();
				usu.setNome(oRs.getString("_nome"));
				usu.setEmail(oRs.getString("_email"));
				lista.add(usu);			
			}
			
		} catch (SQLException e) { throw e;	}
		
		
		
		return lista;
	}
	
}// final da classe

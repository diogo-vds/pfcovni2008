package ovni.negocio;
import ovni.util.*;
import java.sql.*;
import java.util.Vector;

import ovni.util.Util;

public class Empresa {
	
	private  int _Codigo;
	private String _NomeFantasia;
	private String _RazaoSocial;
	private long _CNPJ;
	private long _InscricaoEstadual;
	private long _InscricaoMunicipal;
	private int _DDD;
	private int _TelefonePrincipal;
	private int _DDDFax;
	private int _Fax;	
	private String _CEP;
	private String _Endereco;
	private String _Numero;
	private String _Complemento;
	private String _Bairro;
	private String _Municipio;
	private String _Estado;
	private String _Pais;	
	
	public void setCodigo(int _Codigo) {
		this._Codigo = _Codigo;
	}
	public int getCodigo() {
		return _Codigo;
	}
	public void setNomeFantasia(String _NomeFantasia) {
		this._NomeFantasia = _NomeFantasia;
	}
	public String getNomeFantasia() {
		return _NomeFantasia;
	}
	public void setRazaoSocial(String _RazaoSocial) {
		this._RazaoSocial = _RazaoSocial;
	}
	public String getRazaoSocial() {
		return _RazaoSocial;
	}
	public void setCNPJ(long _CNPJ) {
		this._CNPJ = _CNPJ;
	}
	public long getCNPJ() {
		return _CNPJ;
	}
	public void setInscricaoEstadual(long _InscricaoEstadual) {
		this._InscricaoEstadual = _InscricaoEstadual;
	}
	public long getInscricaoEstadual() {
		return _InscricaoEstadual;
	}
	public void setInscricaoMunicipal(long _InscricaoMunicipal) {
		this._InscricaoMunicipal = _InscricaoMunicipal;
	}
	public long getInscricaoMunicipal() {
		return _InscricaoMunicipal;
	}
	public void setTelefonePrincipal(int _TelefonePrincipal) {
		this._TelefonePrincipal = _TelefonePrincipal;
	}
	public int getTelefonePrincipal() {
		return _TelefonePrincipal;
	}
	public void setDDD(int _DDD) {
		this._DDD = _DDD;
	}
	public int getDDD() {
		return _DDD;
	}
	public void setDDDFax(int _DDDFax) {
		this._DDDFax = _DDDFax;
	}
	public int getDDDFax() {
		return _DDDFax;
	}
	public void setFax(int _Fax) {
		this._Fax = _Fax;
	}
	public int getFax() {
		return _Fax;
	}
	public void setCEP(String cEP) {
		_CEP = cEP;
	}
	public String getCEP() {
		return _CEP;
	}
	
	public void setEndereco(String _Endereco) {
		this._Endereco = _Endereco;
	}
	public String getEndereco() {
		return _Endereco;
	}
	public void setNumero(String _Numero) {
		this._Numero = _Numero;
	}
	public String getNumero() {
		return _Numero;
	}
	public void setComplemento(String _Complemento) {
		this._Complemento = _Complemento;
	}
	public String getComplemento() {
		return _Complemento;
	}
	public void setBairro(String _Bairro) {
		this._Bairro = _Bairro;
	}
	public String getBairro() {
		return _Bairro;
	}
	public void setMunicipio(String _Municipio) {
		this._Municipio = _Municipio;
	}
	public String getMunicipio() {
		return _Municipio;
	}
	public void setEstado(String _Estado) {
		this._Estado = _Estado;
	}
	public String getEstado() {
		return _Estado;
	}
	public void setPais(String _Pais) {
		this._Pais = _Pais;
	}
	public String getPais() {
		return _Pais;
	}

	/**
	 * Dados da Empresa
	 * @return Objeto Empresa
	 * @throws SQLException
	 */
	public Empresa recuperarDadosEmpresa( ) throws SQLException{
		Empresa sa = new Empresa ( );
		
		ResultSet rs = null;
		String sql = "SELECT * FROM dadosempresa";
		
		Connection conexao = ovni.util.Util.getConexao();
		
		try{
			PreparedStatement pstmt = conexao.prepareStatement(sql);
			rs = pstmt.executeQuery();			
		}
		catch (SQLException sErro){
			throw sErro;
		}
		finally {
			ovni.util.Util.fecharConexao(conexao);
		}
		
		while(rs.next()){
//			sa.setCodigo( (int) rs.getInt("_codigo"));
//			sa.setNomeFantasia((String) rs.getString("_nomefantasia"));
//			sa.setRazaoSocial((String) rs.getString("_razaosocial"));
//			sa.setCNPJ((long) rs.getLong("_CNPJ"));
//			sa.setInscricaoEstadual((long) rs.getLong("_inscrestadual"));
//			sa.setInscricaoMunicipal((long) rs.getLong("_inscrmunicipal"));
//			sa.setTelefonePrincipal((int) rs.getInt("_telefoneprincipal"));
//			sa.setDDD((int) rs.getInt("_ddd"));
//			sa.setDDDFax((int) rs.getInt("_dddfax"));
//			sa.setFax((int) rs.getInt("_fax"));			
			sa.setCEP((String) rs.getString("_cep" ));
//			sa.setEndereco((String)rs.getString("_endereco" ));
//			sa.setNumero((String)rs.getString("_numero" ));
//			sa.setComplemento((String)rs.getString("_complemento" ));
//			sa.setBairro((String)rs.getString("_bairro" ));
//			sa.setMunicipio((String)rs.getString("_municipio" ));
//			sa.setEstado((String)rs.getString("_estado" ));
//			sa.setPais((String)rs.getString("_pais"));
		}		
		return sa;
	}
	
	
	/**
	 * Atualiza dados da Empresa no Banco de dados
	 * @throws SQLException
	 */	
	public void AtualizarDadosEmpresa() throws SQLException,Exception{
		
		 Connection conexao = Util.getConexao();  
	     try
	       {       	         	
	        CallableStatement cs;
	 		cs = conexao.prepareCall("{ ? = call operacao_empresa(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setLong(2, 1);
			cs.setString(3, this._NomeFantasia);
			cs.setString(4, this._RazaoSocial);
	       	cs.setLong(5, this._CNPJ);
	 		cs.setLong(6, this._InscricaoEstadual);
	 		cs.setLong(7, this._InscricaoMunicipal);
	 		cs.setInt(8, this._DDD);
	 		cs.setInt(9, this._TelefonePrincipal);
	 		cs.setInt(10, this._DDDFax);
	 		cs.setInt(11, this._Fax);
	 		cs.setString(12, this._CEP);
	 		cs.setString(13, this._Endereco);
	 		cs.setString(14, this._Numero);
	 		cs.setString(15, this._Complemento);
	 		cs.setString(16, this._Bairro);
	 		cs.setString(17, this._Municipio);
	 		cs.setString(18, this._Estado);
	 		cs.setString(19, this._Pais);
	 		cs.execute();
	 		String Status = cs.getString(1);	 		 		
	 		cs.close();	
	       }
	       	catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
		    finally { Util.fecharConexao(conexao); }	
		
	}
	

}//final da classe
package ovni.negocio;
import ovni.util.*;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Vector;

import javax.mail.MessagingException;
import javax.xml.crypto.Data;

import ovni.util.Util;

public class Promocao {

	private long _codigo;
	private Date _dataTermino;
	private Produto _produto;
	private float _valorPromocao;
	
	public void setCodigo(long _codigo) {
		this._codigo = _codigo;
	}
	public long getCodigo() {
		return _codigo;
	}
	public void setDataTermino(Date date) {
		this._dataTermino = date;
	}
	public Date getDataTermino() {
		return _dataTermino;
	}
	public void setProduto(Produto _produto) {
		this._produto = _produto;
	}
	public Produto getProduto() {
		return _produto;
	}
	public void setValorPromocao(float _valorPromocao) {
		this._valorPromocao = _valorPromocao;
	}
	public float getValorPromocao() {
		return _valorPromocao;
	}
	
	public float calcularPorcentagem(float valorPromo, float valorProduto )
	{
		float resultado = 0;		
		resultado = ( ((((valorPromo*100)/valorProduto)-100))/100 );	
		if ( resultado < 0) resultado = resultado * (-1);
		return resultado;
	}
	
	public String criarConteudoEmail(Vector<Promocao> promocoes)
	{
		StringBuilder sb = new StringBuilder();
		
		sb.append(" <table width=\"400\" align=\"center\">");
			sb.append("  <tr>");
			sb.append("  <td>");
			sb.append("  Mais uma promoção da OVNI.NET para você. Confira:");
			sb.append("  </td>");
			sb.append("  </tr>");
		sb.append("  </table>");
		
		
		sb.append(" <table width=\"400\" align=\"center\">");
			sb.append("  <tr>");
			sb.append("    <th> Dados da promocao </th>");
			sb.append("  </tr>");
			sb.append("  <tr>");
			sb.append("  </tr>");
			for (int iCont = 0; iCont < promocoes.size(); iCont++)
			{
				sb.append("  <tr>");
					sb.append("  <td align=\"left\">");
						sb.append(promocoes.elementAt(iCont).getProduto().getTitulo());
					sb.append("  </td>");
				sb.append("  </tr>");							
				sb.append("  <tr>");
					sb.append("  <td align=\"right\">");
						sb.append("  de  ");
						sb.append(Moeda.toReal(promocoes.elementAt(iCont).getProduto().getValor()));
						sb.append(" R$");
						sb.append("  por  ");
						sb.append(Moeda.toReal(promocoes.elementAt(iCont).getValorPromocao()));
						sb.append(" R$");
						sb.append(" clique");
						sb.append("<a href=\"http://127.0.0.1:8080/ovni/VisualizarDetalhesProduto?Codigo_Produto=");
						sb.append(promocoes.elementAt(iCont).getProduto().getCodigo());						
						sb.append("\" target=\"_blank\"> aqui</a> para conferir");						
					sb.append("  </td>");
				sb.append("   </tr>");				
			}
			sb.append("  <tr>");
			sb.append("  <td align=\"right\">");
			sb.append("<br>");
			sb.append("  </td>");
			sb.append("  </tr>");
			sb.append("  <tr>");
			sb.append("  <td align=\"right\">");
			sb.append("Data limite desta promoção: ");
			sb.append(Util.formatarData(promocoes.elementAt(0).getDataTermino()));
			sb.append("  </td>");
			sb.append("  </tr>");
			
		sb.append("</table>");
		sb.append("<br><br>");
		
		return sb.toString();
	
	}
	
	public void enviarEmail(Vector<Promocao> promocoes) throws SQLException, MessagingException
	{
		ArrayList<Usuario> usus = Usuario.listarUsuariosDePromocao();
		

		Email email = new Email();
		email.setAssunto("Promoção OVNI! Inperdível");
		email.setConteudo(this.criarConteudoEmail(promocoes));		
		
		for (int iCont = 0; iCont < usus.size(); iCont++)
		{
			email.setPara(usus.get(iCont).getEmail());
		}
		
		email.enviarPromocao();		
		
	}
	
	public void inserir(Vector<Promocao> promocoes) throws SQLException, MessagingException
	{
	     Connection conexao = Util.getConexao();
	     
	     try
	       {
	    	 conexao.setAutoCommit(false);
	    	 for (int iCont = 0; iCont < promocoes.size(); iCont++)
	    	 {	    	 
		    	 CallableStatement cs; 
		 		 cs = conexao.prepareCall("{ ? = call operacao_promocao(?,?,?)}");
				 cs.registerOutParameter(1, Types.VARCHAR);
				 cs.setDate(2, promocoes.elementAt(iCont).getDataTermino());
				 cs.setLong(3, promocoes.elementAt(iCont).getProduto().getCodigo());
				 cs.setFloat(4, calcularPorcentagem(promocoes.elementAt(iCont).getValorPromocao(),promocoes.elementAt(iCont).getProduto().getValor()));
		 		 cs.execute();
		 		 cs.close(); 	
	    	 }		 	
		 	conexao.commit();
		 	conexao.setAutoCommit(true);
	       }
	        catch( SQLException erro){ conexao.rollback(); throw new SQLException("Erro ao inserir a promoção. Tente Novamente."); }
		    finally { Util.fecharConexao(conexao); }
		    
		    this.enviarEmail(promocoes);    
	}
	
	public void excluir(Promocao promocao) throws SQLException, MessagingException
	{
		String sSQL = "delete from promocao where _codigo = ?";		
		Connection conexao = Util.getConexao();
	     
	     try
	       {
	    	conexao.setAutoCommit(false);
	    	PreparedStatement pstmt = conexao.prepareStatement(sSQL);
	    	pstmt.clearParameters();
	    	pstmt.setLong(1, promocao.getCodigo());
	    	pstmt.execute();	    		 	
		 	conexao.commit();
		 	conexao.setAutoCommit(true);
	       }
	        catch( SQLException erro){ conexao.rollback(); throw new SQLException("Erro ao excluir a promoção. Tente Novamente."); }
		    finally { Util.fecharConexao(conexao); } 
	}
	
	public static Vector<Promocao> listar() throws SQLException
	{
		Vector<Promocao> lista = new Vector<Promocao>();
		ResultSet oRs = null;
		String sSQL = "SELECT _codigo, _datatermino, _produto, _valorpromocao FROM promocao ORDER BY _datatermino DESC";
		
		Connection conexao = Util.getConexao();
		try
		{
			Statement stmt = conexao.createStatement();
			oRs = stmt.executeQuery(sSQL);			
			while (oRs.next())
			{
				Promocao promocao = new Promocao();
				promocao.setCodigo(oRs.getLong("_codigo"));
				promocao.setDataTermino((Date) oRs.getDate("_datatermino"));
				Produto prod = new Produto();
				prod = prod.buscarporcodigo(oRs.getLong("_produto"));
				promocao.setProduto(prod);
				promocao.setValorPromocao(oRs.getFloat("_valorpromocao"));
				
				lista.addElement(promocao);
			}
		}
		catch (SQLException e) { throw e; }
		finally { Util.fecharConexao(conexao); }

		return lista;		
	}
	
	
	
	
}

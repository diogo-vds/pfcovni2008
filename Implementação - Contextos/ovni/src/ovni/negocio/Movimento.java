package ovni.negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import ovni.util.Util;

public class Movimento {
	private long codigo;
	private long produto;
	private int tipomovimento;
	private int quantidade;
	public long getCodigo() {
		return codigo;
	}
	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}
	public long getProduto() {
		return produto;
	}
	public void setProduto(long produto) {
		this.produto = produto;
	}
	public int getTipomovimento() {
		return tipomovimento;
	}
	public void setTipomovimento(int tipomovimento) {
		this.tipomovimento = tipomovimento;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	/**
	 *M�todo que seta os dados do objeto de movimento 
	 */
	public void setDados(long produto, int tipoMovimento, int qtd){
		this.setProduto(produto);
		this.setTipomovimento(tipoMovimento);
		this.setQuantidade(qtd);		
	}
	/**
	 * M�todo que faz a chamada ao m�todo atualizar estoque.
	 * caso este m�todo retorne true, chama o m�todo para registrar movimento.
	 */
	public String registrarMovimento(){
		String status = null;
		status = this.atualizarEstoque();
		if(status == null){			
			status = this.registrar();
		}
		return status;
	}
	/**
	 * M�todo que registra no banco os dados do movimento.
	 */
	public String registrar(){
		
		String resultado = null;
		Connection con = Util.getConexao();
		String sql = "INSERT INTO MOVIMENTO VALUES(" +
				"NEXTVAL('SQ_MOVIMENTO'),"+
				this.getProduto()+","+
				this.getTipomovimento()+","+this.getQuantidade()+")";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			try{
				pst.execute();
				resultado = "Movimenta��o Registrada!";
			}catch (SQLException e) {
				resultado = e.getMessage();
			}
		} catch (SQLException e) {
			resultado = e.getMessage();
		}finally{
			Util.fecharConexao(con);
		}
		return resultado;
	}
	/**
	 * M�todo respons�vel pela atualiza��o do estoque de acordo com o movimento.
	 */
	public String atualizarEstoque(){
		String status = null;
		Estoque estoque = new Estoque();
		if(this.getTipomovimento()==1 || this.getTipomovimento()==3){
			status = estoque.inserirProduto(this.getProduto(), this.getQuantidade());
		}else if(this.getTipomovimento()==2 || this.getTipomovimento()==4){
			status = estoque.retirarProduto(this.getProduto(), this.getQuantidade());			
		}
		return status;
	}
	/**
	 * 
	 * @param cod
	 * Este m�todo realiza uma busca para verificar se o produto
	 * esta cadastrado.
	 */
	public Produto buscar(long cod) throws SQLException{
		Produto prod = new Produto();
		return prod.buscarporcodigo(cod);
		
	}
}

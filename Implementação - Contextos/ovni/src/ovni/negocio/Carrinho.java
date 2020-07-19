package ovni.negocio;
import java.sql.*;
import java.util.Vector; // classe de vetor dinamico.

import sun.security.util.PropertyExpander.ExpandException;

public class Carrinho
{
	private int _Codigo;
	private Vector<ItemCarrinho> _Itens = new Vector<ItemCarrinho>( );
	private String _CEP;
	private float _ValorFrete;
	private float _ValorTotal;
	

	
//***Metodos de acesso
	public void setCodigo( int iCodigo)
	{ this._Codigo = iCodigo; }
	public int getCodigo( )
	{ return this._Codigo ; }

	public void setItem(ItemCarrinho oItem)
	{ this._Itens.addElement(oItem) ;}
	public ItemCarrinho getItem( int iPosicao)
	{ return((ItemCarrinho)this._Itens.elementAt(iPosicao)) ; }

	public void setValorFrete( float dFrete)
	{ this._ValorFrete = dFrete; }
	public float getValorFrete( )
	{ return this._ValorFrete ;}

	public void setValorTotal( float fTotal )
	{ this._ValorTotal = fTotal; }
	public float getValorTotal( )
	{ return this._ValorTotal; }
	
	public void setCEP(String _CEP) 
	{ this._CEP = _CEP; 	}
	public String getCEP() 
	{ return _CEP;}
	
//***Fim dos metodos de acesso
	
	//***Metodo para calcular o valor do frete
	public void CalcularValorFrete(String CEP) throws Exception
	{
		this._ValorFrete = 0;
		this._ValorFrete = FreteCorreios.executar(41106, CEP, calcularPesoItens());	
		CalcularValorTotal();
	}
	public float calcularPesoItens( )
	{
		float dPeso = 0;
		for (int i=0; i < getNumeroItens(); i++ )
		{
			dPeso +=  (float)_Itens.elementAt(i).getProduto().getPeso() * _Itens.elementAt(i).getQuantidade();
		}
		return dPeso;		
	}
	
	public void CalcularValorTotal( ) throws Exception
	{
		this._ValorTotal = 0;
		for (int iCont = 0; iCont<=_Itens.size()-1; iCont++)
		{
			this._ValorTotal += _Itens.elementAt(iCont).getValorItem();
		}					
		
		this._ValorTotal = this._ValorTotal + this._ValorFrete;
	}

	public int getNumeroItens()
	{ return(_Itens.size()); }

//***Metodo para verificar se ja existe um produto se sim retorna true
	public boolean verificarItem(int iCodigo)
	{
		boolean result = false;
		for (int iCont = 0; iCont<_Itens.size(); iCont++)
		{
			if (_Itens.elementAt(iCont).getProduto().getCodigo() == iCodigo)
				result = true;
			else
				result = false;
		}
		return result;
	}// final do metodo verificarItem

	public int retornarPosicaoProdutoPorCodigo(int iCodigo)
	{
		for (int iCont=0; iCont<_Itens.size(); iCont++)
		{
			if (_Itens.elementAt(iCont).getProduto().getCodigo() == iCodigo)
			{
				return iCont;
			}
				
		}// final do for
		return 0;
	}// final do metodo retornar posicao

	/*
	 * Método alterar a quantidade de um item.
	 */
	public void alterarItem(int iPosicao, int iQuantidade) throws Exception
	{
		_Itens.elementAt(iPosicao).alterarQuantidade(iQuantidade);
		this.CalcularValorTotal();
	}
	public void inserirItem(short iCodigoProduto) throws SQLException, Exception
	{
		if( verificarItem(iCodigoProduto) == false)
		{
			Produto _Produto = new Produto( );
			_Produto = _Produto.buscarporcodigo(iCodigoProduto);

			ItemCarrinho item = new ItemCarrinho();
			item.addProduto(_Produto, 1);
			this.setItem(item);
			item = null;
			CalcularValorTotal();	
		}
	}
	
	//***Metodo para eliminar um Item do Vetor de Itens
	public void excluirItem(int iCodigo) throws Exception
	{
		for (int iCont = 0; iCont<_Itens.size(); iCont++)
		{
			if (iCont == iCodigo)
			{
				_Itens.removeElementAt(iCont);
				this.CalcularValorTotal( );
			}
		}
	}


}//final da classe
	
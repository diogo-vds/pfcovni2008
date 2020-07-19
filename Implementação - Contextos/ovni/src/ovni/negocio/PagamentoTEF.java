package ovni.negocio;

public class PagamentoTEF {
	
	public void confirmar()
	{
		CartaoCredito cartao = new CartaoCredito();
		
		Thread ta = new Thread(cartao);
		
		ta.start();
	}

}

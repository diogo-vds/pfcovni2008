package ovni.negocio;

public class Pagamento {
	
	public void confirmarCartao()
	{
		CartaoCredito cartao = new CartaoCredito();		
		Thread ta = new Thread(cartao);		
		ta.start();	
	}
	public void conformarBoleto(String filePath)
	{
		Boleto bol = new Boleto();
		//bol.confirmarPagamento(filePath);
	}

}

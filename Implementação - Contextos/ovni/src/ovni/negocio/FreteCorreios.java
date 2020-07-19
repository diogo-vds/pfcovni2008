package ovni.negocio;
import java.sql.*;
import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class FreteCorreios implements IFrete {

	private String _CepDestino;
	private int _CodigoServico;
	private double _Peso;


	public void setCepDestino(String _CepDestino) {
		this._CepDestino = _CepDestino;
	}
	public String getCepDestino() {
		return _CepDestino;
	}
	public void setCodigoServico(int _CodigoServico) {
		this._CodigoServico = _CodigoServico;
	}
	public int getCodigoServico() {
		return _CodigoServico;
	}
	public void setPeso(double _Peso) {
		this._Peso = _Peso;
	}
	public double getPeso() {
		return _Peso;
	}


	public FreteCorreios()
	{	}

	
	/**
	 * Calcula o valor do Frete
	 * @return um double com o valor do Frete
	 */
	public float calcularFrete() throws Exception
	{
		float valorFrete = 0;
		try
		{
			String src = gerarEndereco( );
		
			InputSource is = new InputSource(src);		
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();		
			DocumentBuilder db = dbf.newDocumentBuilder();		
			Document doc = db.parse(is);		
			Element de = doc.getDocumentElement();		
			NodeList ndDadosPostais = de.getElementsByTagName("dados_postais");		
			Element elDadosPostais = (Element) ndDadosPostais.item(0);		
			NodeList dnPrecoPostal = elDadosPostais.getElementsByTagName("preco_postal");		
			Element elPrecoPostal = (Element) dnPrecoPostal.item(0);		
			valorFrete = Float.parseFloat(elPrecoPostal.getFirstChild().getNodeValue());
			
			NodeList ndErro = de.getElementsByTagName("erro");
			Element elDadosErro = (Element) ndErro.item(0);
			
			NodeList ndCodigoErro = elDadosErro.getElementsByTagName("codigo");
			NodeList ndDescricaoErro = elDadosErro.getElementsByTagName("descricao");
			
			Element elCoderro = (Element) ndCodigoErro.item(0);
			Element elDescerro = (Element) ndDescricaoErro.item(0);
			if ( Integer.parseInt(elCoderro.getFirstChild().getNodeValue()) != 0)
			{
				throw new Exception(elDescerro.toString());
			}
		
		}
		catch( Exception erro){	}		
		return valorFrete;
	}
	
	public String gerarEndereco( ) throws SQLException{
		StringBuilder sb = new StringBuilder();
		
		sb.append("http://www.correios.com.br/encomendas/precos/calculo.cfm?resposta=xml&servico=");
		sb.append(getCodigoServico());
		sb.append("&cepOrigem=");
		sb.append(recuperarCEPOrigem());
		sb.append("&cepDestino=");
		sb.append(getCepDestino());
		sb.append("&peso=");
		sb.append(getPeso());	
		return sb.toString();	
	}
	
	
	/**
	 * Recupera o cep da empresa
	 * @return Um objeto String com o CEP da empresa
	 * @throws SQLException
	 */
	public String  recuperarCEPOrigem( ) throws SQLException {
		Empresa empresa = new Empresa();
		empresa = empresa.recuperarDadosEmpresa();
		return empresa.getCEP();
	}	
	
	public static float executar(int iCodigoServico, String sCepDestino, double dPeso ) throws Exception{
		FreteCorreios frete = new FreteCorreios();
		frete.setCepDestino(sCepDestino);
		frete.setCodigoServico(iCodigoServico);
		frete.setPeso(dPeso);
		return frete.calcularFrete();
	}	
}

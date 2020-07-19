package ovni.negocio;
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.io.*;

public class XmlReader
{
		// Atributos da Classe
		private String _caminhoXML; 
		
		// Método de Acesso
		public void setCaminhoXML(String caminho)
		{ this._caminhoXML = caminho; }
		public String getXmlReader()
		{ return this._caminhoXML; }
		
		// Métodos de Negócio		
		/**
		 * Método para ler Arquivo XML
		 * @return Vector<Sms>
		 * @throws Exception
		 */
		public Vector<Sms> LerMensagem() throws Exception
		{
				// indica qual o arquivo XML usar	    		
				DocumentBuilderFactory dbfLer = DocumentBuilderFactory.newInstance();
				DocumentBuilder dbLer = dbfLer.newDocumentBuilder();
				Document docLer = dbLer.parse(this.getXmlReader());
				Element elElemento = docLer.getDocumentElement(); 
				NodeList nlLista = elElemento.getElementsByTagName("sms"); // pega todos os elementos de nome sms do XML
				
				Vector<Sms> vtSms = new Vector<Sms>(); //prepara o vetor

				for (int i=0;i<nlLista.getLength();i++) //percorrendo o vetor
				{
					Element tagSMS = (Element) nlLista.item(i);
					int iId = Integer.parseInt(tagSMS.getAttribute("id") ); 
					// Nós Filhos
					int iDdd = Integer.parseInt(getChildTagValue(tagSMS,"ddd")); 
					int iTelefone = Integer.parseInt(getChildTagValue(tagSMS,"telefone"));
					String sFlag = getChildTagValue(tagSMS,"flag");
					String sMensagem = getChildTagValue(tagSMS,"mensagem");

					Sms oSms = new Sms ();
					oSms.setId(iId);
					oSms.setDdd(iDdd);
					oSms.setTelefone(iTelefone);
					oSms.setFlag(sFlag);
					oSms.setMensagem(sMensagem);

					vtSms.addElement(oSms); 
					ApagarArquivo();
				} 		// final do percorrer o vetor
				return vtSms;
		}// final do metodo 


	    /**
	     * Método para ler e retornar o conteudo de uma tag filha da tag informada como parametro
	     * @param elem
	     * @param tagSms
	     * @return String
	     * @throws Exception
	     */
		private String getChildTagValue( Element elem, String tagSms) throws Exception
		{
			NodeList children = elem.getElementsByTagName( tagSms );
			if ( children == null)
			{ return null; }
			Element child = (Element) children.item(0);
			if ( children == null)
			{ return null; }
			return child.getFirstChild().getNodeValue();
		}
		
		/**
		 * Método para Apagar Arquivo XML recebido após Processamento
		 * @throws Exception
		 */
		public void ApagarArquivo() throws Exception
		{
			try
			{
				File arquivo = new File (this.getXmlReader());   
				arquivo.delete();  		    		
			}
			catch (Exception erro){throw new Exception(erro.getMessage());}	
		}    
}// final da classe
	

	

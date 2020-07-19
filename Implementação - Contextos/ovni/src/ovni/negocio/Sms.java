package ovni.negocio;
import java.util.Vector;

public class Sms  
{
		// Atributos da Classe
		private int _id;
		private int _ddd;
		private int _telefone;
		private String _flag;
		private String _mensagem;		
		
	    // Métodos de Acesso
	    public int getId() 
		{	return _id;		}
		public void setId(int iId ) 
		{	this._id = iId;		}
		
		public int getDdd() 
		{	return _ddd;		}
		public void setDdd(int iDdd ) 
		{	this._ddd = iDdd;		}
		
		public int getTelefone() 
		{	return _telefone;		}
		public void setTelefone(int iTelefone) 
		{	this._telefone = iTelefone;	}
				
		public String getFlag() 
		{	return _flag;		}
		public void setFlag(String sFlag) 
		{	this._flag = sFlag;		}
		
		public String getMensagem() 
		{	return _mensagem;		}
		public void setMensagem(String sMensagem) 
		{	this._mensagem = sMensagem;		}
		
		// Métodos de Negócio			    
	    /**
	    * Método para Controlar as Ações do SMS
	    * @param sCaminho
	    * @param lId
	    * @throws Exception
	    */
	    public void Controle(String sCaminho, long lId) throws Exception{
	    try
	    	{
	    		XmlReader oXmlReader = new XmlReader();
	    		oXmlReader.setCaminhoXML(sCaminho);
	    		Vector<Sms> vctSms = oXmlReader.LerMensagem();		    		
	    		for (int i=0; i<vctSms.size(); i++ )
				{
					Sms oSms = (Sms) vctSms.get(i);
					if (oSms.getFlag().toUpperCase().equals("BUSCAR"))
					{						
						oSms.Pesquisar(vctSms,lId);
					}
					else
					{
						if (oSms.getFlag().toUpperCase().equals("COMPRAR"))
						{						
							oSms.GerarPedido(vctSms,lId);
						}	
						else
						{
							if (oSms.getFlag().toUpperCase().equals("ACOMPANHAR"))
							{						
								oSms.Acompanhar(vctSms,lId);
							}
							else
							{
								GeradorXML oGeradorXML = new GeradorXML();
								oGeradorXML.GerarXmlErroOpcao(lId, oSms.getDdd(), oSms.getTelefone());	
							}
						}
					}
				}		
	       }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
	    }
	    
	    
	    /**
	     * Método para pesquisar Produtos por SMS
	     * @param vctSms
	     * @param lId
	     * @throws Exception
	     */
	    public void Pesquisar(Vector<Sms> vctSms, long lId) throws Exception
	    {
	    	try
	    	{	
	    		for (int i=0; i<vctSms.size(); i++ )
				{
	    			Sms oSms = (Sms) vctSms.get(i);					
					Produto oProduto = new Produto();
					Vector<Produto> vctListaProdutos = new Vector<Produto>(); 					
					vctListaProdutos = oProduto.BuscarProdutosSMS(oSms.getMensagem(),0);					
					GeradorXML oGeradorXML = new GeradorXML();
					oGeradorXML.GerarXmlPesquisa(vctListaProdutos, lId, oSms.getDdd(), oSms.getTelefone());	    							
				}		
	    	}
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
	    }	   
	    
	    /**
	     * Método para Gerar Pedido por SMS
	     * @param vctSms
	     * @param lId
	     * @throws Exception
	     */
	    public void GerarPedido(Vector<Sms> vctSms,long lId) throws Exception
	    {
	    	try
	    	{
	    		for (int i=0; i<vctSms.size(); i++ )
				{
	    			Sms oSms = (Sms) vctSms.get(i);	
	    			
	    			//Quantidade de Produtos a serem comprados
	    			int iQuantidade = 1;
	    			
	    			//Pesquisar no BD o usuario para a compra
	    			Usuario oUsuario = new Usuario();
	    			oUsuario = oUsuario.BuscarUsuarioCelular(oSms.getTelefone());
	    			Endereco oEndereco = new Endereco();
	    			oEndereco = oEndereco.BuscarEnderecoCelular(oUsuario.getCodigo());	
	    			
	    			//Pesquisar o Produto 
					Produto oProduto = new Produto();					
					oProduto = oProduto.buscarporcodigo(Long.parseLong(oSms.getMensagem())); 
					
					//Verificar o Estoque
					Estoque oEstoque = new Estoque();
					boolean bEstoque;
					bEstoque = oEstoque.VerificarEstoque(oProduto.getCodigo(),iQuantidade);
					String sMensagem;					
	    			if(oUsuario.getCodigo()!= 0)
	    			{
	    				if(oProduto.getCodigo()!= 0)
	    				{
	    					if(bEstoque == true)
	    					{
	    						//Setar dados do Pedido por SMS
	    						PedidoSMS oPedidoSMS = new PedidoSMS();
	    						oPedidoSMS.setUsuario(oUsuario);
	    						oPedidoSMS.setProduto(oProduto);
	    						oPedidoSMS.setEndereco(oEndereco);
	    						oPedidoSMS.setQuantidade(iQuantidade); 						
	    						
	    						//Gerar Pedido
	    						Vector<PedidoSMS> vctPedidoSMS = new Vector<PedidoSMS>();
	    						vctPedidoSMS = oPedidoSMS.GerarPedido();
	    						
	    						//Baixa na Quantidade Disponivel em Estoque
	    						sMensagem = oEstoque.AtualizarQuantidadeDisponivel(oProduto.getCodigo(),iQuantidade);	
	    						
	    						GeradorXML oGeradorXML = new GeradorXML();
	    						oGeradorXML.GerarXmlPedido(vctPedidoSMS,lId,sMensagem);	
	    					}
	    					else
	    					{
	    						sMensagem = "Produto temporariamente indisponível..!!";
			    				Vector<PedidoSMS> vctPedidoSMSI = new Vector<PedidoSMS>();
			    				GeradorXML oGeradorXML = new GeradorXML();
			    				oGeradorXML.GerarXmlPedido(vctPedidoSMSI,lId,sMensagem);
	    					}
	    				}
	    				else
	    				{
	    					sMensagem = "Código de Produto Incorreto..!!";
		    				Vector<PedidoSMS> vctPedidoSMSI = new Vector<PedidoSMS>();
		    				GeradorXML oGeradorXML = new GeradorXML();
		    				oGeradorXML.GerarXmlPedido(vctPedidoSMSI,lId,sMensagem);
	    				}
	    			}
	    			else
	    			{
	    				sMensagem = "Telefone Celular Não Cadastrado, favor cadastrar no Site..!!";
	    				Vector<PedidoSMS> vctPedidoSMSI = new Vector<PedidoSMS>();
	    				GeradorXML oGeradorXML = new GeradorXML();
	    				oGeradorXML.GerarXmlPedido(vctPedidoSMSI,lId,sMensagem);
	    			}			
				}		
	        }
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
	    }	
	    
	    /**
	     * Método para Acompanhar Status do Pedido por SMS
	     * @param vctSms
	     * @param lId
	     * @throws Exception
	     */
	    public void Acompanhar(Vector<Sms> vctSms, long lId) throws Exception
	    {
	    	try
	    	{	
	    		for (int i=0; i<vctSms.size(); i++ )
				{
	    			Sms oSms = (Sms) vctSms.get(i);					
	    			Usuario oUsuario = new Usuario();
	    			oUsuario = oUsuario.BuscarUsuarioCelular(oSms.getTelefone());	    			
	    			PedidoSMS oPedidoSMS = new PedidoSMS();					
	    			Vector<PedidoSMS> vctListaPedidos = new Vector<PedidoSMS>(); 					
	    			vctListaPedidos = oPedidoSMS.AcompanharStatusPedidoSMS(oUsuario.getCodigo(),Long.parseLong(oSms.getMensagem()));
	    			GeradorXML oGeradorXML = new GeradorXML();
					oGeradorXML.GerarXmlStatus(vctListaPedidos, lId, oUsuario);
				}		
	    	}
		    catch (Exception erro){throw new Exception(erro.getMessage());}	
	    }	   
}


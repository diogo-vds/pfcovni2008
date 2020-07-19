package ovni.negocio;
import java.io.*;
import java.util.Vector;        

public class GeradorXML 
{
	/**
	 * Método para Gerar Arquivo XML de Pesquisa de Produtos por SMS
	 * @param vctProdutos
	 * @param lId
	 * @throws Exception
	 */
	public void GerarXmlPesquisa(Vector<Produto> vctProdutos, long lId, int iDdd, int iTelefone) throws Exception
	{
    	try
       	{
			// escreve o cabecalho do arquivo XML.
			String sCaminho = "c:/ovni/web/sms_send/sms"+ lId +".xml";
    		BufferedWriter arquivo;
			arquivo = new BufferedWriter(new FileWriter(sCaminho));
			arquivo.write("<?xml version='1.0' encoding='ISO-8859-1' ?> ");
			arquivo.write(System.getProperty("line.separator"));			
			arquivo.write("<sms>");
			arquivo.write(System.getProperty("line.separator"));
			
			// processa o resultado da consulta e escreve no arquivo XML.
			if(vctProdutos.size()!= 0) 
			{
				    arquivo.write("<info_usuario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write("<ddd_destinatario>" + iDdd + "</ddd_destinatario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write("<celular_destinatario>" + iTelefone + "</celular_destinatario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write("</info_usuario>");
					arquivo.write(System.getProperty("line.separator"));
					for (int i=0; i<vctProdutos.size(); i++ )
					{
						arquivo.write("<produto>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <codigo>" + ((Produto)vctProdutos.get(i)).getCodigo() + "</codigo>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <titulo>" + ((Produto)vctProdutos.get(i)).getTitulo() + "</titulo>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <autorartista>" + ((Produto)vctProdutos.get(i)).getAutorartista() + "</autorartista>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <valor>" + ((Produto)vctProdutos.get(i)).getValor() + "</valor>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <paisorigem>" + ((Produto)vctProdutos.get(i)).getPaisorigem() + "</paisorigem>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <anolancamento>" + ((Produto)vctProdutos.get(i)).getAnolancamento() + "</anolancamento>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <titulo>" + ((Produto)vctProdutos.get(i)).getTitulo() + "</titulo>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <categoria>" + ((Produto)vctProdutos.get(i)).getDescricao_categoria() + "</categoria>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <genero>" + ((Produto)vctProdutos.get(i)).getDescricao_genero() + "</genero>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <tipoproduto>" + ((Produto)vctProdutos.get(i)).getDescricao_tipoproduto() + "</tipoproduto>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("</produto>");
						arquivo.write(System.getProperty("line.separator"));			
					}
			}
			else
			{
				arquivo.write("<produto>");
				arquivo.write(System.getProperty("line.separator"));
				arquivo.write(" <titulo>" + "Produto Não encontrado" + "</titulo>");
				arquivo.write(System.getProperty("line.separator"));
				arquivo.write("</produto>");
				arquivo.write(System.getProperty("line.separator"));	
			}
			// finaliza o arquivo XML.
			arquivo.write("</sms>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.flush();
			arquivo.close(); 
       	}
            catch (Exception erro){throw new Exception(erro.getMessage());}	 
     }       
    
	/**
	 * Método para Gerar Arquivo XML de Pedidos por SMS
	 * @param vctPedidoSMS
	 * @param lId
	 * @throws Exception
	 */
    public void GerarXmlPedido(Vector<PedidoSMS> vctPedidoSMS, long lId, String sMensagem) throws Exception
	{
    	try
       	{
			// escreve o cabecalho do arquivo XML.
    		String sCaminho = "c:/ovni/web/sms_send/sms"+ lId +".xml";
    		BufferedWriter arquivo;
			arquivo = new BufferedWriter(new FileWriter(sCaminho));
			arquivo.write("<?xml version='1.0' encoding='ISO-8859-1' ?> ");
			arquivo.write(System.getProperty("line.separator"));			
			arquivo.write("<sms>");
			arquivo.write(System.getProperty("line.separator"));
			
			// processa o resultado da consulta e escreve no arquivo XML.
			if(vctPedidoSMS.size()!= 0 && vctPedidoSMS != null) 
			{
				for (int j=0; j<vctPedidoSMS.size(); j++ )
				{
					arquivo.write("<info_usuario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write("<ddd_destinatario>" + ((PedidoSMS)vctPedidoSMS.get(j)).getUsuario().getDDD() + "</ddd_destinatario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write("<celular_destinatario>" + ((PedidoSMS)vctPedidoSMS.get(j)).getUsuario().getCelular() + "</celular_destinatario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write("</info_usuario>");
					arquivo.write(System.getProperty("line.separator"));
					
					for (int i=0; i<vctPedidoSMS.size(); i++)
					{
						arquivo.write("<pedido>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("<codigo_pedido>" + ((PedidoSMS)vctPedidoSMS.get(i)).getCodigo() + "</codigo_pedido>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("<produto>" + ((PedidoSMS)vctPedidoSMS.get(i)).getProduto().getTitulo() + "</produto>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("<statuspedido>" + ((PedidoSMS)vctPedidoSMS.get(i)).getDescrStatusPedido() + "</statuspedido>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("<valortotal>" + ((PedidoSMS)vctPedidoSMS.get(i)).getvalorTotal() + "</valortotal>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("<frete>" + ((PedidoSMS)vctPedidoSMS.get(i)).getValorFrete() + "</frete>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("<valorcompra>" + ((PedidoSMS)vctPedidoSMS.get(i)).getValorCompra() + "</valorcompra>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("</pedido>");
						arquivo.write(System.getProperty("line.separator"));			
					}
				}	
			}
			else
			{
				arquivo.write("<pedido>");
				arquivo.write(System.getProperty("line.separator"));
				arquivo.write(" <mensagem>" + sMensagem + "</mensagem>");
				arquivo.write(System.getProperty("line.separator"));
				arquivo.write("</pedido>");
				arquivo.write(System.getProperty("line.separator"));	
			}
			// finaliza o arquivo XML.
			arquivo.write("</sms>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.flush();
			arquivo.close(); 
       	}
            catch (Exception erro){throw new Exception(erro.getMessage());}	 
     }       
    
    /**
	 * Método para Gerar Arquivo XML de Status por SMS
	 * @param vctPedidoSMS
	 * @param lId
	 * @throws Exception
	 */
    public void GerarXmlStatus(Vector<PedidoSMS> vctPedidoSMS, long lId, Usuario oUsuario) throws Exception
	{
    	try
       	{
			// escreve o cabecalho do arquivo XML.
    		String sCaminho = "c:/ovni/web/sms_send/sms"+ lId +".xml";
    		BufferedWriter arquivo;
			arquivo = new BufferedWriter(new FileWriter(sCaminho));
			arquivo.write("<?xml version='1.0' encoding='ISO-8859-1'?> ");
			arquivo.write(System.getProperty("line.separator"));			
			arquivo.write("<sms>");
			arquivo.write(System.getProperty("line.separator"));
			
			// processa o resultado da consulta e escreve no arquivo XML.
			if(vctPedidoSMS!= null && oUsuario.getCodigo()!= 0) 
			{
				for (int j=0; j<vctPedidoSMS.size(); j++ )
				{
					arquivo.write("<info_usuario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write(" <ddd_destinatario>" + ((PedidoSMS)vctPedidoSMS.get(j)).getUsuario().getDDD() + "</ddd_destinatario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write(" <celular_destinatario>" + ((PedidoSMS)vctPedidoSMS.get(j)).getUsuario().getCelular() + "</celular_destinatario>");
					arquivo.write(System.getProperty("line.separator"));
					arquivo.write("</info_usuario>");
					arquivo.write(System.getProperty("line.separator"));
					
					for (int i=0; i<vctPedidoSMS.size(); i++)
					{
						arquivo.write("<pedido>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <codigo_pedido>" + ((PedidoSMS)vctPedidoSMS.get(i)).getCodigo() + "</codigo_pedido>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <produto>" + ((PedidoSMS)vctPedidoSMS.get(i)).getProduto().getTitulo() + "</produto>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write(" <status>" + ((PedidoSMS)vctPedidoSMS.get(i)).getDescrStatusPedido() + "</status>");
						arquivo.write(System.getProperty("line.separator"));
						arquivo.write("</pedido>");
						arquivo.write(System.getProperty("line.separator"));			
					}
				}	
			}
			else
			{
				arquivo.write("<pedido>");
				arquivo.write(System.getProperty("line.separator"));
				arquivo.write("<mensagem>" + "Falha no Processamento" + "</mensagem>");
				arquivo.write(System.getProperty("line.separator"));
				arquivo.write("</pedido>");
				arquivo.write(System.getProperty("line.separator"));	
			}
			// finaliza o arquivo XML.
			arquivo.write("</sms>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.flush();
			arquivo.close(); 
       	}
            catch (Exception erro){throw new Exception(erro.getMessage());}	 
     }     
    
    public void GerarXmlErroOpcao(long lId, int iDdd, int iTelefone) throws Exception
	{
    	try
       	{
			// escreve o cabecalho do arquivo XML.
			String sCaminho = "c:/ovni/web/sms_send/sms"+ lId +".xml";
    		BufferedWriter arquivo;
			arquivo = new BufferedWriter(new FileWriter(sCaminho));
			arquivo.write("<?xml version='1.0' encoding='ISO-8859-1' ?> ");
			arquivo.write(System.getProperty("line.separator"));			
			arquivo.write("<sms>");
			arquivo.write(System.getProperty("line.separator"));
						  
			arquivo.write("<info_usuario>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.write("<ddd_destinatario>" + iDdd + "</ddd_destinatario>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.write("<celular_destinatario>" + iTelefone + "</celular_destinatario>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.write("</info_usuario>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.write("<erro>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.write("<mensagem>" + "Opção Incorreta..!!" + "</mensagem>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.write("</erro>");
			arquivo.write(System.getProperty("line.separator"));				
			
			// finaliza o arquivo XML.
			arquivo.write("</sms>");
			arquivo.write(System.getProperty("line.separator"));
			arquivo.flush();
			arquivo.close(); 
       	}
            catch (Exception erro){throw new Exception(erro.getMessage());}	 
     }       
} // fim da classe. 

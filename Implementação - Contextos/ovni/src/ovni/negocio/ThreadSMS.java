package ovni.negocio;

import java.io.*;

public class ThreadSMS extends Thread 
{
	// Atributos da Classe
	private long _id = 0;
	private boolean _estado = true;
	
	// Método de Acesso
	public long getId() 
	{	return _id;		}
	public void setId(long iId ) 
	{	this._id = iId;		}
	
	public boolean getEstado() 
	{	return _estado;		}
	public void setEstado(boolean bEstado ) 
	{	this._estado = bEstado;		}	
	
	//Métodos de Negócio
	/**
	 * Método para Iniciar a Thread
	 */
	public void run()
	{
	  try 
	  {
		  while(this.getEstado()) 
		  {	  
			  String sDiretorio = "C:/ovni/web/sms_receive";
			  File diretorio = new File(sDiretorio);   
			  String[] arquivos = diretorio.list(); 
			  
			    if (diretorio != null)
			    {
			    	for(int i=0; i<arquivos.length; i++) 
			    	{ 
			    		String filename = arquivos[i];
			    		if(filename.equals("sms.xml"))
			    		{
						  	long lId =  this._id++;
						  	Sms oSms = new Sms();
						  	String sCaminho = sDiretorio + "/sms.xml";
						  	oSms.Controle(sCaminho, lId); 
			    		}
			    	}  
			    	System.out.flush(); // liberação de recursos  
			    	sleep(300000);
			    } 
			    else 
			    {
			        System.out.flush(); // liberação de recursos 	
			        sleep(300000);
			    }	 			    
		  }
	  }catch (Exception erro){ new Exception(erro.getMessage());}	
	}
  
	/**
	 * Método para Parar a Thread
	 * @throws Exception
	 */
	public void PararThread() throws Exception
	{
  		try
  		{	
  			 this.setEstado(false);	
  		}catch (Exception erro){throw new Exception(erro.getMessage());}	
	}
}

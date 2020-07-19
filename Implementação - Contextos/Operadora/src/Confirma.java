import java.io.*;
public class Confirma extends Thread {
	
	private static final String pathREQ = "C:\\ovni\\web\\sms_send\\"; 
	private static final String pathRESP = "C:\\ovni\\web\\sms_receive\\";
	
	public void run(){
			boolean flag = true;
			while (flag)
			{
				try
				{					
					sleep(10000);
					
					File f = new File(pathREQ);
					File[] arqs = f.listFiles();
				
					BufferedReader in = new BufferedReader(new FileReader(arqs[0]));
					String str;
					String[] str2 = null;
			        while ((str = in.readLine()) != null) {
			        	str2 = str.split("\\|");
			        }
			        in.close();
		        
			        String nomeArq = pathRESP + str2[0] + ".txt";
			        if (str2[0].endsWith("111"))
			        {			        	
						BufferedWriter teste = new BufferedWriter(new FileWriter(nomeArq));
						teste.write("APROVADO");
						teste.close();			
						 arqs[0].delete();
				
			        }
			        else
			        {
						BufferedWriter teste = new BufferedWriter(new FileWriter(nomeArq));
						teste.write("REPROVADO");
						teste.close();	
						 arqs[0].delete();
					
			        }
				}
				catch (Exception e) {
					System.out.println("Arquivo não encontrado.");

				}			    
			}
	}

}

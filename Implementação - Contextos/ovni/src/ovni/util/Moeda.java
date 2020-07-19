package ovni.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class Moeda {
	
	
    /**
     * Retorna um double apenas com duas casas decimais
     * @param d "Valo do double a ser convertido"
     */
    public static String formatarDouble(double d)
    {
    	DecimalFormat formatador = new DecimalFormat("###.##");
    	return formatador.format(d);
    }
    
    public static String toReal(float f)
    {
    	DecimalFormat formatador = new DecimalFormat("###.##");
    	formatador.setMinimumFractionDigits(2);
    	formatador.setMaximumFractionDigits(2);
    	return formatador.format(f);
    }
    
    
    public static String formatarDouble(double d,int casas)
    {
    	String sCasas = "";
    	
    	for(int i=0;i<casas;i++)
    	{
    		sCasas = sCasas + "#";    		
    	}
    	
    	DecimalFormat formatador = new DecimalFormat("###." + sCasas);
    	return formatador.format(d);
    }
    
    /**
     * Retorna uma string apenas com duas casas decimais
     * @param d "Valo da String a ser convertido"
     */
    public static String formatarDouble(String s)
    {
    	DecimalFormat formatador = new DecimalFormat("###.##");
    	return formatador.format(s);
    }

}

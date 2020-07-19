/*
 * Util.java
 *
 * Created on 6 de Outubro de 2007, 12:02
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package ovni.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.misc.BASE64Encoder;
        
        
/* Util.java
 */
public class Util {

    /* Cria um obj pra encriptar dados */
    private static Connection conexao = null;

    /**
     * Cria uma conexao com o banco de dados.
     */
    public static Connection getConexao() {

        ResourceBundle rbConexao;
        rbConexao = ResourceBundle.getBundle("ovni.util.config");
        String sServidor = rbConexao.getString("servidor");
        String sPorta = rbConexao.getString("porta");
        String sBanco = rbConexao.getString("banco");
        String sUsuario = rbConexao.getString("usuario");
        String sSenha = rbConexao.getString("senha");
        try {
            // Informa qual o driver jdbc
            Class.forName("org.postgresql.Driver");

            // Cria uma conexï¿½o com o banco de dados
            conexao = DriverManager.getConnection("jdbc:postgresql:" +sServidor+ ":" +sPorta+ "/" +sBanco+ "?user=" +sUsuario+ "&password=" +sSenha+ "");
        } catch (Exception e) {
            System.out.println("Ocorreu um erro no metodo Util.getConexao(): " + e.getMessage());
        }

        return (conexao);
    }

    /**
     * Fecha a ConexÃ£o com o banco
     */
    public static void fecharConexao(Connection con) {
        try {
            con.close();
        } catch (Exception e) {
            System.out.println("Ocorreu um erro no metodo");
        }

    }

    /**
     * Encripta uma string no com o algoritmo MD5
     */
    public static String encriptarSenha(String textopuro) {        
  
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(textopuro.getBytes());
            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(digest.digest());
        } catch (NoSuchAlgorithmException ns) {
            ns.printStackTrace();
            return textopuro;
        }
    }
    
    /**
     * Retorna um objeto Date a partir do dia, mês e ano
     */    
    public static java.sql.Date retornarData(int ano, int mes, int dia)
    {    	
    	Calendar calendario = Calendar.getInstance();
		calendario.set(Calendar.YEAR, ano);
		calendario.set(Calendar.MONTH, mes);
		calendario.set(Calendar.DATE, dia);
		java.util.Date data = calendario.getTime();   
		return (new java.sql.Date(data.getTime()));    	
    }
    
    /**
     * Retorna formatação de data para DD/MM/YYYY
     */   
    public static String formatarData(java.sql.Date data)
    {
    	String sData;
    	SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy"); 
    	sData = formatador.format(data);
    	return sData;    	
    }   
            
    /**
     * Retorna um double apenas com duas casas decimais
     * @param d "Valo do double a ser convertido"
     */
    public static String formatarDouble(double d)
    {
    	DecimalFormat formatador = new DecimalFormat("###.##");
    	return formatador.format(d);
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
    
    public static void MostraErroWAP(String Erro,HttpServletResponse rs) throws ServletException, IOException
    {
    	rs.setContentType("text/vnd.wap.wml");
        PrintWriter out = rs.getWriter();
        out.println("<?xml version=\"1.0\"?>");
        out.println("<!DOCTYPE wml PUBLIC " + "\"-//WAPFORUM//DTD WML 1.1//EN\" " + "\"http://www.wapforum.org/DTD/wml_1.1.xml\">");
        out.println("<wml>");
        out.println("<card id=\"Produtos\" title=\"Produtos\">");
        out.println("  <p><br/><b> ERRO: </b><br/>");		
        out.println(Erro);
		out.println("  </p>");
        out.println("</card>");
        out.println("</wml>");				
		out.close(); // fecha o fluxo printWriter;
    	
    	
    }
    
} // fim da classe Util.


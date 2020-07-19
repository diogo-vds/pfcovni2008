/*
 * Util.java
 *
 * Created on 6 de Outubro de 2007, 12:02
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
 
package ovni.util;
import java.sql.*;
import java.text.*;
import java.util.*;

/**
 * Util.java
 */
public class Util
{
    /**
     * Cria uma conexao com o banco de dados.
     */

    private static Connection conexao = null;

    public static Connection getConexao()
    {

        ResourceBundle rbConexao ;
		rbConexao = ResourceBundle.getBundle("ovni.util.config");
		String sBanco = rbConexao.getString("banco");
		String sUsuario = rbConexao.getString("usuario");
		String sSenha = rbConexao.getString("senha");
		String sHost = rbConexao.getString("host");
		
        try {
            // Informa qual o driver jdbc
            Class.forName("org.postgresql.Driver");

            // Cria uma conexão com o banco de dados
            conexao = DriverManager.getConnection ("jdbc:postgresql://"+sHost+":5432/"+sBanco+"?user="+sUsuario+"&password="+sSenha+"");
        
        catch (Exception e) 
        {
            System.out.println("Ocorreu um erro no metodo Util.getConexao(): " + e.getMessage());
        }

        return(conexao);
    }


	public static void fecharConexao()
	{
		try{
		conexao.close();
		}
		catch (Exception e)
		{
			System.out.println("Ocorreu um erro no metodo");
		}

	}
    



} // fim da classe Util.

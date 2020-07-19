/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ovni.util;

/**
 *
 * @author Leo
 */
import java.sql.*;
import java.text.*;
import java.util.*;

public class Menu {
  
   
    public Menu(){}
    
     //Método Utilizado para Criar os Itens de Menu
    public static ResultSet ItensMenu(int Tipo) throws SQLException,Exception
    {
        
        //Monta Query
        String SQL = "";
       
        //Tipo de Produto
        SQL = SQL + " select tipo._descricao as descricao,tipo._codigo as tipoproduto,0 as genero,1 as nivel from tipoproduto as tipo ";
        SQL = SQL + "  where (tipo._codigo = ? or ? = 0) ";           
        SQL = SQL + "   union  ";           
        //Genero
        SQL = SQL + " select  ge._descricao as descricao,tipo._codigo as tipoproduto,ge._codigo as genero,2 as nivel ";
        SQL = SQL + "  from genero as ge ";
        SQL = SQL + "  inner join tipoproduto as tipo on tipo._codigo = ge._tipoproduto ";
        SQL = SQL + "  where (tipo._codigo = ? or ? = 0) ";   
        
        SQL = SQL + "order by tipoproduto,genero,nivel";
        
        ResultSet rs = null;
        
            try
            {
                    Connection conexao = Util.getConexao( );
                    PreparedStatement pstmt = conexao.prepareStatement(SQL);
                    pstmt.setInt(1, Tipo);
                    pstmt.setInt(2, Tipo);
                    pstmt.setInt(3, Tipo);
                    pstmt.setInt(4, Tipo);                    
                    rs = pstmt.executeQuery( );
                    
            }// FInal do TRY

            catch( SQLException erro){ throw new SQLException(erro.getMessage() ); }
            return rs ;          
    }
  
}



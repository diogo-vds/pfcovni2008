package ovni.relatorios;
/*
 * Relatorio.java
 *
 * Created on 25 de Setembro de 2008, 11:22
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperRunManager;
import ovni.util.Util;

/**
 *
 * @author fe014
 */
public class Relatorio {
    
    /** Creates a new instance of Relatorio */
    public Relatorio() {
    }
    
    private ArrayList Paramentros;
    private ArrayList TipoRelatorio;
    private String Path;
    private String Nome;
    private String Grupo;
    private int Codigo;
    
    public void setParamentros( ArrayList Paramentros )
    {
        this.Paramentros = Paramentros;
    }
    public ArrayList getParamentros()
    {
        return Paramentros;
    }
    public void setTipoRelatorio( ArrayList TipoRelatorio )
    {
        this.TipoRelatorio = TipoRelatorio;
    }
    public ArrayList getTipoRelatorio()
    {
        return TipoRelatorio;
    }
    public void setPath( String Path )
    {
        this.Path = Path;
    }
    public String getPath()
    {
        return Path;
    }
    public int getCodigo()
    {
        return Codigo;
    }
    public void setCodigo( int Codigo )
    {
        this.Codigo = Codigo;
    }
    public String getNome()
    {
        return Nome;
    }
    public void setNome( String Nome )
    {
        this.Nome = Nome;
    }
    
    public String getGrupo()
    {
        return Grupo;
    }
    public void setGrupo( String Grupo )
    {
        this.Grupo = Grupo;
    }

    public byte[] gerarRelatorioDesktop()
    throws SQLException, Exception, net.sf.jasperreports.engine.JRException
    {
        String pathJasper = this.getPath() + "VendasDesktop.jasper";

        Connection con = Util.getConexao();
        Map parametros = new HashMap();  
        
        // Cria o relatório
        JasperPrint impressao = JasperFillManager.fillReport(pathJasper, parametros, con);
        byte[] bytes = null; 
        // Armazena a codificação do relatório em bytes, conforme o formato PDF
        bytes = JasperRunManager.runReportToPdf(pathJasper,parametros,con);

        Util.fecharConexao(con);
        return( bytes );
    }
    
    public byte[] gerarRelatorioSms()
    throws SQLException, Exception, net.sf.jasperreports.engine.JRException
    {
        String pathJasper = this.getPath() + "VendasSms.jasper";

        Connection con = Util.getConexao();
        Map parametros = new HashMap();  
        
        // Cria o relatório
        JasperPrint impressao = JasperFillManager.fillReport(pathJasper, parametros, con);
        byte[] bytes = null; 
        // Armazena a codificação do relatório em bytes, conforme o formato PDF
        bytes = JasperRunManager.runReportToPdf(pathJasper,parametros,con);

        Util.fecharConexao(con);
        return( bytes );
    }
    
}

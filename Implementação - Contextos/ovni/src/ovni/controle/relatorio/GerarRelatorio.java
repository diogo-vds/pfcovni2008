package ovni.controle.relatorio;
/*
 * GestaoRelatorio.java
 *
 * Created on 20 de Julho de 2008, 14:00
 */



import java.io.*;
import java.net.*;
import java.util.*;
import java.sql.*;
import java.lang.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.JOptionPane;

import ovni.relatorios.Relatorio;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.view.JasperViewer;

public class GerarRelatorio extends HttpServlet {
	
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        processRequest(request, response);
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);                
    }
    
    public void gerarRelatorioSms( HttpServletRequest Request, HttpServletResponse response )
    throws SQLException, Exception
    {       
        try
        {
            Relatorio relatorio = new Relatorio();
            relatorio.setPath( getServletContext().getRealPath("/relatorio/") + "/" );
            byte[] bytes = relatorio.gerarRelatorioSms();
            if (bytes != null && bytes.length > 0) 
            {  
                 // Envia e exibe o relatório em formato PDF para o browser  
                 response.setContentType( "application/pdf" );  
                 response.setContentLength( bytes.length );  
                 OutputStream ouputStream = null;
                 ouputStream = response.getOutputStream();  
                 ouputStream.write( bytes, 0, bytes.length );  
                 ouputStream.flush();  
                 ouputStream.close();  
             }      
        }
        catch (net.sf.jasperreports.engine.JRException e) 
        {
            response.getWriter().println("Erro ao gerar o relatório: " + e);
        }       

    }       
    
    
    public void gerarRelatorioDesktop( HttpServletRequest Request, HttpServletResponse response )
    throws SQLException, Exception
    {       
        try
        {
            Relatorio relatorio = new Relatorio();
            relatorio.setPath( getServletContext().getRealPath("/relatorio/") + "/" );
            byte[] bytes = relatorio.gerarRelatorioDesktop();
            if (bytes != null && bytes.length > 0) 
            {  
                 // Envia e exibe o relatório em formato PDF para o browser  
                 response.setContentType( "application/pdf" );  
                 response.setContentLength( bytes.length );  
                 OutputStream ouputStream = null;
                 ouputStream = response.getOutputStream();  
                 ouputStream.write( bytes, 0, bytes.length );  
                 ouputStream.flush();  
                 ouputStream.close();  
             }      
        }
        catch (net.sf.jasperreports.engine.JRException e) 
        {
            response.getWriter().println("Erro ao gerar o relatório: " + e);
        }       

    }       
    
    protected void processRequest(HttpServletRequest rq, HttpServletResponse rp)
    throws ServletException, IOException {

    	if("desktop".equals(rq.getParameter("tipo"))){
    		try {
    			this.gerarRelatorioDesktop(rq,rp);
    		} catch (SQLException e) {
    			e.printStackTrace();
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    	}else if("sms".equals(rq.getParameter("tipo"))){	
    		try {
    			this.gerarRelatorioSms(rq,rp);
    		} catch (SQLException e) {
    			e.printStackTrace();
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    	}

    }
    
}

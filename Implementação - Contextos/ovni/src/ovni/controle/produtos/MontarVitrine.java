package ovni.controle.produtos;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.math.*; 
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ovni.negocio.*;

public class MontarVitrine extends HttpServlet
{

	public void MontarVitrine(HttpServletRequest rq, HttpServletResponse rs) throws SQLException, Exception
	{
                /** Inicio do Try*/    
                try
                {	 
                	Vector<Produto> _VitrineProdutos = new Vector<Produto>();                 	
                	
                	int iTipo = 0;
                	int iGenero = 0;
                	
                	if(rq.getParameter("tipo") != null)iTipo = Integer.parseInt(rq.getParameter("tipo")) ;
                	if(rq.getParameter("genero") != null) iGenero = Integer.parseInt(rq.getParameter("genero"));               	
                	
            	  	Vitrine oVitrine = new Vitrine();
            	  	
            	  	_VitrineProdutos = (Vector<Produto>) oVitrine.BuscarVitrines(iTipo, iGenero);           	  	
            	  	
            	    rq.setAttribute("vtVitrineProdutos",_VitrineProdutos);            	    
            		getServletConfig().getServletContext().getRequestDispatcher("/vitrine.jsp").forward(rq, rs);
            	    
                		   
                }
                catch (SQLException SQLErro){throw new SQLException(SQLErro.getMessage());}
                catch (Exception Erro){throw new Exception(Erro.getMessage());}	
	}
	
	protected void processRequest(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{                      
                /** Inicio do Try */
		try
		{			
				MontarVitrine(rq, rs);                                          
		}
                /** Final do Try */
                /** Catch ServletException */
		catch (ServletException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet LoginUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp"); 
		}               
                /** Catch IOException */
		catch (IOException erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet LoginUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
                /** Catch Exception */
		catch (Exception erro) 
		{
			rq.getSession( ).setAttribute("sMsg", "Erro ao chamar o metodo processRequest da servlet LoginUsuario");
			rq.getSession( ).setAttribute("erro", erro);
			rs.sendRedirect("Erro.jsp");
		}
	}
        /** Final do processRequest */
	
        /** Override para iniciar Solicitação do Cliente */
        /** Inicio do Método doGet */
    @Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    	}
        /** Final do Método doGet */

        /** Inicio do Método doPost */
    @Override
   	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException
	{
        	processRequest(rq, rs);
    	} 
        /** Final do Método doPost */
	
}

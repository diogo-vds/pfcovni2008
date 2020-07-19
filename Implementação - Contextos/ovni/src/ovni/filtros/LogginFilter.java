/**
 * 
 */
package ovni.filtros;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.*;

import ovni.negocio.Usuario;

/**
 * @author Leo
 * 
 * Classe Responsável por verificar se o usuário está logado
 *
 */
public class LogginFilter implements Filter {

	private FilterConfig _filterConfig = null ;
	
	/**
	 * 
	 */
	public LogginFilter() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	@Override
	public void destroy() {
		this._filterConfig = null;		
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain fChain) throws IOException, ServletException {
		
		 HttpServletRequest req = (HttpServletRequest) request;   
	     HttpServletResponse resp = (HttpServletResponse) response;
	     String ReturnURL = req.getRequestURL().toString();
	     
	     ReturnURL = ReturnURL.replaceAll("http://" + req.getServerName().toString() + ":" + req.getServerPort() + req.getContextPath(),"");
     
	     if(req.getSession().getAttribute("Usuario") == null){                     
			 
	    	 req.getSession().setAttribute("ReturnURL",ReturnURL);
	    	 
	    	 //verifica se a requisição veio de um celular	    	 
	    	 
	    	 if(!ReturnURL.contains("/wap/"))
	         {
	    		 resp.sendRedirect(req.getContextPath() + "/acesso.jsp");	         
	         }
	    	 else
	         {
	    		 resp.sendRedirect( req.getContextPath() + "/wap/acesso.jsp");	 
	         }
	     }
		 else{
			 fChain.doFilter(request, response);	 
		 }
	     
	
	}	

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
		_filterConfig = (FilterConfig)filterConfig;

	}

}

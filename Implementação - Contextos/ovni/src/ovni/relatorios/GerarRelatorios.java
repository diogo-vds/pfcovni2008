package ovni.relatorios;
/* pacotes necessários */ 
import net.sf.jasperreports.engine.*; 
import net.sf.jasperreports.view.JasperViewer; 
import java.sql.*; 
import java.util.*; 

public class GerarRelatorios { 
	
	public void geraRelatorioDesktop( ) throws JRException, Exception 
	{ 
		RelatorioVendas relatorio = new RelatorioVendas();
		ResultSet rs = relatorio.pedidosDesktop(); 
		/* implementação da interface JRDataSource para DataSource ResultSet */ 
		JRResultSetDataSource jrRS = new JRResultSetDataSource(rs); 
		/* HashMap de parametros utilizados no relatório. Sempre instanciados */ 
		Map parameters = new HashMap(); 
		// parameters.put("COLUNA", valor); 
		String caminho = "C:\\ovni\\web\\WEB-INF\\classes\\ovni\\relatorios\\";
		/* Preenche o relatório com os dados. Gera o arquivo TESTE.jrprint */ 
		JasperFillManager.fillReportToFile("Total_De_Vendas_Desktop.jasper",parameters, jrRS); 
		/* Exporta para o formato PDF */ 
		JasperExportManager.exportReportToPdfFile(caminho+"Total_De_Vendas_Desktop.jrprint"); 
		/* Preenche o relatorio e o salva diretamente em arquivo PDF. Sem a necessidade do .jrprint */ 
		//JasperRunManager.runReportToPdfFile("TESTE.jasper", parameters, jrRS); 
		/* Visualiza o relatório em formato PDF */ 
		JasperViewer.viewReport( "TESTE.pdf", false ); 
	} 
	public void geraRelatorioWap( ) throws JRException, Exception 
	{ 
		RelatorioVendas relatorio = new RelatorioVendas();
		ResultSet rs = relatorio.PedidosCelular(); 
		/* implementação da interface JRDataSource para DataSource ResultSet */ 
		JRResultSetDataSource jrRS = new JRResultSetDataSource(rs); 
		/* HashMap de parametros utilizados no relatório. Sempre instanciados */ 
		Map parameters = new HashMap(); 
		// parameters.put("COLUNA", valor); 
		/* Preenche o relatório com os dados. Gera o arquivo TESTE.jrprint */ 
		JasperFillManager.fillReportToFile("VendasDesktop.jasper",parameters, jrRS); 
		/* Exporta para o formato PDF */ 
		JasperExportManager.exportReportToPdfFile("VendasDesktop.jrprint"); 
		/* Preenche o relatorio e o salva diretamente em arquivo PDF. Sem a necessidade do .jrprint */ 
		//JasperRunManager.runReportToPdfFile("TESTE.jasper", parameters, jrRS); 
		/* Visualiza o relatório em formato PDF */ 
		JasperViewer.viewReport( "TESTE.pdf", false ); 
	} 
} 
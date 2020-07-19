package ovni.controle.produtos;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ovni.util.Util;

 

public class Upload extends HttpServlet{


	public void doGet(HttpServletRequest rq, HttpServletResponse rp){

			this.carregarImagem(rq, rp);

	}
	public void doPost(HttpServletRequest rq, HttpServletResponse rp){

			this.carregarImagem(rq, rp);

	}

	public void carregarImagem(HttpServletRequest rq, HttpServletResponse rp) {
	
			PrintWriter p = null;
			try {
				p = rp.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String prod = (String)rq.getSession().getAttribute("codprod");
			boolean isMultiPart = FileUpload.isMultipartContent(rq);
			p.print("Multipart: "+ isMultiPart);
			if (isMultiPart) {

				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);

				String formulario = "";
				try {
					List items = upload.parseRequest(rq);
					Iterator iter = items.iterator();
					while (iter.hasNext()) {
						FileItem item = (FileItem) iter.next();
						if (item.getFieldName().equals("tipoForm")) {
							formulario = item.getString();
						}
						if (!item.isFormField()) {
							if (item.getName().length() > 0) {
								this.inserirImagem(item, prod);
								String acao = "ok";
								rq.setAttribute("acao", acao);
								getServletConfig().getServletContext().getRequestDispatcher("/admin/inserirproduto.jsp").forward(rq,rp);
							}
						}
					}
				} 
				catch (FileUploadException ex) {
					p.print(ex.getMessage());
				} 
				catch (Exception ex) {
					p.print(ex.getMessage());
				}
			}
			
	}
	
	 private void inserirImagem(FileItem item,String prod) throws
	 		IOException {
		 
		 //Pega o diretório /logo dentro do diretório atual de onde a 
		 //aplicação está rodando
		 String caminho = getServletContext().getRealPath("/imgs/produtos")+ "/";
		 String url = "imgs/produtos/";
		 // Cria o diretório caso ele não exista
		 File diretorio = new File(caminho);
		 if (!diretorio.exists()){
			 diretorio.mkdir();
		 }

		 // Mandar o arquivo para o diretório informado
		 String nome = item.getName();
		 String arq[] = nome.split("\\\\");
		 for (int i = 0; i < arq.length; i++) {
			 nome = arq[i];
		 }

		 File file = new File(diretorio, nome);
		 FileOutputStream output = new FileOutputStream(file);
		 InputStream is = item.getInputStream();
		 byte[] buffer = new byte[2048];
		 int nLidos;
		 while ((nLidos = is.read(buffer)) >= 0) {
			 output.write(buffer, 0, nLidos);
		 }

		 output.flush();
		 output.close();

		 //Guarda no banco de dados o endereço para recuperação da imagem

		 Connection conexao = Util.getConexao();
		 /**
		  * Estabeleça a conexão
		  */
		 Statement declaracao = null;
		 String sql = "INSERT INTO imagem (_codigo, _url,_produto) VALUES((select nextval('sq_imagem')),'"+url+nome+"',"+prod+")";
		 try {
			 declaracao = conexao.createStatement();
			 declaracao.execute(sql);
			 System.out.print("Imagem enviada com sucesso!!!");
		 } catch (SQLException e) {
			 e.printStackTrace();
		 } catch (Exception e) {
			 e.printStackTrace();
		 }finally{
			 Util.fecharConexao(conexao);
		 }
		 
	 }
}   


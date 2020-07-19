package ovni.negocio;
import ovni.negocio.AutenticadorSenha;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import com.sun.net.ssl.internal.ssl.Provider;


//Inicio da classe Email
public class Email implements Runnable {

	//Atributos
		private Properties props;
		private AutenticadorSenha auth;
		private Session sessao;
		private InternetAddress de;
		private Vector<InternetAddress> para = new Vector<InternetAddress>();
		private String Conteudo;
		private String Assunto;		
		private String mensagemTopo;
		private String mensagemFim ;
		
		
	//Construtor
		public Email( )
		{
			java.security.Security.addProvider(new Provider());
			props = new Properties();
			props.put("mail.transport.protocol","smtp");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.user", "ovnipromocoes@gmail.com");
			props.put("mail.debug", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.debug", "true");
			props.put("mail.mime.charset", "ISO-8859-1");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			auth = new AutenticadorSenha("ovnipromocoes@gmail.com", "senhasecreta");
			sessao = Session.getInstance(props,auth);			
			
			StringBuilder sbTopo = new StringBuilder();
			sbTopo.append("<html><head><title> OVNI.net - Ofertas de outro mundo </title></head>");
			sbTopo.append("<body><table align=\"center\">");
			sbTopo.append("<tr><td><img alt=\"OVNI\" src=\"http://127.0.0.1:8080/ovni/styles/imgs/header.jpg\"/></td></tr>");
			sbTopo.append("<tr>");
			sbTopo.append("<td>");
			
			mensagemTopo = sbTopo.toString();
			
			StringBuilder sbFoot = new StringBuilder();
			sbFoot.append("</td></tr>");
			sbFoot.append("<tr> <td> Mensagem promocional, para cancelar o recebimento de mensagens promocionais  ");
			sbFoot.append(" entre no <a href=\"http://127.0.0.1:8080/ovni\" target=\"_blank\">OVNI</a> e desmarque o campo de ");
			sbFoot.append(" receber mensagems por email");
			sbFoot.append("</td></tr>");
			sbFoot.append("</table></body></html>");
			
			mensagemFim = sbFoot.toString();
		}//final do construtor
		
		public void setConteudo(String conteudo)
		{
			this.Conteudo = conteudo;
		}
		
		public void setAssunto(String assunto)
		{
			this.Assunto = assunto;
		}
		public void setPara(String email) throws MessagingException
		{
			this.para.addElement(new InternetAddress(email));
		}
				
		public void enviarPromocao() 
		{
			Thread ta = new Thread(this);
			ta.start();
		}
		
		public void run()
		{
			try
			{
				de = new InternetAddress("ovnipromocoes@gmail.com");
				MimeMessage message = new MimeMessage(sessao);
				message.setFrom(de);
				message.setSubject(this.Assunto);				
				StringBuilder sbMensagem = new StringBuilder();
				
				sbMensagem.append(mensagemTopo);
				sbMensagem.append(this.Conteudo);
				sbMensagem.append(mensagemFim);
				
				
				MimeBodyPart msgConteudo = new MimeBodyPart();
				msgConteudo.setContent(sbMensagem.toString(), "text/html");
				Multipart mp = new MimeMultipart();
				mp.addBodyPart(msgConteudo);
				message.setContent(mp);
				
				for (int iCont = 0; iCont < this.para.size(); iCont++)
				{
					message.addRecipient(Message.RecipientType.TO, para.elementAt(iCont));
					Transport.send(message);
				}
				
	
			}
			catch (MessagingException e) {	}
				
		}
		

} //Final da classe Email
<%@ page import="java.util.*, javax.activation.*, javax.mail.*, javax.mail.internet.*" %>
<%@ page import="ovni.negocio.AutenticadorSenha"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="com.sun.net.ssl.internal.ssl.Provider"%>

<html>
<head><title>Usando JSP com JavaMail</title></head>
<body>

<%

	java.security.Security.addProvider(new Provider());


  Properties props = new Properties();
  props.put("mail.transport.protocol","smtp");
  props.put("mail.smtp.starttls.enable", "true");
  props.put("mail.smtp.host", "smtp.gmail.com");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.user", "rurounigabi@gmail.com");
  props.put("mail.debug", "true");
  props.put("mail.smtp.port", "465");
  props.put("mail.smtp.debug", "true");
  props.put("mail.mime.charset", "ISO-8859-1");
  props.put("mail.smtp.socketFactory.port", "465");
  props.put("mail.smtp.socketFactory.fallback", "false");
  props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
  

	AutenticadorSenha auth = new AutenticadorSenha("rurounigabi@gmail.com", "564448");
	
  
  Session s = Session.getInstance(props,auth);

  MimeMessage message = new MimeMessage(s);
  InternetAddress from = new InternetAddress("adm@ovni.com.br");
  message.setFrom(from);
  InternetAddress to = new InternetAddress("phekdathor@hotmail.com");
  message.addRecipient(Message.RecipientType.TO, to);
  message.setSubject("Envio de anexos usando o JavaMail.");
  
  // cria a primeira parte da mensagem
  MimeBodyPart mbp1 = new MimeBodyPart();
  mbp1.setText("Esta mensagem contém um anexo");

  // cria a segunda parte da mensagem
  MimeBodyPart mbp2 = new MimeBodyPart();

  // anexa o arquivo à mensagem
  FileDataSource fds = new FileDataSource(getServletContext().getRealPath("/") + "default.jsp");
  mbp2.setDataHandler(new DataHandler(fds));
  mbp2.setFileName(fds.getName());

  // Cria o Multipart a adiciona as duas partes a ele
  Multipart mp = new MimeMultipart();
  mp.addBodyPart(mbp1);
  mp.addBodyPart(mbp2);

  message.setContent(mp);

  Transport.send(message);
%>

<p align="center">E-Mail enviado com sucesso!</p>

</body>
</html>

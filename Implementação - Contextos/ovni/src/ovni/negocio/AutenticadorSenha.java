package ovni.negocio;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class AutenticadorSenha extends Authenticator{
	
	private String usuario;
	private String senha;
	
	public AutenticadorSenha(String usuario, String senha)
	{
		this.usuario = usuario;
		this.senha = senha;
	}
		
	public PasswordAuthentication getPasswordAuthentication()
	{
		return new PasswordAuthentication(this.usuario, this.senha);
	}

}

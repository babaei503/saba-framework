package ir.saeidbabaei.saba.bpms;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;


/**Activiti properties for configure mail server
 * @author Saeid Babaei
 *
 */
@ConfigurationProperties("spring.activiti")
@Component
public class ActivitiProperties {

	
	/**The host name of your mail server (e.g. mail.mycorp.com).<br/>
	 *Default is localhost.<br/>
	 *For Gmail be sure to set "Less secure app access" to off in account setting.
	 * 
	 */
	private String mailServerHost = "smtp.gmail.com";
	
	/**The port for SMTP traffic on the mail server.<br/>
	 *The default is 25<br/>
	 *Gmail: 587 for TLS and 465 for SSL.
	 * 
	 */
	private int mailServerPort = 465;
	
	/**Some mail servers require credentials for sending e-mail.<br/>
	 * By default not set.
	 * 
	 */
	private String mailServerUserName = "babaei503@gmail.com";
	
	/**Some mail servers require credentials for sending e-mail.<br/>
	 *By default not set.
	 * 
	 */

	private String mailServerPassword = "********";

	
	/**The default e-mail address of the sender of e-mails, when none is provided by the user.<br/>
	 *By default this is activiti@activiti.org
	 * 
	 */
	private String mailServerDefaultFrom = "babaei503@gmail.com";
	
	/**Some mail servers require SSl communication.<br/>
	 *By default set to false.
	 * 
	 */
	private boolean mailServerUseSsl = true ;
	
	/**Some mail servers (for instance gmail) require TLS communication.</br>
	 *By default set to false.
	 * 
	 */
	private boolean mailServerUseTls = false;


	public String getMailServerHost() {
	  return mailServerHost;
	}
	
	public void setMailServerHost(String mailServerHost) {
	  this.mailServerHost = mailServerHost;
	}
	
	public int getMailServerPort() {
	  return mailServerPort;
	}
	
	public void setMailServerPort(int mailServerPort) {
	  this.mailServerPort = mailServerPort;
	}

	public String getMailServerUserName() {
		return mailServerUserName;
	}
	
	public void setMailServerUserName(String mailServerUserName) {
		this.mailServerUserName = mailServerUserName;
	}
	
	public String getMailServerPassword() {
		return mailServerPassword;
	}
	
	public void setMailServerPassword(String mailServerPassword) {
		this.mailServerPassword = mailServerPassword;
	}
	
	public String getMailServerDefaultFrom() {
		return mailServerDefaultFrom;
	}
	
	public void setMailServerDefaultFrom(String mailServerDefaultFrom) {
		this.mailServerDefaultFrom = mailServerDefaultFrom;
	}
	
	public boolean isMailServerUseSsl() {
		return mailServerUseSsl;
	}
	
	public void setMailServerUseSsl(boolean mailServerUseSsl) {
		this.mailServerUseSsl = mailServerUseSsl;
	}
	
	public boolean isMailServerUseTls() {
		return mailServerUseTls;
	}
	
	public void setMailServerUseTls(boolean mailServerUseTls) {
		this.mailServerUseTls = mailServerUseTls;
	}

}
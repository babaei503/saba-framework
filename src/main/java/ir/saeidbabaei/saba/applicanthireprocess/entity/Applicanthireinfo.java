package ir.saeidbabaei.saba.applicanthireprocess.entity;

import java.util.Date;

import javax.persistence.*;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.security.core.userdetails.User;


/**
 * The persistent class for the applicanthireinfo database table.
 * 
 */
@Entity
public class Applicanthireinfo  {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	
	//bi-directional many-to-one association to Applicant
	@ManyToOne
	@JoinColumn(name="applicantid")
	private Applicant applicant;
	
	private boolean telintviwres;
	
	private String telintviwdesc;
	
	private boolean techintviwres;
	
	private String techintviwdesc;

	private boolean finnegotres;

	private String finnegotdesc;

    @CreatedBy
    User creator;
    
    @LastModifiedBy
    User modifier;
     
    @CreatedDate
    Date createdAt;
     
    @LastModifiedDate
    Date modifiedAt;
	
	/**
	 * @param applicant			Applicant
	 * @param telintviwres		Is telephone interview OK
	 * @param telintviwdesc		Description of telephone interview
	 * @param techintviwres		Is technical interview OK
	 * @param techintviwdesc	Description of technical interview
	 * @param finnegotres		Is finance negotiation OK
	 * @param finnegotdesc		Description of finance negotiation
	 */
	public Applicanthireinfo(Applicant applicant, boolean telintviwres, String telintviwdesc,
			boolean techintviwres, String techintviwdesc, boolean finnegotres,
			String finnegotdesc) {
		super();
		this.applicant = applicant;
		this.telintviwres = telintviwres;
		this.telintviwdesc = telintviwdesc;
		this.techintviwres = techintviwres;
		this.techintviwdesc = techintviwdesc;
		this.finnegotres = finnegotres;
		this.finnegotdesc = finnegotdesc;
	}

	public Applicanthireinfo() {
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the applicant
	 */
	public Applicant getApplicant() {
		return applicant;
	}

	/**
	 * @param applicant the applicant to set
	 */
	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}

	/**
	 * @return the telintviwres
	 */
	public boolean getTelintviwres() {
		return telintviwres;
	}

	/**
	 * @param telintviwres the telintviwres to set
	 */
	public void setTelintviwres(boolean telintviwres) {
		this.telintviwres = telintviwres;
	}

	/**
	 * @return the telintviwdesc
	 */
	public String getTelintviwdesc() {
		return telintviwdesc;
	}

	/**
	 * @param telintviwdesc the telintviwdesc to set
	 */
	public void setTelintviwdesc(String telintviwdesc) {
		this.telintviwdesc = telintviwdesc;
	}

	/**
	 * @return the techintviwres
	 */
	public boolean getTechintviwres() {
		return techintviwres;
	}

	/**
	 * @param techintviwres the techintviwres to set
	 */
	public void setTechintviwres(boolean techintviwres) {
		this.techintviwres = techintviwres;
	}

	/**
	 * @return the techintviwdesc
	 */
	public String getTechintviwdesc() {
		return techintviwdesc;
	}

	/**
	 * @param techintviwdesc the techintviwdesc to set
	 */
	public void setTechintviwdesc(String techintviwdesc) {
		this.techintviwdesc = techintviwdesc;
	}

	/**
	 * @return the finnegotres
	 */
	public boolean getFinnegotres() {
		return finnegotres;
	}

	/**
	 * @param finnegotres the finnegotres to set
	 */
	public void setFinnegotres(boolean finnegotres) {
		this.finnegotres = finnegotres;
	}

	/**
	 * @return the finnegotdesc
	 */
	public String getFinnegotdesc() {
		return finnegotdesc;
	}

	/**
	 * @param finnegotdesc the finnegotdesc to set
	 */
	public void setFinnegotdesc(String finnegotdesc) {
		this.finnegotdesc = finnegotdesc;
	}


}
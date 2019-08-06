package ir.saeidbabaei.saba.applicanthireprocess.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.security.core.userdetails.User;


/**
 * The persistent class for the applicant database table.
 * 
 */
@Entity
public class Applicant  {


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;

    @NotNull
    @Email
	private String email;

    @Size(min = 3, max = 50)
    @NotNull
	private String name;

    @Pattern(regexp="(^$|[0-9]{11})",message="Phone number must be 11 digit")
	private String phoneNumber;

	//bi-directional many-to-one association to Job
	@ManyToOne
	@JoinColumn(name="jobid",nullable=false)
	private Job job;
	
    @CreatedBy
    User creator;
     
    @LastModifiedBy
    User modifier;
     
    @CreatedDate
    Date createdAt;
     
    @LastModifiedDate
    Date modifiedAt;

	public Applicant() {
	}
	
	/**
	 * @param email       Email Address of applicant.
	 * @param name        Full name of applicant.
	 * @param phoneNumber Phone number of applicant.
	 * @param job         The job that applicant apply for.
	 */
	public Applicant(@NotNull @Email String email, @Size(min = 3, max = 50) @NotNull String name,
			@Pattern(regexp = "(^$|[0-9]{11})", message = "Phone number must be 11 digit") String phoneNumber,
			Job job) {
		super();
		this.email = email;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.job = job;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * @return the job
	 */
	public Job getJob() {
		return job;
	}

	/**
	 * @param job the job to set
	 */
	public void setJob(Job job) {
		this.job = job;
	}


}
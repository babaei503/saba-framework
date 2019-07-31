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
	
	public Applicant(@NotNull @Email String email, @Size(min = 3, max = 50) @NotNull String name, String phoneNumber,@NotNull Job job) {

		this.email = email;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.job = job;
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Job getJob() {
		return this.job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

}
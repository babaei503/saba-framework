package ir.saeidbabaei.saba.applicanthireprocess.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.security.core.userdetails.User;

import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the jobs database table.
 * 
 */
@Entity
@Table(name="jobs")
public class Job  {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;

    @Size(min = 3, max = 45)
    @NotNull
	private String code;

    @Size(min = 3, max = 45)
    @NotNull
	private String title;
    
    @Size(min = 3, max = 45)
    @NotNull
    private String company;
    
    @Size(min = 3, max = 45)
    @NotNull
    private String location;
    
    @Size(min = 3, max = 45)
    @NotNull
    private String employment;
    
    @Size(min = 3, max = 45)
    @NotNull
    private String jobfunction;
    
    @Size(min = 3, max = 45)
    @NotNull
    private String industry;
    
    @Size(min = 3, max = 4000)
    @NotNull
	private String description;
    
    @NotNull
    private boolean open;
    
    @CreatedBy
    User creator;
     
    @LastModifiedBy
    User modifier;
     
    @CreatedDate
    Date createdAt;
     
    @LastModifiedDate
    Date modifiedAt;

    public Job() {};
    		
	public Job(@Size(min = 3, max = 45) @NotNull String code, @Size(min = 3, max = 45) @NotNull String title,
			@Size(min = 3, max = 45) @NotNull String company, @Size(min = 3, max = 45) @NotNull String location,
			@Size(min = 3, max = 45) @NotNull String employment, @Size(min = 3, max = 45) @NotNull String jobfunction,
			@Size(min = 3, max = 45) @NotNull String industry, @Size(min = 3, max = 4000) @NotNull String description,
			@NotNull boolean open) {
		super();
		this.code = code;
		this.title = title;
		this.company = company;
		this.location = location;
		this.employment = employment;
		this.jobfunction = jobfunction;
		this.industry = industry;
		this.description = description;
		this.open = open;
	}
    
	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEmployment() {
		return employment;
	}

	public void setEmployment(String employment) {
		this.employment = employment;
	}

	public String getJobfunction() {
		return jobfunction;
	}

	public void setJobfunction(String jobfunction) {
		this.jobfunction = jobfunction;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

}
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
    		
	/**
	 * @param code        Job code.
	 * @param title       Job title.
	 * @param company     Company of job.
	 * @param location    Location of job.
	 * @param employment  Contract type for example Full Time.
	 * @param jobfunction Function of job for example Engineering.
	 * @param industry    Job industry.
	 * @param description Description of job.
	 * @param open        Is the job Open.
	 */
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
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the company
	 */
	public String getCompany() {
		return company;
	}

	/**
	 * @param company the company to set
	 */
	public void setCompany(String company) {
		this.company = company;
	}

	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @return the employment
	 */
	public String getEmployment() {
		return employment;
	}

	/**
	 * @param employment the employment to set
	 */
	public void setEmployment(String employment) {
		this.employment = employment;
	}

	/**
	 * @return the job function
	 */
	public String getJobfunction() {
		return jobfunction;
	}

	/**
	 * @param jobfunction the job function to set
	 */
	public void setJobfunction(String jobfunction) {
		this.jobfunction = jobfunction;
	}

	/**
	 * @return the industry
	 */
	public String getIndustry() {
		return industry;
	}

	/**
	 * @param industry the industry to set
	 */
	public void setIndustry(String industry) {
		this.industry = industry;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the open
	 */
	public boolean isOpen() {
		return open;
	}

	/**
	 * @param open the open to set
	 */
	public void setOpen(boolean open) {
		this.open = open;
	}
    


}
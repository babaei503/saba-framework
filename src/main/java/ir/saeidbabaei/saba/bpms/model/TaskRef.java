package ir.saeidbabaei.saba.bpms.model;

import java.util.Date;

/**Reference class to get tasks from BPMS systems- Defined for loosely couple
 *  
 * @author Saeid Babaei
 *
 */
public class TaskRef  {
	

	private String taskid;
	
	private String name;
	
	private String assignee;
	
	private String category;
	
	private Date claimtime;
	
	private Date createtime;
	
	private String description;
	
	private Date duodate;
	
	private int priority;
	
	private String processdefinitionid;

	
	/**
	 * @param taskId Task id
	 * @param name Task name
	 * @param assignee Task assignee
	 * @param category Task category
	 * @param claimTime Task claim time
	 * @param createTime Task create time
	 * @param description Task description
	 * @param duoDate Task duo date
	 * @param priority Task priority
	 * @param processDefinitionId Process definition Id of task
	 */
	public TaskRef(String taskid, String name, String assignee, String category, Date claimtime, Date createtime,
			String description, Date duodate, int priority, String processdefinitionid) {
		super();
		this.taskid = taskid;
		this.name = name;
		this.assignee = assignee;
		this.category = category;
		this.claimtime = claimtime;
		this.createtime = createtime;
		this.description = description;
		this.duodate = duodate;
		this.priority = priority;
		this.processdefinitionid = processdefinitionid;
	}


	/**
	 * @return the task id
	 */
	public String getTaskid() {
		return taskid;
	}


	/**
	 * @param taskid the task id to set
	 */
	public void setTaskid(String taskid) {
		this.taskid = taskid;
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
	 * @return the assignee
	 */
	public String getAssignee() {
		return assignee;
	}


	/**
	 * @param assignee the assignee to set
	 */
	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}


	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}


	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}


	/**
	 * @return the claim time
	 */
	public Date getClaimtime() {
		return claimtime;
	}


	/**
	 * @param claimtime the claim time to set
	 */
	public void setClaimtime(Date claimtime) {
		this.claimtime = claimtime;
	}


	/**
	 * @return the create time
	 */
	public Date getCreatetime() {
		return createtime;
	}


	/**
	 * @param createtime the create time to set
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
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
	 * @return the duo date
	 */
	public Date getDuodate() {
		return duodate;
	}


	/**
	 * @param duodate the duo date to set
	 */
	public void setDuodate(Date duodate) {
		this.duodate = duodate;
	}


	/**
	 * @return the priority
	 */
	public int getPriority() {
		return priority;
	}


	/**
	 * @param priority the priority to set
	 */
	public void setPriority(int priority) {
		this.priority = priority;
	}


	/**
	 * @return the process definition id
	 */
	public String getProcessdefinitionid() {
		return processdefinitionid;
	}


	/**
	 * @param processdefinitionid the process definition id to set
	 */
	public void setProcessdefinitionid(String processdefinitionid) {
		this.processdefinitionid = processdefinitionid;
	}
	
	
}
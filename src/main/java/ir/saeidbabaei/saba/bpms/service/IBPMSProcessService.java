package ir.saeidbabaei.saba.bpms.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import ir.saeidbabaei.saba.jwtauthentication.model.User;
import ir.saeidbabaei.saba.bpms.model.TaskRef;

/**If you want to use BPM System implement this interface.
 * 
 * @author Saeid Babaei
 *
 */
public interface IBPMSProcessService {

	
    //================================================================================
    //Users, Groups and Membership region
	//================================================================================
	
	
	/**Add BMPS user.
	 * 
	 * @param user	User
	 * @return		User
	 */
	public User addBpmsUser(User user);
	
	
    /**Add BMPS groups.
     * 
     * @param groupid	Group id
     * @param groupname	Group name
     * @param grouptype Group type
     * @return			True or False
     */
    public boolean addBpmsGroup(String groupid, String groupname, String grouptype);
    
    
    /**Add BMPS user to group.
     * 	
     * @param groupid   Group name
     * @param username  User name
     * @return			True or False
     */
    public boolean addBpmsUserToGroup(String groupid, String username);
	
    
    //================================================================================
    //Process region
	//================================================================================
    
    
	/**Gets Process name and process variables. <br/>
	 * Returns Process instance id.
	 *
	 * @param  vars Variables that you should pass the process
	 * @param  name Process name
	 * @return      Process instance id
	 */
	public String startProcessByName(Map<String, Object> vars, String name);

	
	/**Get list of unfinished process by name.
	 *   
	 * @param 	name		Process key
	 * @param 	afterTime	Start date
	 * @param 	beforeTime	End date
	 * @return				List of process with process variables and count of process
	 */
	public List<Map<String, Object>> getProcessListByName(String name, Date afterTime, Date beforeTime);
	
	
	/**Get list of finished process by name.
	 *   
	 * @param 	name		Process key
	 * @param 	afterTime	Start date
	 * @param 	beforeTime	End date
	 * @return				List of process with process variables and count of process
	 */
	public List<Map<String, Object>> getHisProcessListByName(String name, Date afterTime, Date beforeTime);
	
	
	/**Get list of finished and unfinished process by name.
	 *   
	 * @param 	name		Process key
	 * @param 	afterTime	Start date
	 * @param 	beforeTime	End date
	 * @return				List of process with process variables and count of process
	 */
	public List<Map<String, Object>> getAllProcessListByName(String name, Date afterTime, Date beforeTime);
	
	
    //================================================================================
    //Task region
	//================================================================================
	
	
	/**
	 * Get active task by group. <br/>
	 * High priority tasks first and is sorted by create time. <br/>
	 * Returns list of tasks. 
	 *
	 * @param  name Candidate group name
	 * @return      List of tasks
	 */
	public List<TaskRef> getActiveTasksByGroup(String name);
	
	
    /**Get task list of assignee by group<br/>
	 * High priority tasks first and is sorted by create time. <br/>
     * 
     * @param  assignee 	User name of assignee
     * @param  groupname 	Group name
     * @return		   		List of tasks
     */
    public List<TaskRef> getActiveTasksByAssigneeAndGroup(String assignee, String groupname);
    
    
    /**Get a task by id and assignee.
     * 
     * @param taskid	Task id
     * @param assignee  User name of assignee
     * @return			Task
     */
    public TaskRef getTaskByIdAndAssignee(String taskid, String assignee);
    
    
    /**Get Process variables by task id and assignee.
     * 
     * @param taskid	Task id
     * @param assignee	Assignee
     * @return			Process variables
     */
    public Map<String, Object> getProcessVarsByTaskidAndAssignee(String taskid, String assignee);
    
    
	/**Claim task by user.
	 * 
	 * @param  taskid   Task id
	 * @param  username User name
	 * @return 			Task
	 */
	public TaskRef claimTaskByUser(String taskid, String username);
	
	
	/**Complete task by user.
	 * 
	 * @param  taskid   Task id
	 * @param  vars 	Variables that you should pass the task
	 * @return 			True if task complete successful
	 */
    public boolean completeTaskById(String taskid, Map<String, Object> vars);
    
	
}


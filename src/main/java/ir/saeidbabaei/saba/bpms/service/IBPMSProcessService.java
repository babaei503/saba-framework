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
	public User addbpmsuser(User user);
	
	
    /**Add BMPS groups.
     * 
     * @param groupid	Group id
     * @param groupname	Group name
     * @param grouptype Group type
     * @return			True or False
     */
    public boolean addbpmsgroup(String groupid, String groupname, String grouptype);
    
    
    /**Add BMPS user to group.
     * 	
     * @param groupid   Group name
     * @param username  User name
     * @return			True or False
     */
    public boolean addbpmsusertogroup(String groupid, String username);
	
    
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
	public String startprocessbyname(Map<String, Object> vars, String name);

	
	/**Get list of unfinished process by name.
	 *   
	 * @param 	name		Process key
	 * @param 	afterTime	Start date
	 * @param 	beforeTime	End date
	 * @return				List of process with process variables and count of process
	 */
	public List<Map<String, Object>> getprocesslistbyname(String name, Date afterTime, Date beforeTime);
	
	
	/**Get list of finished process by name.
	 *   
	 * @param 	name		Process key
	 * @param 	afterTime	Start date
	 * @param 	beforeTime	End date
	 * @return				List of process with process variables and count of process
	 */
	public List<Map<String, Object>> gethisprocesslistbyname(String name, Date afterTime, Date beforeTime);
	
	
	/**Get list of finished and unfinished process by name.
	 *   
	 * @param 	name		Process key
	 * @param 	afterTime	Start date
	 * @param 	beforeTime	End date
	 * @return				List of process with process variables and count of process
	 */
	public List<Map<String, Object>> getallprocesslistbyname(String name, Date afterTime, Date beforeTime);
	
	
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
	public List<TaskRef> getactivetasksbygroup(String name);
	
	
    /**Get task list of assignee by group<br/>
	 * High priority tasks first and is sorted by create time. <br/>
     * 
     * @param  assignee 	User name of assignee
     * @param  groupname 	Group name
     * @return		   		List of tasks
     */
    public List<TaskRef> getactivetasksbyassigneeandgroup(String assignee, String groupname);
    
    
    /**Get a task by id and assignee.
     * 
     * @param taskid	Task id
     * @param assignee  User name of assignee
     * @return			Task
     */
    public TaskRef gettaskbyidandassignee(String taskid, String assignee);
    
    
    /**Get Process variables by task id and assignee.
     * 
     * @param taskid	Task id
     * @param assignee	Assignee
     * @return			Process variables
     */
    public Map<String, Object> getprocessvarsbytaskidandassignee(String taskid, String assignee);
    
    
	/**Claim task by user.
	 * 
	 * @param  taskid   Task id
	 * @param  username User name
	 * @return 			Task
	 */
	public TaskRef claimtaskbyuser(String taskid, String username);
	
	
	/**Complete task by user.
	 * 
	 * @param  taskid   Task id
	 * @param  vars 	Variables that you should pass the task
	 * @return 			True if task complete successful
	 */
    public boolean completetaskbyid(String taskid, Map<String, Object> vars);
    
	
}


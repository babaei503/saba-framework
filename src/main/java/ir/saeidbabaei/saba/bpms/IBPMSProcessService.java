package ir.saeidbabaei.saba.bpms;

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
	
	
	/**Add BMPS user
	 * 
	 * @param user	User
	 * @return		User
	 */
	public User addbpmsuser(User user);
	
    /**Add BMPS user to group
     * 	
     * @param groupid   Group name
     * @param username  User name
     * @return			True or False
     */
    public boolean addbpmsusertogroup(String groupid, String username);
	
	/**
	 * Gets Process name and process variables. <br/>
	 * Returns Process instance id. 
	 *
	 * @param  vars Variables that you should pass the process
	 * @param  name Process name
	 * @return      Process instance id
	 */
	public String startprocessbyname(Map<String, Object> vars, String name);
	
	/**
	 * Get active task by group. <br/>
	 * High priority tasks first and is sorted by create time. <br/>
	 * Returns list of tasks. 
	 *
	 * @param  name Candidate group name
	 * @return      List of tasks
	 */
	public List<TaskRef> getactivetasksbygroup(String name);
	
	/**Claim task by user
	 * 
	 * @param  taskid   Task id
	 * @param  username User name
	 * @return 			Task
	 */
	public TaskRef claimtaskbyuser(String taskid, String username);
	
	/**Complete task by user
	 * 
	 * @param  taskid   Task id
	 * @param  vars 	Variables that you should pass the task
	 * @return 			Task
	 */
    public TaskRef completetaskbyid(String taskid, Map<String, Object> vars);
	
}


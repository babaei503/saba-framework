package ir.saeidbabaei.saba.bpms;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.identity.User;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ir.saeidbabaei.saba.bpms.model.TaskRef;

/**Activiti BPM System that implement IBPMSProcessService interface.
 * @see IBPMSProcessService
 * 
 * @author Saeid Babaei
 *
 */
@Service
public class BPMSProcessService implements IBPMSProcessService {

	
    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;
    
    @Autowired 
    private IdentityService identityService;
    
    
    //================================================================================
    //Users, Groups and Membership region
	//================================================================================
	
    @Override
    public ir.saeidbabaei.saba.jwtauthentication.model.User addbpmsuser(ir.saeidbabaei.saba.jwtauthentication.model.User user){
		  
	    User actuser = identityService.newUser(user.getUsername());
	    actuser.setPassword(user.getPassword());	    
	    identityService.saveUser(actuser);

        return user;

    }
    
    @Override
    public boolean addbpmsusertogroup(String groupid, String username){
		  
        if (identityService.createGroupQuery().groupId(groupid).singleResult() != null) {
        	identityService.createMembership(username, groupid);    
        	return true;
        }
        else
        	throw new EntityNotFoundException("Group");

    }
    

    //================================================================================
    //Process region
	//================================================================================
    
    @Override
    public String startprocessbyname(Map<String, Object> vars, String name) {

		ProcessInstance processInstance= runtimeService.startProcessInstanceByKey(name, vars);
		
		return processInstance.getId();

	}
    
    //================================================================================
    //Task region
	//================================================================================
    
    @Override
	public List<TaskRef> getactivetasksbygroup(String name) {
             
        List<Task> tasks = taskService.createTaskQuery()
                .taskCandidateGroup(name)
                .active()
                .orderByTaskPriority().asc()
                .orderByTaskCreateTime().asc()
                .list();
        

        List<TaskRef> customTaskList= new ArrayList<TaskRef>();
        
        tasks.forEach(taskitem -> {
        	customTaskList.add(
        			new TaskRef(taskitem.getId(),taskitem.getName(),taskitem.getAssignee(),taskitem.getCategory(),
        						taskitem.getClaimTime(),taskitem.getCreateTime(),taskitem.getDescription(),
        						taskitem.getDueDate(),taskitem.getPriority(),taskitem.getProcessDefinitionId()));
        });
        
        return customTaskList;     	

	}
    
    @Override
    public TaskRef claimtaskbyuser(String taskid, String username) {

		taskService.claim(taskid, username);
		
		Task taskitem = taskService.createTaskQuery()
				.taskId(taskid)
				.singleResult();
     
        return new TaskRef(taskitem.getId(),taskitem.getName(),taskitem.getAssignee(),taskitem.getCategory(),
        				   taskitem.getClaimTime(),taskitem.getCreateTime(),taskitem.getDescription(),
        				   taskitem.getDueDate(),taskitem.getPriority(),taskitem.getProcessDefinitionId());	

	}
	

    @Override
    public TaskRef completetaskbyid(String taskid, Map<String, Object> vars) {

		taskService.complete(taskid,vars);
		
		Task taskitem = taskService.createTaskQuery()
				.taskId(taskid).singleResult();
     
        return new TaskRef(taskitem.getId(),taskitem.getName(),taskitem.getAssignee(),taskitem.getCategory(),
				   taskitem.getClaimTime(),taskitem.getCreateTime(),taskitem.getDescription(),
				   taskitem.getDueDate(),taskitem.getPriority(),taskitem.getProcessDefinitionId());	

	}
	
}

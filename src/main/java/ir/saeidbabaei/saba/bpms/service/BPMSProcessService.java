package ir.saeidbabaei.saba.bpms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;

import org.activiti.engine.IdentityService;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ir.saeidbabaei.saba.bpms.ActivitiProperties;
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
    
    @Autowired
    private SpringProcessEngineConfiguration springprocessengineconfiguration;
    
    @Autowired
    private ActivitiProperties activitiproperties;
    
   
    
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
    public boolean addbpmsgroup(String groupid, String groupname, String grouptype) {
		  
        Group group = identityService.newGroup(groupid);
        group.setName(groupname);
        group.setType(grouptype);
        identityService.saveGroup(group);

        return true;

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
    public List<TaskRef> getactivetasksbyassigneeandgroup(String assignee, String groupname) { 
    	
    	//There is no way in activiti 6 that you can get tasks with assignee and group name
    	//When assignee claim a task, activiti delete the group of task
    	//I will create a native query to handle the issue later
		List<Task> tasks = taskService.createTaskQuery()
				.taskAssignee(assignee)
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
    public TaskRef gettaskbyidandassignee(String taskid, String assignee) {
	
		Task taskitem = taskService.createTaskQuery()
				.taskAssignee(assignee)
				.taskId(taskid)
				.singleResult();
     
        return new TaskRef(taskitem.getId(),taskitem.getName(),taskitem.getAssignee(),taskitem.getCategory(),
        				   taskitem.getClaimTime(),taskitem.getCreateTime(),taskitem.getDescription(),
        				   taskitem.getDueDate(),taskitem.getPriority(),taskitem.getProcessDefinitionId());	

	}
    
    @Override
    public Map<String, Object> getprocessvarsbytaskidandassignee(String taskid, String assignee) {
	
    	Map<String, Object> processvars = taskService.createTaskQuery()
				.taskAssignee(assignee)
				.taskId(taskid)
				.includeProcessVariables()
				.singleResult().getProcessVariables();
     
        return processvars;	

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
    public boolean completetaskbyid(String taskid, Map<String, Object> vars) {
    	
    	initmailserver();
    	
		taskService.complete(taskid,vars);
     
        return true;

	}
    
    
    //================================================================================
    //Configuration region
	//================================================================================
    
    
    private void initmailserver()
    {
    	springprocessengineconfiguration.setMailServerHost(activitiproperties.getMailServerHost());
    	springprocessengineconfiguration.setMailServerPort(activitiproperties.getMailServerPort());
    	springprocessengineconfiguration.setMailServerUsername(activitiproperties.getMailServerUserName());
    	springprocessengineconfiguration.setMailServerPassword(activitiproperties.getMailServerPassword());
    	springprocessengineconfiguration.setMailServerDefaultFrom(activitiproperties.getMailServerDefaultFrom());
    	springprocessengineconfiguration.setMailServerUseSSL(activitiproperties.isMailServerUseSsl());
    	springprocessengineconfiguration.setMailServerUseTLS(activitiproperties.isMailServerUseTls());
    	
    }
	
}

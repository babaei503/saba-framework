package ir.saeidbabaei.saba.bpms;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//If you want to use a BPM System except activiti just update this service class
@Service
public class BPMSProcessService {

	
    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;
    
    @Autowired 
    private IdentityService identityService;
	
    //************Add bpms Groups	
    public Group addbpmsgroup(String id, String name) {
		  
        Group group = identityService.newGroup(id);
        group.setName(name);
        group.setType("security-role");
        identityService.saveGroup(group);

        return group;

    }
	
    //************Add bpms Users	
    public User addbpmsuser(ir.saeidbabaei.saba.jwtauthentication.model.User user){
		  
	    User actuser = identityService.newUser(user.getUsername());
	    actuser.setPassword(user.getPassword());	    
	    identityService.saveUser(actuser);

        return actuser;

    }
    
    //************Add bpms User to Group	
    public User addbpmsusertogroup(String groupid, String username){
		  
        if (identityService.createGroupQuery().groupId(groupid).singleResult() != null) {
        	identityService.createMembership(username, groupid);
        }

        return identityService.createUserQuery().userId(username).singleResult();

    }
    
    //************get bpms Group	
    public Group getbpmsgroupbyid(String groupid) {
		  
        return identityService.createGroupQuery().groupId(groupid).singleResult();

    }   
    
    //************get bpms user	
    public User getbpmsuserbyusername(String username){
		  
        return identityService.createUserQuery().userId(username).singleResult();

    }   
 
    
    public List<Task> getalltasks(String name) {
	
		List<ProcessInstance> processInstances = runtimeService.createProcessInstanceQuery().processDefinitionKey(name).list();
		
		List<Task> tasks = new ArrayList<Task>();
		  
		for (int i=0;i<processInstances.size();i++)
		{

		  List<Task> ptask= taskService.createTaskQuery()
                .processInstanceId(processInstances.get(i).getProcessInstanceId())
                .orderByProcessInstanceId().asc()
                .list();
		  
			for (int j=0;j<ptask.size();j++)				  
			  tasks.add(ptask.get(j));
				
		}
       return tasks;

	}
	

    public List<Task> getactivetasks(String name) {
	
		List<ProcessInstance> processInstances = runtimeService.createProcessInstanceQuery().processDefinitionKey(name).active().list();
		
		List<Task> tasks = new ArrayList<Task>();
		  
		for (int i=0;i<processInstances.size();i++)
		{

			  List<Task> ptask= taskService.createTaskQuery()
		                .processInstanceId(processInstances.get(i).getProcessInstanceId())
		                .orderByProcessInstanceId().asc()
		                .list();
				  
					for (int j=0;j<ptask.size();j++)				  
					  tasks.add(ptask.get(j));
		
		}
       return tasks;

	}
	

    public List<Task> getactivetasksbygroup(String name) {

       
        List<Task> tasks = taskService.createTaskQuery()
                .taskCandidateGroup(name)
                .active()
                .orderByTaskName().asc()
                .list();
        
        return tasks;	

	}
	

    public List<Task> getactivetasksbyassignee(String assignee) {

		List<Task> tasks = taskService.createTaskQuery()
				.taskCandidateUser(assignee)
				.active()
                .orderByTaskName().asc()
				.list();
        
        return tasks;	

	}
	

    public Task claimtaskbyuser(Task task, String name) {

		taskService.claim(task.getId(), name);
		
		Task taskres = taskService.createTaskQuery()
				.taskId(task.getId()).singleResult();
     
        return taskres;	

	}

	
    public Task completetask(Map<String, Object> vars, String taskid) {

		taskService.complete(taskid,vars);
		
		Task taskres = taskService.createTaskQuery()
				.taskId(taskid).singleResult();
     
        return taskres;	

	}


    public ProcessInstance startprocessbyname(Map<String, Object> vars, String name) {

		ProcessInstance processInstance= runtimeService.startProcessInstanceByKey(name, vars);
     
        return processInstance;	

	}
	
}

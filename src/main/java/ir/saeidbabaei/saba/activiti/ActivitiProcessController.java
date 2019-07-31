package ir.saeidbabaei.saba.activiti;

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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/activiti")
public class ActivitiProcessController {

	
    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;
    
    @Autowired 
    private IdentityService identityService;
	
    //************Add Activiti Groups	
	@PreAuthorize("hasRole('ADMIN')")
    @GetMapping(value = "/add-activiti-group/{id}/{name}")
    public Group addactivitigroup(@PathVariable String id, @PathVariable String name) throws Exception {
		  
        Group group = identityService.newGroup(id);
        group.setName(name);
        group.setType("security-role");
        identityService.saveGroup(group);

        return group;

    }
	
    //************Add Activiti Users	
	@PreAuthorize("hasRole('ADMIN')")
    @RequestMapping(value = "/add-activiti-user", method = RequestMethod.POST)
    public User addactivitiuser(@RequestBody ir.saeidbabaei.saba.jwtauthentication.model.User user) throws Exception {
		  
	    User actuser = identityService.newUser(user.getUsername());
	    actuser.setPassword(user.getPassword());	    
	    identityService.saveUser(actuser);

        return actuser;

    }
    
    //************Add Activiti User to Group	
	@PreAuthorize("hasRole('ADMIN')")
    @GetMapping(value = "/add-activiti-user-to-group/{groupid}/{username}")
    public User addactivitiusertogroup(@PathVariable String groupid, @PathVariable String username) throws Exception {
		  
        if (identityService.createGroupQuery().groupId(groupid).singleResult() != null) {
        	identityService.createMembership(username, groupid);
        }

        return identityService.createUserQuery().userId(username).singleResult();

    }
    
    //************get Activiti Group	
	@PreAuthorize("hasRole('ADMIN')")
    @GetMapping(value = "/get-activiti-group-by-id/{id}")
    public Group getactivitigroupbyid(@PathVariable String groupid) throws Exception {
		  
        return identityService.createGroupQuery().groupId(groupid).singleResult();

    }   
    
    //************get Activiti user	
	@PreAuthorize("hasRole('ADMIN')")
    @GetMapping(value = "/get-activiti-user-by-username/{id}")
    public User getactivitiuserbyusername(@PathVariable String username) throws Exception {
		  
        return identityService.createUserQuery().userId(username).singleResult();

    }   
    
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/get-all-tasks-by-process-name/{name}")
    public List<Task> getalltasks(@PathVariable String name) {
	
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
	
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/get-active-tasks-by-process-name/{name}")
    public List<Task> getactivetasks(@PathVariable String name) {
	
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
	
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/get-active-tasks-by-group/{name}")
    public List<Task> getactivetasksbygroup(@PathVariable String name) {

       
        List<Task> tasks = taskService.createTaskQuery()
                .taskCandidateGroup(name)
                .active()
                .orderByTaskName().asc()
                .list();
        
        return tasks;	

	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/get-active-tasks-by-assignee/{name}")
    public List<Task> getactivetasksbyassignee(@PathVariable String assignee) {

		List<Task> tasks = taskService.createTaskQuery()
				.taskCandidateUser(assignee)
				.active()
                .orderByTaskName().asc()
				.list();
        
        return tasks;	

	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping(value = "/claim-task-by-user/{name}", method = RequestMethod.POST)
    public Task claimtaskbyuser(@RequestBody Task task,@PathVariable String name) {

		taskService.claim(task.getId(), name);
		
		Task taskres = taskService.createTaskQuery()
				.taskId(task.getId()).singleResult();
     
        return taskres;	

	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping(value = "/complete-task-by-id/{taskid}", method = RequestMethod.POST)
    public Task completetask(@RequestBody Map<String, Object> vars,@PathVariable String taskid) {

		taskService.complete(taskid,vars);
		
		Task taskres = taskService.createTaskQuery()
				.taskId(taskid).singleResult();
     
        return taskres;	

	}

	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping(value = "/start-process-by-name/{name}", method = RequestMethod.POST)
    public ProcessInstance startprocessbyname(@RequestBody Map<String, Object> vars,@PathVariable String name) {

		ProcessInstance processInstance= runtimeService.startProcessInstanceByKey(name, vars);
     
        return processInstance;	

	}
	
}

package ir.saeidbabaei.saba.applicanthireprocess.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicanthireinfo;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import ir.saeidbabaei.saba.applicanthireprocess.service.IApplicantService;
import ir.saeidbabaei.saba.applicanthireprocess.service.IApplicanthireinfoService;
import ir.saeidbabaei.saba.applicanthireprocess.service.IJobService;
import ir.saeidbabaei.saba.bpms.service.IBPMSProcessService;
import ir.saeidbabaei.saba.bpms.model.TaskRef;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

/**
 * 
 * @author Saeid Babaei
 *
 */
@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api")
public class ApplicantHireProcessController {
    

    @Autowired
    private IApplicantService applicantservice;
    
    @Autowired
    private IJobService jobservice;
    
    @Autowired
    private IBPMSProcessService bpmsprocessservice;
    
    @Autowired
    private IApplicanthireinfoService applicanthireinfoservice;
    

    //================================================================================
	//Applicant Rest API Section
    //================================================================================
    
    /**Saving applicant and start applicant hire process.
     * 
     * @param  applicant Applicant information.
     * @return 			 Response 200 OK. Applicant info.
     */
    @ResponseStatus(value = HttpStatus.OK)
	@Transactional
    @RequestMapping(value = "/start-applicant-hire-process", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<Applicant> startApplicantHireProcess(@RequestBody Applicant applicant) {
    	
    	//Save applicant info
        applicantservice.save(applicant);

        //Start hire process of applicant
        Map<String, Object> vars = Collections.<String, Object>singletonMap("applicant", applicant);
        bpmsprocessservice.startProcessByName(vars, "hireProcessWithJpa");
	          
        return ResponseEntity.ok(applicant);
    }
       
    /**Get list of all applicant.
     * 
     * @return Response 200 OK. List of applicant.
     */
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping(value = "/get-applicant-list", method = RequestMethod.GET)
	public ResponseEntity<List<Applicant>> getApplicantList() {
	      
		  return ResponseEntity.ok(applicantservice.findAll());
	}
	  
	/**Retrieve applicant by id.
	 * 
	 * @param id Applicant id.
     * @return   Response 200 OK. Applicant info.
	 */
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/applicant/edit/{id}")
	public ResponseEntity<Applicant> retrieveApplicant(@PathVariable long id) {
		
			Optional<Applicant> applicant = applicantservice.findById(id);

			if (!applicant.isPresent())
				throw new EntityNotFoundException("Applicant");

	        return ResponseEntity.ok(applicant.get());
	}

	/**Update applicant by id.
	 * 
	 * @param applicant Applicant update info.
	 * @param id        Applicant id that should be updated. 
	 * @return			Response 200 OK. applicant info.
	 */
	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("/applicant/update/{id}")
	public ResponseEntity<Applicant> updateApplicant(@RequestBody Applicant applicant, @PathVariable long id) {

		Optional<Applicant> applicantOptional = applicantservice.findById(id);

		if (!applicantOptional.isPresent())
			throw new EntityNotFoundException("Applicant");

		applicant.setId(id);
		
		applicantservice.save(applicant);
		
		return ResponseEntity.ok(applicant);
	}
	
	/**Delete applicant by id.
	 * 
	 * @param  id Applicant id that should be deleted.
	 * @return 	  Response 202 Accepted.
	 * @throw  	  EntityNotFoundException.
	 */
	@PreAuthorize("hasRole('ADMIN')")
	@DeleteMapping("/applicant/delete/{id}")
	public ResponseEntity<Applicant> deleteApplicant(@PathVariable long id) {
		
		Optional<Applicant> applicantOptional = applicantservice.findById(id);
		
		if (!applicantOptional.isPresent())
			throw new EntityNotFoundException("Applicant");
		
		applicantservice.deleteById(id);
		
		return ResponseEntity.accepted().build();
		
	}
	

	//================================================================================
	//Job Rest API Section
	//================================================================================

	
	/**Get list of all job with pagination.
	 * 
	 * @param page 		The page number that should be get. start from 0.
	 * @param itemcount Number of item in page.
	 * @return 			Response 200 OK. List of jobs.
	 */
	@RequestMapping(value = "/get-job-list/{page}/{itemcount}", method = RequestMethod.GET)
	public ResponseEntity<Page<Job>> getJobList(@PathVariable int page, @PathVariable int itemcount) {
	      
		  return ResponseEntity.ok(jobservice.findAll(page,itemcount));
	}
	
	
	/**Get list of open job by location and title.
	 * 
	 * @param  location  Job location should be searched.
	 * @param  title     Job title should be searched.
	 * @param  page      The page number that should be get. start from 0.
	 * @param  itemcount Number of item in page.
	 * @return           Response 200 OK. List of jobs.
	 */
	@RequestMapping(value = "/get-open-job-list-by-location-title/{location}/{title}/{page}/{itemcount}", method = RequestMethod.GET)
	public ResponseEntity<Page<Job>> getOpenJobListByLocationAndTitle(@PathVariable String location,@PathVariable String title, @PathVariable int page, @PathVariable int itemcount) {
	      
		if (location.equals("all") && title.equals("all"))
			 return ResponseEntity.ok(jobservice.findByOpen(true,page,itemcount));
		else if (!location.equals("all") && !title.equals("all"))
			 return ResponseEntity.ok(jobservice.findByLocationAndTitleAndOpen(location,title,true,page,itemcount));
		else if (!location.equals("all") && title.equals("all"))
			 return ResponseEntity.ok(jobservice.findByLocationAndOpen(location,true,page,itemcount));
		else
			 return ResponseEntity.ok(jobservice.findByTitleAndOpen(title,true,page,itemcount));
	}
	
	/**Get job by id
	 * 
	 * @param   jobid Job id.
	 * @return 		  Response 200 OK. Job info.
	 */
	@RequestMapping(value = "/get-job-by-id/{jobid}", method = RequestMethod.GET)
	public ResponseEntity<Optional<Job>> getJobById(@PathVariable long jobid) {
	      
		  return ResponseEntity.ok(jobservice.findById(jobid));
	}	
	
	
    //================================================================================
	//Applicant hire info Rest API Section
    //================================================================================
	
	
	
	/**Get applicant hire info by id
	 * 
	 * @param   appid Applicant hire info id.
	 * @return 		  Response 200 OK. Applicant hire info.
	 */
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping(value = "/get-apphireinfo-by-id/{applicantid}", method = RequestMethod.GET)
	public ResponseEntity<Applicanthireinfo> getApphireinfoById(@PathVariable long applicantid) {
		
		  Optional<Applicant> applicant = applicantservice.findById(applicantid);
		   
		  if (!applicant.isPresent())
				throw new EntityNotFoundException("Applicant");
		  else
			    return ResponseEntity.ok(applicanthireinfoservice.findApplicanthireinfoByApplicant(applicant.get()));
		  
	}	
	
	
	//================================================================================
	//Call BPMS Rest API for hiring tasks
	//================================================================================

	
	/**Get active phone interview tasks.
	 * 
	 * @return List of tasks.
	 */
	@PreAuthorize("hasRole('TELEPHONE')")
	@GetMapping("/get-active-phoneinterview-tasks")
    public List<TaskRef> getActivePhoneinterviewTasks() {
				       
		return bpmsprocessservice.getActiveTasksByGroup("TELEPHONE");
		
	}
	
	/**Get active phone interview tasks by assignee.
	 * 
	 * @return 	List of tasks.
	 */
	@PreAuthorize("hasRole('TELEPHONE')")
	@GetMapping("/get-active-phoneinterviewtasks-assignee")
    public List<TaskRef> getActivePhnintTasksByAssignee() {
				       
		return bpmsprocessservice.getActiveTasksByAssigneeAndGroup(getUserName(), "TELEPHONE");
		
	}	
	
	/**Get active technical interview tasks.
	 * 
	 * @return List of tasks.
	 */
	@PreAuthorize("hasRole('TECH')")
	@GetMapping("/get-active-techinterview-tasks")
    public List<TaskRef> getActiveTechinterviewTasks() {
				       
		return bpmsprocessservice.getActiveTasksByGroup("TECH");
		
	}
	
	/**Get active technical interview tasks by assignee.
	 * 
	 * @return 	List of tasks.
	 */
	@PreAuthorize("hasRole('TECH')")
	@GetMapping("/get-active-techinterviewtasks-assignee")
    public List<TaskRef> getActiveTechintTasksByAssignee() {
				       
		return bpmsprocessservice.getActiveTasksByAssigneeAndGroup(getUserName(), "TECH");
		
	}	
	
	/**Get active financial negotiation tasks.
	 * 
	 * @return List of tasks.
	 */
	@PreAuthorize("hasRole('FINANCE')")
	@GetMapping("/get-active-financenegotiation-tasks")
    public List<TaskRef> getActiveFinancnegotTasks() {
				       
		return bpmsprocessservice.getActiveTasksByGroup("FINANCE");
		
	}
	
	/**Get active financial negotiation tasks by assignee.
	 * 
	 * @return 	List of tasks.
	 */
	@PreAuthorize("hasRole('FINANCE')")
	@GetMapping("/get-active-financenegottasks-assignee")
    public List<TaskRef> getActiveFinancnegotTasksByAssignee() {
				       
		return bpmsprocessservice.getActiveTasksByAssigneeAndGroup(getUserName(), "FINANCE");
		
	}
	
	/**Get phone interview task by id and assignee.
	 * 
	 * @param 	taskid	Task id
	 * @return			Task
	 */
	@PreAuthorize("hasRole('TELEPHONE') or hasRole('TECH') or hasRole('FINANCE')")
	@GetMapping("/get-task-by-id-assignee/{taskid}")
    public TaskRef getTaskByIdAndAssignee(@PathVariable String taskid) {
				       
		return bpmsprocessservice.getTaskByIdAndAssignee(taskid, getUserName());
		
	}	
	
    /**Get Process variables by task id and assignee.
     * 
     * @param taskid	Task id
     * @return			Process variables
     */
	@PreAuthorize("hasRole('TELEPHONE') or hasRole('TECH') or hasRole('FINANCE')")
	@GetMapping("/get-hireprocvars-by-taskid-assignee/{taskid}")
    public Map<String, Object> getProcessVarsByTaskidAndAssignee(@PathVariable String taskid){
    	
		return bpmsprocessservice.getProcessVarsByTaskidAndAssignee(taskid, getUserName());
		
    }
	
	/**Get list of unfinished process by name.
	 *   
	 * @param 	name				Process key
	 * @param 	jsearchcondition	JSON string including fromdate and todate	
	 * @return						List of process with process variables and count of process
	 * @throws 	ParseException 		Date format is incorrect.
	 */
	@PreAuthorize("hasRole('ADMIN')")
    @RequestMapping(value = "/gethireprocesslist", method = RequestMethod.POST,
    produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<Map<String, Object>> getProcessListbyName(@RequestBody String jsearchcondition) throws ParseException {
		
		JSONObject searchcondition = new JSONObject(jsearchcondition);
		
		Date afterTime = new SimpleDateFormat("dd-MM-yyyy").parse(searchcondition.get("fromdate").toString());
		Date beforeTime = new SimpleDateFormat("dd-MM-yyyy").parse(searchcondition.get("todate").toString());	
    	
        return bpmsprocessservice.getProcessListByName("hireProcessWithJpa", afterTime, beforeTime);
	          
    }
	
	
	/**Get list of finished process by name.
	 *   
	 * @param 	name				Process key
	 * @param 	jsearchcondition	JSON string including fromdate and todate	
	 * @return						List of process with process variables and count of process
	 * @throws 	ParseException		Date format is incorrect. 
	 */
	@PreAuthorize("hasRole('ADMIN')")	
    @RequestMapping(value = "/gethishireprocesslist", method = RequestMethod.POST,
    produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<Map<String, Object>> getHisProcessListByName(@RequestBody String jsearchcondition) throws ParseException {
		
		JSONObject searchcondition = new JSONObject(jsearchcondition);
		
		Date afterTime = new SimpleDateFormat("dd-MM-yyyy").parse(searchcondition.get("fromdate").toString());
		Date beforeTime = new SimpleDateFormat("dd-MM-yyyy").parse(searchcondition.get("todate").toString());
		   	
        return bpmsprocessservice.getHisProcessListByName("hireProcessWithJpa", afterTime, beforeTime);
	          
    }
	
	
	/**Get list of finished and unfinished process by name.
	 *   
	 * @param 	name				Process key
	 * @param 	jsearchcondition	JSON string including fromdate and todate			
	 * @return						List of process with process variables and count of process
	 * @throws 	ParseException		Date format is incorrect. 
	 */
	@PreAuthorize("hasRole('ADMIN')")	
    @RequestMapping(value = "/getallhireprocesslist", method = RequestMethod.POST,
    produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<Map<String, Object>> getAllProcessListByName(@RequestBody String jsearchcondition) throws ParseException {
								
		JSONObject searchcondition = new JSONObject(jsearchcondition);
		
		Date afterTime = new SimpleDateFormat("dd-MM-yyyy").parse(searchcondition.get("fromdate").toString());
		Date beforeTime = new SimpleDateFormat("dd-MM-yyyy").parse(searchcondition.get("todate").toString());		
    			
        return bpmsprocessservice.getAllProcessListByName("hireProcessWithJpa", afterTime, beforeTime);
	          
    }
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//Claim task 
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	/**Claim phone interview task by user.
	 * 
	 * @param   taskid   Task id.
	 * @return           Task.
	 */
	@PreAuthorize("hasRole('TELEPHONE')")
	@GetMapping("/claim-phoneinterview-task/{taskid}")
    public TaskRef claimPhoneinterviewTask(@PathVariable String taskid) {
				       
		return  bpmsprocessservice.claimTaskByUser(taskid, getUserName());
		
	}
	
	/**Claim technical interview task by user.
	 * 
	 * @param   taskid   Task id.
	 * @return           Task.
	 */
	@PreAuthorize("hasRole('TECH')")
	@GetMapping("/claim-techinterview-task/{taskid}")
    public TaskRef claimTechinterviewTask(@PathVariable String taskid) {
				       
		return  bpmsprocessservice.claimTaskByUser(taskid, getUserName());     
		
	}
	
	/**Claim Financial negotiation task by user.
	 * 
	 * @param   taskid   Task id.
	 * @return           Task.
	 */
	@PreAuthorize("hasRole('FINANCE')")
	@GetMapping("/claim-financenegotiation-task/{taskid}")
    public TaskRef claimFinancenegotiationTask(@PathVariable String taskid) {
				       
		return  bpmsprocessservice.claimTaskByUser(taskid, getUserName());     
		
	}
	
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//Complete task 
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	/**Complete phone interview task by task id.<br/>
	 * Completing the phone interview with success should trigger two new tasks.
	 * 
	 * @param  id 					Task id.
	 * @param  applicanthireinfo	Applicant hire info.
	 * @return 	  					Task.
	 */
	@PreAuthorize("hasRole('TELEPHONE')")
	@Transactional
    @ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "/complete-phoneinterview-task/{taskid}", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean compleTephoneinterviewTaskByTaskid(@RequestBody Applicanthireinfo applicanthireinfo, @PathVariable String taskid) {
		
    	//Save applicant hire info
        applicanthireinfoservice.save(applicanthireinfo);
        
        Map<String, Object> taskVariables = new HashMap<String, Object>();
        taskVariables.put("telephoneInterviewOutcome", applicanthireinfo.getTelintviwres());
        
        return bpmsprocessservice.completeTaskById(taskid, taskVariables);        
		
	}	
	
	/**Complete technical interview task by task id.
	 * 
	 * @param  id 					Task id.
	 * @param  applicanthireinfo	Applicant hire info.
	 * @return 	  					Task.
	 */
	@PreAuthorize("hasRole('TECH')")
	@Transactional
    @ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "/complete-techinterview-task/{taskid}", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean completeTechinterviewTaskByTaskid(@RequestBody Applicanthireinfo applicanthireinfo, @PathVariable String taskid) {
		
		//Find applicant hire info
		Applicanthireinfo aphinfo = applicanthireinfoservice.findApplicanthireinfoByApplicant(applicanthireinfo.getApplicant());
		
		//Update technical info
		aphinfo.setTechintviwres(applicanthireinfo.getTechintviwres());
		aphinfo.setTechintviwdesc(applicanthireinfo.getTechintviwdesc());
		
    	//Save applicant hire info
        applicanthireinfoservice.save(aphinfo);
        
        //Set task variables	
        Map<String, Object> taskVariables = new HashMap<String, Object>();
        taskVariables.put("techOk", applicanthireinfo.getTechintviwres());
        
        //Complete task
        return bpmsprocessservice.completeTaskById(taskid, taskVariables);
	       		
	}	

	/**Complete financial negotiation task by task id.
	 * 
	 * @param  id 					Task id.
	 * @param  applicanthireinfo	Applicant hire info.
	 * @return 	  					Task.
	 */
	@PreAuthorize("hasRole('FINANCE')")
	@Transactional
    @ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "/complete-financenegotiation-task/{taskid}", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean completeFinancialnegotiationTaskByTaskid(@RequestBody Applicanthireinfo applicanthireinfo, @PathVariable String taskid) {
		
		//Find applicant hire info
		Applicanthireinfo aphinfo = applicanthireinfoservice.findApplicanthireinfoByApplicant(applicanthireinfo.getApplicant());
		
		//Update finance info
		aphinfo.setFinnegotres(applicanthireinfo.getFinnegotres());
		aphinfo.setFinnegotdesc(applicanthireinfo.getFinnegotdesc());
		
    	//Save applicant hire info
        applicanthireinfoservice.save(aphinfo);
        
        //Set task variables
        Map<String, Object> taskVariables = new HashMap<String, Object>();
        taskVariables.put("financialOk", applicanthireinfo.getFinnegotres());
        
        //Complete task
        return bpmsprocessservice.completeTaskById(taskid, taskVariables);
	        		
	}
	
	

	
	//================================================================================
	//Others
	//================================================================================
	
	
	/**Get authenticated user name
	 * 
	 * @return Signed in user name
	 */
	private String getUserName()
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		return ((UserDetails)principal).getUsername();

	}

}
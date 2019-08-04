package ir.saeidbabaei.saba.applicanthireprocess.controller;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import ir.saeidbabaei.saba.applicanthireprocess.service.IApplicantService;
import ir.saeidbabaei.saba.applicanthireprocess.service.JobService;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api")
public class ApplicantHireProcessController {

    @Autowired
    private RuntimeService runtimeService;
    
    @Autowired
    private TaskService taskService;

    @Autowired
    private IApplicantService applicantservice;
    
    @Autowired
    private JobService jobservice;

	//***************************
	//***************************
	//Applicant Rest API Section
	//***************************
	//***************************
    
    //Start applicant hire process after saving applicant 
    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping(value = "/start-applicant-hire-process", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<Applicant> startApplicantHireProcess(@RequestBody Applicant applicant) {

        applicantservice.save(applicant);

        Map<String, Object> vars = Collections.<String, Object>singletonMap("applicant", applicant);
        runtimeService.startProcessInstanceByKey("hireProcessWithJpa", vars);
        
        return ResponseEntity.ok(applicant);
    }
       
    //Get list of all applicant
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping(value = "/get-applicant-list", method = RequestMethod.GET)
	public ResponseEntity<List<Applicant>> getapplicantlist() {
	      
		  return ResponseEntity.ok(applicantservice.findAll());
	}
	  
	//Retrieve applicant by id
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/applicant/edit/{id}")
	public ResponseEntity<Applicant> retrieveApplicant(@PathVariable long id) {
			Optional<Applicant> applicant = applicantservice.findById(id);

			if (!applicant.isPresent())
				throw new EntityNotFoundException("Applicant");

	        return ResponseEntity.ok(applicant.get());
	}

	//Update applicant by id
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
	
	//Delete applicant by id
	@PreAuthorize("hasRole('ADMIN')")
	@DeleteMapping("/applicant/delete/{id}")
	public ResponseEntity<Applicant> deleteApplicant(@PathVariable long id) {
		
		Optional<Applicant> applicantOptional = applicantservice.findById(id);
		
		if (!applicantOptional.isPresent())
			throw new EntityNotFoundException("Applicant");
		
		applicantservice.deleteById(id);
		
		return ResponseEntity.accepted().build();
		
	}
	
	//*******************************
	//*******************************
	//Job Rest API Section
	//*******************************
	//*******************************
	
	//Get list of all job
	@RequestMapping(value = "/get-job-list", method = RequestMethod.GET)
	public ResponseEntity<List<Job>> getjoblist() {
	      
		  return ResponseEntity.ok(jobservice.findAll());
	}
	
	
	//Get list of open job by location and title-- page number and count of item
	@RequestMapping(value = "/get-open-job-list-by-location-title/{location}/{title}/{page}/{itemcount}", method = RequestMethod.GET)
	public ResponseEntity<Page<Job>> getopenjoblistbylocationAndTitle1(@PathVariable String location,@PathVariable String title, @PathVariable int page, @PathVariable int itemcount) {
	      
		if (location.equals("all") && title.equals("all"))
			 return ResponseEntity.ok(jobservice.findByOpen(true,page,itemcount));
		else if (!location.equals("all") && !title.equals("all"))
			 return ResponseEntity.ok(jobservice.findByLocationAndTitleAndOpen(location,title,true,page,itemcount));
		else if (!location.equals("all") && title.equals("all"))
			 return ResponseEntity.ok(jobservice.findByLocationAndOpen(location,true,page,itemcount));
		else
			 return ResponseEntity.ok(jobservice.findByTitleAndOpen(title,true,page,itemcount));
	}
	
	
	//*****************************************
	//*****************************************
	//Call Activiti Rest API for hiring tasks
	//*****************************************
	//*****************************************
	
	//Complete phone interview task by task id
	//Send task variable (telephoneInterviewOutcome=true) to Activiti for complete task
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/complete-phoneinterview-task/{id}")
    public String completephoneinterviewtaskbytaskid(@PathVariable String id) {
				       
	        // Completing the phone interview with success should trigger two new tasks
	        Map<String, Object> taskVariables = new HashMap<String, Object>();
	        taskVariables.put("telephoneInterviewOutcome", true);
	        taskService.complete(id, taskVariables);
	
	        return "phoneinterview Complete";	        
		
	}	
	
	//Complete tech interview task by taskid
	//Send task variable (techOk=true) to Activiti for complete task
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/complete-techinterview-task/{id}")
    public String completetechinterviewtaskbytaskid(@PathVariable String id) {
				       
	        Map<String, Object> taskVariables = new HashMap<String, Object>();
	        taskVariables.put("techOk", true);
	        taskService.complete(id, taskVariables);
	
	        return "techinterview Complete";
	       		
	}	
	
	//Complete financial task by taskid
	//Send task variable (financialOk=true) to Activiti for complete task
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/complete-financialnegotiation-task/{id}")
    public String completefinancialnegotiationtaskbytaskid(@PathVariable String id) {
				       
	        Map<String, Object> taskVariables = new HashMap<String, Object>();
	        taskVariables.put("financialOk", true);
	        taskService.complete(id, taskVariables);
	
	        return "financialnegotiation Complete";
	        		
	}

}
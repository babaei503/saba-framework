package ir.saeidbabaei.saba.applicanthireprocess.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import ir.saeidbabaei.saba.applicanthireprocess.repositories.ApplicantRepository;
import ir.saeidbabaei.saba.applicanthireprocess.repositories.JobRepository;


@RunWith(SpringRunner.class)
@ActiveProfiles("test")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@WithMockUser(username="admin",roles={"ADMIN"})
public class ApplicantHireProcessControllerTest {

  @Autowired
  ApplicantRepository applicantRepository;
  
  @Autowired
  JobRepository jobRepository;
  
  @Autowired
  private MockMvc mvc;
  
  @Before
  public void setup() throws Exception {
    
    applicantRepository.deleteAll();
    jobRepository.deleteAll();
    Job j1 = new Job("code1","title1","company1","location1","employment1","jobfunction1","industry1","description1",true);
    jobRepository.save(j1);
    applicantRepository.save(new Applicant("test1001@gmail.com","test1","09131111111",j1));
    
  }
  
  @Test
  @WithAnonymousUser
  public void startApplicantHireProcessTest() throws Exception {
	  
	  ObjectMapper mapper = new ObjectMapper();
	  
	  Job j1 = jobRepository.findAll().iterator().next();
	  
	  String jsonString = mapper.writeValueAsString(new Applicant("test1002@gmail.com","test2","09132222222",j1));
	  
	  mvc.perform( MockMvcRequestBuilders
		      .post("/api/start-applicant-hire-process")
		      .content(jsonString)
		      .contentType(MediaType.APPLICATION_JSON_UTF8)
		      .accept(MediaType.APPLICATION_JSON_UTF8))
		      .andExpect(status().isOk())
		      .andExpect(MockMvcResultMatchers.jsonPath("$.id").exists());
   
  }

  @Test
  public void GetApplicantListTest() throws Exception {

    mvc.perform(MockMvcRequestBuilders
    	      .get("/api/get-applicant-list")
    	      .accept(MediaType.APPLICATION_JSON_UTF8))
    	      .andDo(print())
    	      .andExpect(status().isOk())
    	      .andExpect(MockMvcResultMatchers.jsonPath("$").exists())
    	      .andExpect(MockMvcResultMatchers.jsonPath("$[*].id").isNotEmpty());

  }
  
  @Test
  public void RetrieveApplicantTest() throws Exception {

	  Applicant applicant = applicantRepository.findAll().iterator().next();
	  
	  mvc.perform( MockMvcRequestBuilders
		      .get("/api/applicant/edit/{id}", applicant.getId())
		      .accept(MediaType.APPLICATION_JSON_UTF8))
		      .andDo(print())
		      .andExpect(status().isOk())
		      .andExpect(MockMvcResultMatchers.jsonPath("$.id").value(1));

  }
  
  @Test
  public void GetApplicantByNullTest() throws Exception {

	  mvc.perform( MockMvcRequestBuilders
		      .get("/api/applicant/edit/{id}", 0)
		      .accept(MediaType.APPLICATION_JSON_UTF8))
		      .andDo(print())
		      .andExpect(status().isNotFound());
  }
  
  @Test
  public void UpdateApplicantTest() throws Exception {

	  ObjectMapper mapper = new ObjectMapper();
	  
	  Job j1 = new Job("code3","title3","company3","location3","employment3","jobfunction3","industry3","description3",true);
	  jobRepository.save(j1);
	  
	  String jsonString = mapper.writeValueAsString(new Applicant("test1003@gmail.com","test3","09132222223",j1));
	  
	  Applicant applicant = applicantRepository.findAll().iterator().next();
	  
	  mvc.perform(MockMvcRequestBuilders
	    	      .put("/api/applicant/update/{id}",applicant.getId())
			      .content(jsonString)
			      .contentType(MediaType.APPLICATION_JSON_UTF8)
	    	      .accept(MediaType.APPLICATION_JSON_UTF8))
	    	      .andExpect(status().isOk())
			      .andExpect(MockMvcResultMatchers.jsonPath("$.name").value("test3"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.email").value("test1003@gmail.com"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.phoneNumber").value("09132222223"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.job.code").value("code3"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.job.title").value("title3"));

  }
  
  @Test
  public void DeleteApplicantTest() throws Exception {

	  Applicant applicant = applicantRepository.findAll().iterator().next();
	  
	  mvc.perform( MockMvcRequestBuilders.delete("/api/applicant/delete/{id}", applicant.getId()) )
      .andExpect(status().isAccepted());

  }

}
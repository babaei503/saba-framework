package ir.saeidbabaei.saba;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import java.util.List;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.security.crypto.codec.Utf8;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.http.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.repositories.ApplicantRepository;


@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@WithMockUser(username="admin",roles={"ADMIN"})
public class ApplicantHireProcessControllerTest {

  @Autowired
  ApplicantRepository applicantRepository;
  
  @Autowired
  private MockMvc mvc;
  
  @Before
  public void setup() throws Exception {
    
    applicantRepository.deleteAll();
    Job j1 = new Job("DTest1","JobTestTitle1");
    applicantRepository.save(new Applicant("test1","test1001@gmail.com","09132222222",j1));
    
  }
  
  @Test
  @WithAnonymousUser
  public void startApplicantHireProcessTest() throws Exception {
	  
	  ObjectMapper mapper = new ObjectMapper();
	  
	  Job j2 = new Job("DTest2","JobTestTitle2");
	  
	  String jsonString = mapper.writeValueAsString(new Applicant("test2","test1002@gmail.com","09132222223",j2));
	  
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

	  mvc.perform( MockMvcRequestBuilders
		      .get("/api/applicant/edit/{id}", 1)
		      .accept(MediaType.APPLICATION_JSON_UTF8))
		      .andDo(print())
		      .andExpect(status().isOk())
		      .andExpect(MockMvcResultMatchers.jsonPath("$.id").value(1));

  }
  
  @Test
  public void GetApplicantByNullTest() throws Exception {

	  mvc.perform( MockMvcRequestBuilders
		      .get("/api/applicant/edit/{id}", 2)
		      .accept(MediaType.APPLICATION_JSON_UTF8))
		      .andDo(print())
		      .andExpect(status().isNotFound());

  }
  
  @Test
  public void UpdateApplicantTest() throws Exception {

	  ObjectMapper mapper = new ObjectMapper();
	  
	  Job j2 = new Job("DTest2","JobTestTitle2");
	  
	  String jsonString = mapper.writeValueAsString(new Applicant("test2","test1002@gmail.com","09132222223",j2));
	  
	  mvc.perform(MockMvcRequestBuilders
	    	      .put("/api/applicant/update/{id}",1)
			      .content(jsonString)
			      .contentType(MediaType.APPLICATION_JSON_UTF8)
	    	      .accept(MediaType.APPLICATION_JSON_UTF8))
	    	      .andExpect(status().isOk())
			      .andExpect(MockMvcResultMatchers.jsonPath("$.Name").value("test2"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.email").value("test1002@gmail.com"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.phonenumber").value("09132222223"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.job.Code").value("DTest2"))
			      .andExpect(MockMvcResultMatchers.jsonPath("$.job.Title").value("JobTestTitle2"));

  }
  
  @Test
  public void DeleteApplicantTest() throws Exception {

	  mvc.perform( MockMvcRequestBuilders.delete("/api/applicant/delete/{id}", 1) )
      .andExpect(status().isAccepted());

  }

}
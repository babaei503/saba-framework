package ir.saeidbabaei.saba;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;

import java.util.List;

@RunWith(SpringRunner.class)
@DataJpaTest
public class ApplicantTest {

    @Autowired
    private TestEntityManager entityManager;

    @Before
    public void setUp() {

        List<Applicant> list = entityManager.getEntityManager().createQuery("from Applicant").getResultList();

        for(Applicant applicant:list) {
            entityManager.remove(applicant);
        }

    }

    @Test
    public void testCRUD()

    {
        Job j1= new Job();
        
        j1.setCode("code1");
        j1.setTitle("title1");     
        j1.setCompany("company1");
        j1.setLocation("location1");
        j1.setIndustry("industry1");
        j1.setJobfunction("jobfunction1");
        j1.getDescription("description1")      
        entityManager.persist(j1);
        
        Applicant a1 = new Applicant();

        a1.setName("testapplicant1");
        a1.setEmail("test@applicant1.com");     
        a1.setPhoneNumber("09132222222");             
        a1.setJob(j1);

        entityManager.persist(a1);

        List<Applicant> list = entityManager.getEntityManager().createQuery("from Applicant").getResultList();

        Assert.assertEquals(1L, list.size());

        Applicant a2 = list.get(0);

        Assert.assertEquals("testapplicant1", a2.getName());
        Assert.assertEquals("test@applicant1.com", a2.getEmail());
        Assert.assertEquals("09132222222", a2.getPhoneNumber());
        Assert.assertEquals(j1, a2.getJob());
        
        Assert.assertTrue(a2.equals(a1));
    }

}
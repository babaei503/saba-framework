package ir.saeidbabaei.saba.applicanthireprocess.entity;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import java.util.List;

@RunWith(SpringRunner.class)
@ActiveProfiles("test")
@DataJpaTest
public class JobTest {

    @Autowired
    private TestEntityManager entityManager;

    @Before
    public void setUp() {

        @SuppressWarnings("unchecked")
		List<Job> list = entityManager.getEntityManager().createQuery("from Job").getResultList();

        for(Job job:list) {
            entityManager.remove(job);
        }

    }

    @Test
    public void testCRUD()

    {
        Job j1 = new Job();

        j1.setCode("code1");
        j1.setTitle("title1");     
        j1.setCompany("company1");
        j1.setLocation("location1");
        j1.setEmployment("employment1");
        j1.setJobfunction("jobfunction1");
        j1.setIndustry("industry1");
        j1.setDescription("description1");
        j1.setOpen(true);

        entityManager.persist(j1);

        @SuppressWarnings("unchecked")
		List<Job> list = entityManager.getEntityManager().createQuery("from Job").getResultList();

        Assert.assertEquals(1L, list.size());

        Job j2 = list.get(0);

        Assert.assertEquals("code1", j2.getCode());
        Assert.assertEquals("title1", j2.getTitle());
        Assert.assertEquals("company1", j2.getCompany());
        Assert.assertEquals("location1", j2.getLocation());
        Assert.assertEquals("employment1", j2.getEmployment());
        Assert.assertEquals("jobfunction1", j2.getJobfunction());
        Assert.assertEquals("industry1", j2.getIndustry());
        Assert.assertEquals("description1", j2.getDescription());
        Assert.assertEquals(true, j2.isOpen());
        
        Assert.assertTrue(j2.equals(j1));
    }

}
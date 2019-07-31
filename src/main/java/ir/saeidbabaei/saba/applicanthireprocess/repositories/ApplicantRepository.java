package ir.saeidbabaei.saba.applicanthireprocess.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;

public interface ApplicantRepository extends JpaRepository<Applicant, Long> {

	@Query("SELECT a FROM Applicant a WHERE a.job = :job")
	List<Applicant> findApplicantByJob(
	  @Param("job") Job job);
	
}
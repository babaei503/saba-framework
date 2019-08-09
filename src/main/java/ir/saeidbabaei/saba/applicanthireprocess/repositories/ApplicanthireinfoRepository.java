package ir.saeidbabaei.saba.applicanthireprocess.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicanthireinfo;

public interface ApplicanthireinfoRepository extends JpaRepository<Applicanthireinfo, Long> {
	
	@Query("SELECT a FROM Applicanthireinfo a WHERE a.applicant = :applicant")
		Applicanthireinfo findApplicanthireinfoByApplicant(
				@Param("applicant") Applicant applicant);
	
}
package ir.saeidbabaei.saba.applicanthireprocess.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;

public interface JobRepository extends JpaRepository<Job, Long> {

}
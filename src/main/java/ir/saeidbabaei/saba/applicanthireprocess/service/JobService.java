package ir.saeidbabaei.saba.applicanthireprocess.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import ir.saeidbabaei.saba.applicanthireprocess.repositories.JobRepository;


@Service
public class JobService implements IJobService {

  @Autowired
  JobRepository jobRepository;
  
  @Override
  public List<Job> findAll() {
    List<Job> jobList = new ArrayList<>();
    jobRepository.findAll().forEach(jobList::add);
    return jobList;
  }
  
  @Override
  public Job save(Job job) {
    return jobRepository.save(job);
  }

  @Override
  public Optional<Job> findById(Long id) {
    Optional<Job> job = jobRepository.findById(id);
    return job;
  }

  @Override
  public  void deleteById(Long id){
	jobRepository.deleteById(id);
  }
}

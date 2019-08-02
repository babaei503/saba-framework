package ir.saeidbabaei.saba.applicanthireprocess.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
  public List<Job> findByLocationAndOpen(String location, boolean open) {
    List<Job> jobList = new ArrayList<>();
    jobRepository.findByLocationAndOpen(location, open).forEach(jobList::add);
    return jobList;
  }
  
  @Override
  public List<Job> findByOpen(boolean open, int page, int itemcount) {
	 Pageable PageWithitemcount = PageRequest.of(page, itemcount);
	 List<Job> jobList = new ArrayList<>();
	 jobRepository.findByOpen(open,PageWithitemcount).forEach(jobList::add);
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

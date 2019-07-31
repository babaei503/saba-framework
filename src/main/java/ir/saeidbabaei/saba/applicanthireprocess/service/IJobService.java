package ir.saeidbabaei.saba.applicanthireprocess.service;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import java.util.List;
import java.util.Optional;

public interface IJobService {
	
  public List<Job> findAll();
  
  public Job save(Job job);

  public void deleteById(Long id);
  
  public Optional<Job> findById(Long id);
  
}

package ir.saeidbabaei.saba.applicanthireprocess.service;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import java.util.Optional;

import org.springframework.data.domain.Page;

public interface IJobService {
	
  public Page<Job> findAll(int page, int itemcount);
  
  public Job save(Job job);

  public void deleteById(Long id);
  
  public Optional<Job> findById(Long id);

  public Page<Job> findByLocationAndOpen(String location, boolean open, int page, int itemcount);

  public Page<Job> findByOpen(boolean open, int page, int itemcount);

  public Page<Job> findByTitleAndOpen(String title, boolean open, int page, int itemcount);

  public Page<Job> findByLocationAndTitleAndOpen(String location, String title, boolean open, int page, int itemcount);
  
  
}

package ir.saeidbabaei.saba.applicanthireprocess.service;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;

import java.util.List;
import java.util.Optional;

public interface IApplicantService {
	
  public List<Applicant> findAll();
  
  public Applicant save(Applicant applicant);

  public void deleteById(Long id);
  
  public Optional<Applicant> findById(Long id);
  
  public List<Applicant> findApplicantByJob(Job job);
  
}

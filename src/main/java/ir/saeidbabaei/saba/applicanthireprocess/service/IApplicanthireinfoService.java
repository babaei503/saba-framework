package ir.saeidbabaei.saba.applicanthireprocess.service;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicanthireinfo;

import java.util.List;
import java.util.Optional;

public interface IApplicanthireinfoService {
	
  public List<Applicanthireinfo> findAll();
  
  public Applicanthireinfo save(Applicanthireinfo applicant);

  public void deleteById(Long id);
  
  public Optional<Applicanthireinfo> findById(Long id);
  
  public Applicanthireinfo findApplicanthireinfoByApplicant(Applicant applicant);
  
}

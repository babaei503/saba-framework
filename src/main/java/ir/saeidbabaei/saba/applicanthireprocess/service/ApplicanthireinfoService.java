package ir.saeidbabaei.saba.applicanthireprocess.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicanthireinfo;
import ir.saeidbabaei.saba.applicanthireprocess.repositories.ApplicanthireinfoRepository;


@Service
public class ApplicanthireinfoService implements IApplicanthireinfoService {

  @Autowired
  ApplicanthireinfoRepository applicanthireinfoRepository;
  
  @Override
  public List<Applicanthireinfo> findAll() {
    List<Applicanthireinfo> applicanthireinfoList = new ArrayList<>();
    applicanthireinfoRepository.findAll().forEach(applicanthireinfoList::add);
    return applicanthireinfoList;
  }
  
  @Override
  public Applicanthireinfo save(Applicanthireinfo applicanthireinfo) {
    return applicanthireinfoRepository.save(applicanthireinfo);
  }

  @Override
  public Optional<Applicanthireinfo> findById(Long id) {
    Optional<Applicanthireinfo> applicanthireinfo = applicanthireinfoRepository.findById(id);
    return applicanthireinfo;
  }

  @Override
  public  void deleteById(Long id){
	  applicanthireinfoRepository.deleteById(id);
  }
  
  @Override
  public Applicanthireinfo findApplicanthireinfoByApplicant(Applicant applicant) {

    return applicanthireinfoRepository.findApplicanthireinfoByApplicant(applicant);
    
  }
  
}

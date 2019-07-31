package ir.saeidbabaei.saba.applicanthireprocess.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Applicant;
import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;
import ir.saeidbabaei.saba.applicanthireprocess.repositories.ApplicantRepository;


@Service
public class ApplicantService implements IApplicantService {

  @Autowired
  ApplicantRepository applicantRepository;
  
  @Override
  public List<Applicant> findAll() {
    List<Applicant> applicantList = new ArrayList<>();
    applicantRepository.findAll().forEach(applicantList::add);
    return applicantList;
  }
  
  @Override
  public Applicant save(Applicant applicant) {
    return applicantRepository.save(applicant);
  }

  @Override
  public Optional<Applicant> findById(Long id) {
    Optional<Applicant> applicant = applicantRepository.findById(id);
    return applicant;
  }

  @Override
  public  void deleteById(Long id){
	applicantRepository.deleteById(id);
  }
  
  @Override
  public List<Applicant> findApplicantByJob(Job job) {
    List<Applicant> applicantList = new ArrayList<>();
    applicantRepository.findApplicantByJob(job).forEach(applicantList::add);
    return applicantList;
  }
  
}

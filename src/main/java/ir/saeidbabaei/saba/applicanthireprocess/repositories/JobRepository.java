package ir.saeidbabaei.saba.applicanthireprocess.repositories;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;

public interface JobRepository extends PagingAndSortingRepository<Job, Long> {

	List<Job> findByLocationAndOpen(String location, boolean open);

	List<Job> findByOpen(boolean open, Pageable pageable);

}
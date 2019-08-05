package ir.saeidbabaei.saba.applicanthireprocess.repositories;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import ir.saeidbabaei.saba.applicanthireprocess.entity.Job;

public interface JobRepository extends PagingAndSortingRepository<Job, Long> {
	
	Page<Job> findAll(Pageable pageable);

	Page<Job> findByLocationAndOpen(String location, boolean open, Pageable pageable);

	Page<Job> findByOpen(boolean open, Pageable pageable);

	Page<Job> findByTitleAndOpen(String title, boolean open, Pageable pageWithitemcount);

	Page<Job> findByLocationAndTitleAndOpen(String location, String title, boolean open,
			Pageable pageWithitemcount);

}
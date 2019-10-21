package com.kh.workman.job.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.job.model.dao.JobDao;

@Service
public class JobServiceImpl implements JobService {

  @Autowired
  JobDao dao;

}

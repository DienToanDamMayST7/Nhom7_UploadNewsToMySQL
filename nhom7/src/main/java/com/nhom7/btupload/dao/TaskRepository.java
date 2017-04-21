package com.nhom7.btupload.dao;
import org.springframework.data.repository.CrudRepository;
import com.nhom7.btupload.model.Task;

public interface  TaskRepository extends CrudRepository<Task, Integer>{
	public Task findById(Integer id);
}

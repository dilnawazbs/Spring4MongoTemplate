package com.mongoexample.dao;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mongoexample.model.Employee;

/**
 * 
 * @author Dilnawaz B S
 *
 */
@Component
@Repository
public class ApplicationRepository {
	@Autowired
	protected MongoTemplate mongoTemplate;
	
	public void insertEmployeeDetails(Employee employeeDetails) {
		mongoTemplate.insert(employeeDetails);
	}
	
	public List<Employee> viewSelectedEmployee(Employee employeeDetails) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("gender").is(employeeDetails.getGender()), Criteria.where("age").gte(employeeDetails.getAge())));
        return Collections.unmodifiableList(mongoTemplate.find(query, Employee.class));
	}
	
	public void updateEmployeeDetails(Employee employeeDetails) {
		Update update = new Update();
		update.set("name", employeeDetails.getName());
		update.set("age", employeeDetails.getAge());
		update.set("gender", employeeDetails.getGender());
		update.set("company", employeeDetails.getCompany());
		mongoTemplate.updateFirst(new Query(new Criteria().where("employeeId").is(employeeDetails.getEmployeeId())), update, Employee.class);
		
	}
	
	public void deleteEmployeeDetails(Employee employeeDetails) {
		mongoTemplate.remove(new Query(new Criteria().where("employeeId").is(employeeDetails.getEmployeeId())) , Employee.class, "Employee");
	}
	
}

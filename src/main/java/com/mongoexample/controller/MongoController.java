package com.mongoexample.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mongoexample.dao.ApplicationRepository;
import com.mongoexample.model.Employee;
/**
 *  
 * @author Dilnawaz B S
 *
 */
@Controller
public class MongoController {
	@Autowired
	ApplicationRepository mongoRepository;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getIndexPage() {
		ModelAndView view = new ModelAndView("AddEmployee", "command", new Employee());
		return view;
	}
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	public ModelAndView addEmployee(@ModelAttribute Employee employeeDetails, ModelMap model) {
		mongoRepository.insertEmployeeDetails(employeeDetails);
		ModelAndView view = new ModelAndView("AddEmployee", "command", new Employee());
		return view;
	}
	@RequestMapping(value = "/viewSelectedEmployees", method = RequestMethod.POST)
	public ModelAndView viewSelectedEmployees(@ModelAttribute Employee employeeDetails, ModelMap model) {
		List<Employee> details = mongoRepository.viewSelectedEmployee(employeeDetails);
		model.addAttribute("employeeDeatils",details);
		ModelAndView view = new ModelAndView("viewEmployee");
		return view;
	}
	
	@RequestMapping(value = "/updateEmployees", method = RequestMethod.POST)
	public ModelAndView updateEmployees(@ModelAttribute Employee employeeDetails, ModelMap model) {
		mongoRepository.updateEmployeeDetails(employeeDetails);
		ModelAndView view = new ModelAndView("AddEmployee", "command", new Employee());
		return view;
	}
	
	@RequestMapping(value = "/deleteEmployees", method = RequestMethod.POST)
	public ModelAndView deleteEmployees(@ModelAttribute Employee employeeDetails, ModelMap model) {
		mongoRepository.deleteEmployeeDetails(employeeDetails);
		ModelAndView view = new ModelAndView("AddEmployee", "command", new Employee());
		return view;
	}
	
}

package com.Pl_Advanced_project.Diversity.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pl_Advanced_project.Diversity.Model.Empleados;
import com.Pl_Advanced_project.Diversity.Repository.EmployeesRepository;

@Service
public class EmployeesService {
    @Autowired
    private EmployeesRepository empoyesr;

    public List<Empleados> getallemployees() {
        return empoyesr.findAll();
    }

    public Empleados createemployees(Empleados emp) {
        return empoyesr.save(emp);
    }

    public Empleados updateEmployees(Empleados emp) {
        return empoyesr.save(emp);
    }

    public void deleteemp(Long id) {
        empoyesr.deleteById(id);
    }
}

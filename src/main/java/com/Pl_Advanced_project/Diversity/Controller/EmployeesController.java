package com.Pl_Advanced_project.Diversity.Controller;

import java.util.List;

import com.Pl_Advanced_project.Diversity.Model.Empleados;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Pl_Advanced_project.Diversity.Service.EmployeesService;

@Controller

@RestController
@RequestMapping("/api")
public class EmployeesController {
    @Autowired
    private EmployeesService empservice;

    @GetMapping("/")
    public String abrire(Model modelo) {
        Empleados employees = new Empleados();
        modelo.addAttribute("employees", employees);
        return "index";
    }

    @GetMapping("/listaremp")
    public List<Empleados> Getallemp() {
        return empservice.getallemployees();
    }

    @PostMapping("/agregaremp")
    public Empleados registeremp(@RequestBody Empleados emp) {
        return empservice.createemployees(emp);
    }

    @PostMapping("/updateemp/{id}")
    public Empleados updatemp(@RequestBody Empleados emp, @PathVariable Long id) {
        emp.setEmpleado_id(id);
        return empservice.updateEmployees(emp);
    }

    @DeleteMapping("/deleteemp/{id}")
    public String deleteemp(@PathVariable Long id) {
        empservice.deleteemp(id);
        return "Eliminado Correctamente : " + id;
    }
}
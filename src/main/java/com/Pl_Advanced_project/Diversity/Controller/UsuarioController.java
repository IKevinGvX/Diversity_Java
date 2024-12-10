package com.Pl_Advanced_project.Diversity.Controller;

import java.util.List;
import com.Pl_Advanced_project.Diversity.Model.Usuarios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Pl_Advanced_project.Diversity.Service.UsuariosService;

@Controller

@RestController
@RequestMapping("api/")
public class UsuarioController {
    @Autowired
    private UsuariosService userservice;

    @GetMapping("/Listarusers")
    public List<Usuarios> Getalluser() {
        return userservice.getalluser();
    }

    @PostMapping("/RegisterUsers")
    public Usuarios registeruser(@RequestBody Usuarios usuarios) {
        return userservice.createuser(usuarios);
    }

    @PostMapping("/updateusers/{id}")
    public Usuarios updateusers(@RequestBody Usuarios usuarios, @PathVariable Long id) {
        usuarios.setUsuario_id(id);
        return userservice.updateuser(usuarios);
    }

    @DeleteMapping("/Deleteusers/{id}")
    public String deleteusers(@PathVariable Long id) {
        userservice.deleteuser(id);
        return "Eliminado : " + id;
    }
}

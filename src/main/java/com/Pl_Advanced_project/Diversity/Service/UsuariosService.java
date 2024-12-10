package com.Pl_Advanced_project.Diversity.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pl_Advanced_project.Diversity.Model.Usuarios;
import com.Pl_Advanced_project.Diversity.Repository.UsuariosRepository;

@Service
public class UsuariosService {
    @Autowired
    private UsuariosRepository userrepository;

    public List<Usuarios> getalluser() {
        return userrepository.findAll();
    }

    public Usuarios createuser(Usuarios user) {
        return userrepository.save(user);
    }

    public Usuarios updateuser(Usuarios user) {
        return userrepository.save(user);
    }

    public void deleteuser(Long id) {
        userrepository.deleteById(id);
    }
}

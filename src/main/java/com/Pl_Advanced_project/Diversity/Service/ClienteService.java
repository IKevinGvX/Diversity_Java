package com.Pl_Advanced_project.Diversity.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pl_Advanced_project.Diversity.Model.Clientes;
import com.Pl_Advanced_project.Diversity.Repository.ClienteRepository;

@Service
public class ClienteService {

    @Autowired
    private ClienteRepository clients;

    public List<Clientes> getallclient() {
        return clients.findAll();
    }

    public Clientes createclient(Clientes cli) {
        return clients.save(cli);
    }

    public Clientes updateclient(Clientes cli) {
        return clients.save(cli);
    }

    public void deleteclient(Long id) {
        clients.deleteById(id);
    }
}

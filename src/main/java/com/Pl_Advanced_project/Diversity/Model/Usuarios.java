package com.Pl_Advanced_project.Diversity.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Usuarios {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long usuario_id;
    private String email;
    private String contrasena;
    private Integer rol_id;
    private String fecha_creacion;

    public Usuarios() {
    }

    public Usuarios(long usuario_id, String email, String contrasena, Integer rol_id, String fecha_creacion) {
        this.usuario_id = usuario_id;
        this.email = email;
        this.contrasena = contrasena;
        this.rol_id = rol_id;
        this.fecha_creacion = fecha_creacion;
    }

    public long getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(long usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Integer getRol_id() {
        return rol_id;
    }

    public void setRol_id(Integer rol_id) {
        this.rol_id = rol_id;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }
}

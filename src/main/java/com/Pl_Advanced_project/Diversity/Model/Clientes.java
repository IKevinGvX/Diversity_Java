package com.Pl_Advanced_project.Diversity.Model;

import java.sql.Blob;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Clientes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cliente_id;
    private Integer usuario_id;
    private String nombre, apellido, fecha;
    private Integer dni;
    private Blob foto;
    private Integer ruc;
    private String correo, telefono, direccion;

    public Clientes(Long cliente_id, Integer usuario_id, String nombre, String apellido, String fecha, Integer dni,
            Blob foto, Integer ruc, String correo, String telefono, String direccion) {
        this.cliente_id = cliente_id;
        this.usuario_id = usuario_id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
        this.dni = dni;
        this.foto = foto;
        this.ruc = ruc;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public Clientes(Long cliente_id, String nombre, String apellido, String fecha, Integer dni, Blob foto, Integer ruc,
            String correo, String telefono, String direccion) {
        this.cliente_id = cliente_id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
        this.dni = dni;
        this.foto = foto;
        this.ruc = ruc;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public Clientes() {
    }

    public Long getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(Long cliente_id) {
        this.cliente_id = cliente_id;
    }

    public Integer getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(Integer usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }

    public Blob getFoto() {
        return foto;
    }

    public void setFoto(Blob foto) {
        this.foto = foto;
    }

    public Integer getRuc() {
        return ruc;
    }

    public void setRuc(Integer ruc) {
        this.ruc = ruc;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

}

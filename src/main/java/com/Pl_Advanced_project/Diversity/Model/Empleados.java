package com.Pl_Advanced_project.Diversity.Model;

import java.sql.Blob;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Empleados {
    @Id
    private Long empleado_id;
    private Integer usuario_id;
    private String rango, nombre, apellido, fecha;
    private Integer dni;
    private Blob foto;
    private String correo, telefono, direccion;

    // crud add
    public Empleados(String rango, String nombre, String apellido, String fecha, Integer dni, Blob foto, String correo,
            String telefono, String direccion) {
        this.rango = rango;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
        this.dni = dni;
        this.foto = foto;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    // Construct ALL
    public Empleados(Long empleado_id,
            Integer usuario_id, String rango, String nombre, String apellido, String fecha,
            Integer dni, Blob foto, String correo, String telefono, String direccion) {
        this.empleado_id = empleado_id;
        this.usuario_id = usuario_id;
        this.rango = rango;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
        this.dni = dni;
        this.foto = foto;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public Empleados() {
    }

    public Long getEmpleado_id() {
        return empleado_id;
    }

    public void setEmpleado_id(Long empleado_id) {
        this.empleado_id = empleado_id;
    }

    public Integer getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(Integer usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getRango() {
        return rango;
    }

    public void setRango(String rango) {
        this.rango = rango;
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
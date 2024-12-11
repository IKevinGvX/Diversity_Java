// package com.Pl_Advanced_project.Diversity.Service;

// import java.util.Collection;
// import java.util.Set;
// import java.util.stream.Collectors;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.core.GrantedAuthority;
// import org.springframework.security.core.authority.SimpleGrantedAuthority;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.core.userdetails.UserDetailsService;
// import
// org.springframework.security.core.userdetails.UsernameNotFoundException;
// import org.springframework.stereotype.Service;

// import com.Pl_Advanced_project.Diversity.Model.Usuario;
// import com.Pl_Advanced_project.Diversity.Model.Usuario.Roles;
// import com.Pl_Advanced_project.Diversity.Repository.UsuarioRepository;

// @Service
// ublic class UserDetailsServiceImpl implements UserDetailsService {

// @Autowired private UsuarioRepository usuarioRepository;

// @Override public UserDetails loadUserByUsername(String email)throws
// UsernameNotFoundException{Usuario
// usuario=usuarioRepository.findByEmail(email).orElseThrow(()->new
// UsernameNotFoundException("Usuario no encontrado"));

// return new
// org.springframework.security.core.userdetails.User(usuario.getEmail(),usuario.getContrasena(),usuario.isEnabled(),true,true,true,getAuthorities(usuario.getRoles()));}

// private Collection<?extends
// GrantedAuthority>getAuthorities(Set<Roles>roles){return
// roles.stream().map(role->new
// SimpleGrantedAuthority(role.getNombre_rol())).collect(Collectors.toList());}}

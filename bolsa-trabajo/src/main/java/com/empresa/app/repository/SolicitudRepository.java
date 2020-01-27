package com.empresa.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.empresa.app.model.Solicitud;

public interface SolicitudRepository extends JpaRepository<Solicitud, Integer> 
{

}

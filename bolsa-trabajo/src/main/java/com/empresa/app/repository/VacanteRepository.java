package com.empresa.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.empresa.app.model.Vacante;

@Repository(value = "vacanteRepository")
public interface VacanteRepository extends JpaRepository<Vacante, Integer> 
{

}

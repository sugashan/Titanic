package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.ActivityLog;

public interface AcitivityLogRepository extends JpaRepository<ActivityLog, Integer> {

}

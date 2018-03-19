package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.titanic.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Integer> {


}

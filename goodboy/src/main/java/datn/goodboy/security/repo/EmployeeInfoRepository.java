package datn.goodboy.security.repo;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import datn.goodboy.model.entity.Account;
import datn.goodboy.model.entity.Employee;

public interface EmployeeInfoRepository extends JpaRepository<Employee, UUID> {
  @Query("SELECT emp from Employee emp WHERE emp.email = :username")
  Optional<Employee> getuser(@Param("username") String username);

  @Query(value = "SELECT acc FROM Account acc WHERE acc.email LIKE :email")
  List<Account> hasEmailis(@Param("email") String email);
}

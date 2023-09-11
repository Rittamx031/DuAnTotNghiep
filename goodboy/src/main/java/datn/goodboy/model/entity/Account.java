package datn.goodboy.model.entity;

import java.time.LocalDate;
import java.util.UUID;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.AllArgsConstructor;

@Entity
@Getter
@Setter
@Table(name = "account")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Account {
  @Id
  @Column(name = "id")
  private UUID id;
  @Column(name = "code")
  private String code;
  @Column(name = "name")
  private String name;
  @Column(name = "birth_date")
  private LocalDate birth_date;
  @Column(name = "phone")
  private String phone;
  @Column(name = "email")
  private String email;
  @Column(name = "password")
  private String password;
  // @OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
  // private Customer customer;
}

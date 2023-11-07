package datn.goodboy.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Data
@Getter
@Setter
@Table(name = "voucher_detail")
@NoArgsConstructor
@AllArgsConstructor
public class VoucherDetail {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private int id;
  @OneToOne
  @JoinColumn(name = "id_bill")
  private Bill bill;
  @OneToOne
  @JoinColumn(name = "id_voucher")
  private Voucher voucher;
  @Column(name = "money_before_reduction")
  private float money_before_reduction;
  @Column(name = "money_after_reduction")
  private float money_after_reduction;
  @Column(name = "money_reduction")
  private float money_reduction;
  @Column(name = "status")
  private int status;
}

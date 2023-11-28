package datn.goodboy.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import datn.goodboy.model.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("SELECT b FROM Product b WHERE b.code LIKE %:keyword% OR b.name LIKE %:keyword%")
    Page<Product> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

    Page<Product> findAllByOrderByCreatedAtDesc(Pageable pageable);

    @Query("SELECT new map(e.id as key, e.name as value) FROM Product e")
    List<Map<Integer, String>> getComboBoxMap();

    @Query("SELECT p FROM Product p WHERE SIZE(p.productDetails) > 0")
    Page<Product> getProductSales(Pageable pageable);

    Page<Product> findAll(Pageable pageable);
}

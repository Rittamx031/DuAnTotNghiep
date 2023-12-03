package datn.goodboy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import datn.goodboy.model.entity.Brand;
import datn.goodboy.model.entity.PatternType;
import datn.goodboy.model.entity.Product;
import datn.goodboy.model.entity.ProductDetail;
import datn.goodboy.model.entity.Size;
import datn.goodboy.model.request.ProductAddRequest;
import datn.goodboy.model.request.ProductAddRequest.ProductDetailAdd;
import datn.goodboy.repository.ProductDetailRepository;
import datn.goodboy.repository.ProductRepository;
import datn.goodboy.service.serviceinterface.PanigationInterface;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class ManagerProductService implements PanigationInterface<Product> {
  @Autowired
  private ProductRepository productRepository;
  @Autowired
  private ProductDetailRepository productDetailRepository;
  @Autowired
  private BrandService brandService;

  @Autowired
  private MaterialService materialService;

  @Autowired
  private OriginService originService;

  @Autowired
  private PatternTypeService patternService;

  @Autowired
  private SizeService sizeService;

  @Autowired
  private StylesService stylesService;

  @Autowired
  private CategoryService categoryService;

  public Page<Product> findAll(Pageable pageable) {
    return productRepository.findAllByOrderByCreatedAtDesc(pageable);
  }

  public Product add(Product origin) {
    return productRepository.save(origin);
  }

  public Product update(Integer id, Product color) {
    Product color1 = productRepository.findById(id).get();
    color1.setName(color.getName());
    color1.setUpdatedAt(color.getUpdatedAt());
    color1.setStatus(color.getStatus());
    return productRepository.save(color1);
  }

  public Product getById(Integer id) {
    return productRepository.findById(id).get();
  }

  public Page<Product> searchProductByKeyword(String keyword, Pageable pageable) {
    return productRepository.searchByKeyword(keyword, pageable);
  }

  public List<Map<Integer, String>> getCombobox() {
    return productRepository.getComboBoxMap();
  }

  public void deleteProduct(Integer id) {
    Optional<Product> product = productRepository.findById(id);
    if (product.isPresent()) {
      if (product.get().isDeleted()) {
        product.get().setDeleted(false);
      } else {
        product.get().setDeleted(true);
      }
      productRepository.save(product.get());
    }
  }

  @Override
  public List<Product> getPageNo(int pageNo, int pageSize, String sortBy, boolean sortDir) {
    if (pageNo > getPageNumber(pageSize)) {
      return null;
    }
    Sort sort;
    if (sortDir) {
      sort = Sort.by(sortBy).ascending();
    } else {
      sort = Sort.by(sortBy).descending();
    }
    Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
    Page<Product> page = productRepository.findAll(pageable);
    return page.getContent();
  }

  @Override
  public int getPageNumber(int rowcount) {
    Pageable pageable = PageRequest.of(0, rowcount);
    Page<Product> page = productRepository.findAll(pageable);
    int totalPage = page.getTotalPages();
    return totalPage;
  }

  @Override
  public int[] getPanigation(int rowcount, int pageno) {
    Pageable pageable = PageRequest.of(0, rowcount);
    Page<Product> page = productRepository.findAll(pageable);
    int totalPage = page.getTotalPages();
    return Panigation(pageno, totalPage);
  }

  public int[] Panigation(int pageno, int totalPage) {
    int[] rs;
    if (totalPage <= 1) {
      int[] rs1 = { 1 };
      return rs1;
    } else if (totalPage <= 3) {
      rs = new int[totalPage];
      for (int i = 1; i <= totalPage; i++) {
        rs[i - 1] = i;
      }
      return rs;
    } else {
      rs = new int[3];
      if (pageno <= 2) {
        int[] rs1 = { 1, 2, 3 };
        rs = rs1;
      }
      if (pageno > 2) {
        if (pageno < totalPage - 1) {
          int[] rs1 = { pageno - 1, pageno, pageno + 1 };
          rs = rs1;
        }
        if (pageno >= totalPage - 1) {
          int[] rs1 = { totalPage - 2, totalPage - 1, totalPage };
          rs = rs1;
        }
      }
      return rs;
    }
  }

  public Product saveProduct(ProductAddRequest request) {
    Product product = new Product();
    product.setName(request.getName());
    product.setIdOrigin(originService.getById(request.getIdOrigin()));
    product.setIdBrand(brandService.getById(request.getIdBrand()));
    product.setIdMaterial(materialService.getById(request.getIdMaterial()));
    product.setIdCategory(categoryService.getById(request.getIdCategory()));
    product.setIdStyles(stylesService.getById(request.getIdStyles()));
    product.setStatus(1);
    product.setDeleted(false);
    Product productsave = productRepository.save(product);
    System.out.println(productsave);
    for (ProductDetailAdd productDetailAdd : request.getProductDetails()) {
      ProductDetail productDetail = productDetailRepository.save(new ProductDetail());
      PatternType pattern = patternService.getById(productDetailAdd.getIdPattern());
      Size size = sizeService.getById(productDetailAdd.getIdSize());
      productDetail.setIdProduct(productsave);
      productDetail.setIdPattern(pattern);
      productDetail.setIdSize(size);
      productDetail.setDescription(productDetailAdd.getDescription());
      productDetail.setPrice(productDetailAdd.getPrice());
      productDetail.setQuantity(productDetailAdd.getQuantity());
      productDetail.setName(productsave.getName());
      productDetail.setStatus(1);
      productDetail.setDeleted(false);
      System.out.println(productDetail);
      productDetailRepository.save(productDetail);
    }
    return product;
  }

}

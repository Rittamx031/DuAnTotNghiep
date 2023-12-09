package datn.goodboy.controller;

import java.util.List;

import datn.goodboy.model.entity.Brand;
import datn.goodboy.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import datn.goodboy.model.entity.Product;
import datn.goodboy.service.ProductService;
import datn.goodboy.utils.convert.TrangThaiConvert;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private BrandService  brandService;
    @Autowired
    TrangThaiConvert convert;

    @Autowired
    @ModelAttribute("convert")
    public TrangThaiConvert convert() {
        return convert;
    }

    @GetMapping({ "/dsProduct", "" })
    public String hienThi(Model model, @RequestParam(name = "pageSize", defaultValue = "5") Integer pageSize,
            @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum) {

        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> brandPage = productService.findAll(pageable);
        model.addAttribute("totalPage", brandPage.getTotalPages());
        model.addAttribute("brandPage", brandPage.getContent());
        return "admin/pages/product/hien-thi";
    }

    @GetMapping("/search")
    public String searchByKeyWork(Model model, @RequestParam(name = "pageSize", defaultValue = "5") Integer pageSize,
            @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
            @RequestParam(name = "keyword", required = false) String keyword) {

        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> brandPage;
        if (keyword != null && !keyword.isEmpty()) {
            // Nếu từ khóa không rỗng, thực hiện tìm kiếm theo từ khóa
            brandPage = productService.searchProductByKeyword(keyword, pageable);
        } else {
            // Nếu không có từ khóa, lấy tất cả thương hiệu
            brandPage = productService.findAll(pageable);
        }
        model.addAttribute("totalPage", brandPage.getTotalPages());
        model.addAttribute("brandPage", brandPage.getContent());
        model.addAttribute("keyword", keyword); // Truyền từ khóa để hiển thị lại trên giao diện
        return "admin/pages/product/hien-thi";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        return "admin/pages/brand/create-brand";
    }

    @GetMapping("/view-update/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("brand", productService.getById(id));
        return "admin/pages/product/update-product";
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @Valid Product b, @PathVariable Integer id,
            @RequestParam("listimage") List<MultipartFile> listimage) {
        productService.update(id, b);
        return "redirect:/admin/product/dsProduct";
    }

    @PostMapping("/add")
    public String add(Model model, @Valid Product b, BindingResult result) {
        b.setStatus(1);
        productService.add(b);
        return "redirect:/admin/product/dsProduct";
    }

    @GetMapping("/delete")
    public String delete(Model model, @RequestParam("id") Integer id) {
        productService.deleteProduct(id);
        return "redirect:/admin/product/dsProduct";
    }





}

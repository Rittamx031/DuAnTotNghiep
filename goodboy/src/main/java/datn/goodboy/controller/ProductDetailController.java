package datn.goodboy.controller;

import datn.goodboy.model.entity.Origin;
import datn.goodboy.model.entity.ProductDetail;
import datn.goodboy.model.request.ProductDetailFilter;
import datn.goodboy.model.request.ProductDetailRequest;
import datn.goodboy.service.BrandService;
import datn.goodboy.service.ColorService;
import datn.goodboy.service.CustomerService;
import datn.goodboy.service.MaterialService;
import datn.goodboy.service.OriginService;
import datn.goodboy.service.PatternTypeService;
import datn.goodboy.service.ProductDetailService;
import datn.goodboy.service.ProductService;
import datn.goodboy.service.SizeService;
import datn.goodboy.service.StylesService;
import datn.goodboy.utils.convert.TrangThaiConvert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/productdetail")
public class ProductDetailController {

  @Autowired
  private ProductDetailService service;

  @Autowired
  private BrandService brandService;

  @Autowired
  private ColorService colorService;

  @Autowired
  private MaterialService materialService;

  @Autowired
  private OriginService originService;

  @Autowired
  private PatternTypeService patternTypeService;

  @Autowired
  private ProductService productService;

  @Autowired
  private SizeService sizeService;

  @Autowired
  private StylesService stylesService;

  // @ModelAttribute("brand-combobox")
  // public ProductDetailFilter fillter() {
  //   return filter;
  // }

  @Autowired
  TrangThaiConvert convert;

  @Autowired
  private ProductDetailFilter filter;

  @ModelAttribute("fillter")
  public ProductDetailFilter fillter() {
    return filter;
  }

  @ModelAttribute("convert")
  public TrangThaiConvert convert() {
    return convert;
  }

  @Autowired
  private CustomerService customerService;
  @Autowired
  private ProductDetailRequest voucherRequest;
  public int rowcount = 10;
  public int[] pagenumbers;
  public String sortBy = "name";
  public boolean sortDir = true;
  public int pageno = 0;
  public int totalpage = 0;

  @ModelAttribute("rowcount")
  public int rowcount() {
    return rowcount;
  }

  // panigation and sort
  @GetMapping("/getcountrow")
  public String getCountRow(Model model, @RequestParam("selectedValue") String selectedValue,
      @ModelAttribute("fillter") ProductDetailFilter fillter) {
    System.out.println(selectedValue);
    rowcount = Integer.parseInt(selectedValue);
    if (fillter != null) {
      if (fillter.filterAble()) {
        List<ProductDetail> list = service.getPageNo(this.pageno, rowcount, sortBy, sortDir, fillter);
        pagenumbers = service.getPanigation(rowcount, pageno, fillter);
        totalpage = service.getPageNumber(rowcount, fillter);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("list", list);
        model.addAttribute("pagenumber", pagenumbers);
        model.addAttribute("crpage", pageno);
        model.addAttribute("rowcount", rowcount);
        return "/admin/pages/productdetail/table-productdetail.html";
      }
    }
    pagenumbers = service.getPanigation(rowcount, pageno);
    this.pageno = 1;
    List<ProductDetail> list = service.getPageNo(1, rowcount, sortBy, sortDir);
    totalpage = service.getPageNumber(rowcount);
    model.addAttribute("totalpage", totalpage);
    model.addAttribute("list", list);
    model.addAttribute("pagenumber", pagenumbers);
    model.addAttribute("crpage", pageno);
    model.addAttribute("rowcount", rowcount);
    return "/admin/pages/productdetail/table-productdetail.html"; // Redirect back to the form page
  }

  @GetMapping("sort")
  public String getPageSort(Model model, @RequestParam("sortBy") String sortby,
      @RequestParam("sortDir") boolean sordir,
      @ModelAttribute("fillter") ProductDetailFilter fillter) {
    this.sortBy = sortby;
    this.sortDir = sordir;
    this.pageno = 1;
    if (fillter != null) {
      if (fillter.filterAble()) {
        List<ProductDetail> list = service.getPageNo(this.pageno, rowcount, sortBy, sortDir, fillter);
        pagenumbers = service.getPanigation(rowcount, pageno, fillter);
        totalpage = service.getPageNumber(rowcount, fillter);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("list", list);
        model.addAttribute("pagenumber", pagenumbers);
        model.addAttribute("crpage", pageno);
        model.addAttribute("rowcount", rowcount);
        return "/admin/pages/productdetail/table-productdetail.html";
      }
    }
    List<ProductDetail> list = service.getPageNo(this.pageno, rowcount, this.sortBy, this.sortDir);
    totalpage = service.getPageNumber(rowcount);
    pagenumbers = service.getPanigation(rowcount, pageno);
    model.addAttribute("list", list);
    model.addAttribute("totalpage", totalpage);
    model.addAttribute("pagenumber", pagenumbers);
    model.addAttribute("crpage", pageno);
    model.addAttribute("rowcount", rowcount);
    return "/admin/pages/productdetail/table-productdetail.html";
  }

  @GetMapping("/page")
  public String getPageNo(Model model, @RequestParam("pageno") int pageno,
      @ModelAttribute("fillter") ProductDetailFilter fillter) {
    if (pageno <= 1) {
      this.pageno = 1;
      pageno = 1;
    }
    this.pageno = pageno;
    if (fillter != null) {
      if (fillter.filterAble()) {
        List<ProductDetail> list = service.getPageNo(this.pageno, rowcount, sortBy, sortDir, fillter);
        pagenumbers = service.getPanigation(rowcount, pageno, fillter);
        totalpage = service.getPageNumber(rowcount, fillter);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("list", list);
        model.addAttribute("pagenumber", pagenumbers);
        model.addAttribute("crpage", pageno);
        model.addAttribute("rowcount", rowcount);
        return "/admin/pages/productdetail/table-productdetail.html";
      }
    }
    List<ProductDetail> list = service.getPageNo(this.pageno, rowcount, sortBy, sortDir);
    totalpage = service.getPageNumber(rowcount);
    model.addAttribute("totalpage", totalpage);
    pagenumbers = service.getPanigation(rowcount, this.pageno);
    model.addAttribute("pagenumber", pagenumbers);
    model.addAttribute("crpage", this.pageno);
    model.addAttribute("list", list);
    model.addAttribute("rowcount", rowcount);
    return "/admin/pages/productdetail/table-productdetail.html";
  }

  // end
  @GetMapping({ "index", "" })
  public String getProductDetailIndexpages(Model model, @ModelAttribute("fillter") ProductDetailFilter fillter) {
    if (fillter != null) {
      if (fillter.filterAble()) {
        this.pageno = 1;
        List<ProductDetail> list = service.getPageNo(this.pageno, rowcount, sortBy, sortDir, fillter);
        pagenumbers = service.getPanigation(rowcount, pageno, fillter);
        totalpage = service.getPageNumber(rowcount, fillter);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("list", list);
        model.addAttribute("pagenumber", pagenumbers);
        model.addAttribute("crpage", pageno);
        model.addAttribute("rowcount", rowcount);
        return "/admin/pages/productdetail/table-productdetail.html";
      }
    }
    this.pageno = 1;
    List<ProductDetail> list = service.getPageNo(this.pageno, rowcount, sortBy, sortDir);
    pagenumbers = service.getPanigation(rowcount, pageno);
    totalpage = service.getPageNumber(rowcount);
    model.addAttribute("totalpage", totalpage);
    model.addAttribute("list", list);
    model.addAttribute("pagenumber", pagenumbers);
    model.addAttribute("crpage", pageno);
    model.addAttribute("rowcount", rowcount);
    return "/admin/pages/productdetail/table-productdetail.html";
  }

  // @GetMapping({ "filter" })
  // public String searchAndFillter() {
  // return "/admin/pages/productdetail/table-productdetail.html";
  // }

  @ModelAttribute("voucherRequest")
  public ProductDetailRequest setSignUpForm() {
    return voucherRequest;
  }

  @GetMapping("create")
  public String goToCreateForm(Model model) {
    voucherRequest = new ProductDetailRequest();
    model.addAttribute("listCustomer", customerService.getComboBox());
    model.addAttribute("voucherRequest", voucherRequest);
    return "/admin/pages/productdetail/form-voucher.html";
  }

  @GetMapping("delete")
  public String deleteProductDetail(Model model, @RequestParam("id") String id) {
    // service.deleteProductDetail(UUID.fromString(id));
    return "redirect:index";
  }

  @GetMapping("filter")
  public String storeProductDetail(Model model, @ModelAttribute("fillter") ProductDetailFilter fillter) {
    System.out.println(fillter.toString());
    return "redirect:index";
  }

  @GetMapping("resetfilter")
  public String resetFilter(Model model, @ModelAttribute("fillter") ProductDetailFilter fillter) {
    fillter.resetFilter();
    model.addAttribute("fillter", fillter);
    System.out.println(fillter.toString());
    return "redirect:index";
  }

  // @GetMapping("edit")
  // public String editProductDetail(Model model, @RequestParam("id") UUID id) {
  // model.addAttribute("voucherRequest",
  // service.getProductDetailRequetById(id));
  // return "/admin/pages/productdetail/form-voucher.html";
  // }
  // @GetMapping("edit")
  // public String editProductDetail(Model model, @RequestParam("id") int id) {
  // ProductDetailRequest voucherRequest = service.getProductDetailRequetById(id);
  // model.addAttribute("voucherRequest",
  // service.getProductDetailRequetById(id));
  // return "/admin/pages/productdetail/update-voucher.html";
  // }

  // @PostMapping("store")
  // public String storeProductDetail(Model model, @Valid
  // @ModelAttribute("voucherRequest") ProductDetailRequest voucherRequest,
  // BindingResult theBindingResult) {
  // if (theBindingResult.hasErrors()) {
  // return "/admin/pages/productdetail/form-voucher.html";
  // } else {
  // if (voucherRequest.validateHasError()) {
  // model.addAttribute("validateerrors", voucherRequest.ValidateError());
  // return "/admin/pages/productdetail/form-voucher.html";
  // }
  // System.out.println(voucherRequest.toString());
  // service.saveProductDetail(voucherRequest);
  // return "redirect:index";
  // }
  // }

  // @PostMapping("update")
  // public String update(@Valid @ModelAttribute("voucherRequest")
  // ProductDetailRequest voucherRequest,
  // BindingResult theBindingResult, Model model) {
  // if (theBindingResult.hasErrors()) {
  // return "/admin/pages/productdetail/update-voucher.html";
  // }
  // System.out.println(voucherRequest);
  // service.updateProductDetail(voucherRequest);
  // return "redirect:index";
  // }
}

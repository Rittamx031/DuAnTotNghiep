package datn.goodboy.controller;

import datn.goodboy.config.ConfigPay;
import datn.goodboy.model.entity.Pay;
import datn.goodboy.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/payment")
public class PayController {

    @Autowired
    private BillController billController;

    private final PayService payService;

    @Autowired
    public PayController(PayService payService) {
        this.payService = payService;
    }

        @GetMapping("/create_payment")
    public String getPay() throws UnsupportedEncodingException {

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = 10000 * 100;
        String bankCode = "NCB";

        String vnp_TxnRef = ConfigPay.getRandomNumber(8);
        String vnp_IpAddr = "127.0.0.1";

        String vnp_TmnCode = ConfigPay.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        vnp_Params.put("vnp_BankCode", bankCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        vnp_Params.put("vnp_Locale", "vn");
//        vnp_Params.put("vnp_ReturnURL",ConfigPay.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = ConfigPay.hmacSHA512(ConfigPay.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = ConfigPay.vnp_PayUrl + "?" + queryUrl;

        return paymentUrl;
    }


//    @GetMapping("/hien-thi")
//    public String hienThi(Model model,@RequestParam(name = "pageSize", defaultValue = "5") Integer pageSize,
//                          @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum) {
//
//            Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
//            Page<Pay> pay = payService.getPage(pageable);
//            model.addAttribute("totalPage", pay.getTotalPages());
//            model.addAttribute("payPage", pay.getContent());
//        model.addAttribute("customer", customerService.getAllCustomers());
//        model.addAttribute("employee", employeeService.getAllEmployee());
//        model.addAttribute("pay", payService.getAllPay());
//        return "/admin/pages/pay/pay";
//    }

    @GetMapping
    public String showPaymentPage() {
        return "/admin/pages/pay/payment";
    }

    @PostMapping("/cash")
    public String payWithCash(Model model) {
        int id = 1; // ID for "Tiền mặt"
        Optional<Pay> optionalPay = payService.findPayById(id);
        if (optionalPay.isPresent()) {
            Pay pay = optionalPay.get();
            payService.updatePaymentMethod(id, "Tiền mặt");
            model.addAttribute("message", "Success! Tiền mặt ID 1");
        } else {
            model.addAttribute("message", "Error: Payment not found");
        }
        return "/admin/pages/dashboard"; // Dẫn đến lại trang hóa đơn để hoàn tất đơn hàng
    }

    @PostMapping("/bankTransfer")
    public String payWithBankTransfer(Model model) {
        int id = 2; // ID for "Chuyển khoản"
        Optional<Pay> optionalPay = payService.findPayById(id);
        if (optionalPay.isPresent()) {
            Pay pay = optionalPay.get();
            payService.updatePaymentMethod(id, "Chuyển khoản");
            model.addAttribute("message", "Success! Chuyển khoản ID 2");
        } else {
            model.addAttribute("message", "Error: Payment not found");
        }
        return "/admin/pages/dashboard"; // Dẫn đến URL THANH TOÁN
    }



}




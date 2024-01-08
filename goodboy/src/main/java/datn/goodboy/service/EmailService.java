package datn.goodboy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import datn.goodboy.model.entity.VertifyEmail;
import datn.goodboy.model.entity.Voucher;
import datn.goodboy.repository.AccountRepository;
import datn.goodboy.repository.CustomerRepository;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Component
public class EmailService {
  @Autowired
  TemplateEngine templateEngine;
  @Autowired
  private JavaMailSender emailSender;
  @Autowired
  private AccountRepository accountRepository;

  public void activeEmailMessage(VertifyEmail request) {
    MimeMessage message = emailSender.createMimeMessage();
    try {
      MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
      helper.setFrom("thatdeptraivjpro@26kleft.com");
      helper.setTo(request.getEmail());
      helper.setSubject("Active Email");

      Context context = new Context();
      context.setVariable("code", request.getCode());
      String htmlCode = templateEngine.process("mail/activeCode", context);

      // Set the HTML content of the email
      helper.setText(htmlCode, true);

      emailSender.send(message);
    } catch (MessagingException e) {
      // Handle exception
    }
  }

  public void resetEmailMessage(VertifyEmail request) {
    MimeMessage message = emailSender.createMimeMessage();
    try {
      MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
      helper.setFrom("thatdeptraivjpro@26kleft.com");
      helper.setTo(request.getEmail());
      helper.setSubject("Khôi phục mật khẩu Email");

      Context context = new Context();
      context.setVariable("code", request.getCode());
      String htmlCode = templateEngine.process("mail/resetCode", context);

      // Set the HTML content of the email
      helper.setText(htmlCode, true);
      emailSender.send(message);
    } catch (MessagingException e) {
      // Handle exception
    }
  }

  public void sendVoucherMail(Voucher voucher) {
    MimeMessage message = emailSender.createMimeMessage();
    accountRepository.findAll().stream().forEach(
        cutomer -> {
          try {
            System.out.println(
                "Start sending mail for custmoer" + cutomer.getEmail());
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("thatdeptraivjpro@26kleft.com");
            helper.setTo(cutomer.getEmail());
            helper.setSubject("Nhận Voucher mới");
            Context context = new Context();
            context.setVariable("fullNameCustomer", cutomer.getCustomer().getName());
            context.setVariable("codeVoucher", voucher.getCode());
            context.setVariable("valueVoucher", voucher.getDiscountValue());
            context.setVariable("conditionVoucher", voucher.getConditionVoucher());
            context.setVariable("startTime", voucher.getStart_time());
            context.setVariable("endTime", voucher.getEnd_time());
            context.setVariable("message", "Chúc quý khách có trải nghiệm mua sắm vui vẻ <3333");
            String htmlCode = templateEngine.process("mail/template-voucher", context);
            helper.setText(htmlCode, true);
            emailSender.send(message);
          } catch (MessagingException e) {
          }
        });
  }
}

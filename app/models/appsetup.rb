class Appsetup
  
  def self.sendmail(mail)    
    Mail.defaults do
      delivery_method(:smtp,
        address:  "smtp.gmail.com",
        port: 587,
        user_name: 'exp.sei16',
        domain: 'slup-blog.herokuapp.com',
        host: 'slup-blog.herokuapp.com',
        password: '10169022',
        authentication: 'plain',
        enable_starttls_auto: true)
    end
    
    Mail.deliver do
      from    mail.from
      to      mail.address
      cc      mail.cc
      bcc     mail.bcc
      subject mail.subject
      body    mail.header + I18n.t("usual.newline") + mail.text + I18n.t("usual.newline") + mail.footer
    end
  end
  
end
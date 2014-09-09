class Task < ActiveRecord::Base
  
  def self.getTasks(user)
    Task.where(user_id:user.id).order("tasks.priority asc").order("tasks.start_time asc")
  end
=begin
  def self.sendMail(user)
    tasks=self.getTasks(user)
    mailtext=I18n.t("reportmail.header").gsub(/name/, I18n.t("reportmail.name")) +I18n.t("usual.newline");
    num=0
    for text in tasks      
      num=num+1
      mailtext=mailtext+num.to_s+I18n.t("usual.doublespace")+I18n.t("usual.colon")+I18n.t("usual.doublespace")+
        text.name+I18n.t("usual.doublespace")+text.goal.to_s+I18n.t("usual.newline")
    end
    Appsetup.mail
    # example.co.jpサーバ宛てにメールを送信
    datestr=Time.now
    Appsetup.sendmail(I18n.t("reportmail.toaddress"),["sohara_contact9022@jcom.home.ne.jp"],
      I18n.t("reportmail.subject").gsub("date",datestr.month.to_s+datestr.day.to_s),mailtext+I18n.t("usual.newline")+I18n.t("reportmail.footer"))
  end
=end

end

class Taskmail < ActiveRecord::Base
  
  def self.getNewMail(user)
    tasks=Task.getTasks(user)
    taskmail = Taskmail.new
    taskmail.from="sohara_contact9022@jcom.home.ne.jp"
    datestr=Time.now
    
    if datestr.month.to_s.length == 1
      date_month = "0" + datestr.month.to_s
    else
      date_month = datestr.month.to_s
    end
    if datestr.day.to_s.length == 1
      date_day = "0" + datestr.day.to_s
    else
      date_day = datestr.month.to_s
    end
    
    taskmail.subject = "Daily report_" + date_month+date_day
    taskmail.header = "Thank you for your continued help." +  I18n.t("usual.newline") + "This is a report of the work of today.";
    taskmail.text=""
    taskmail.footer = "I hope the business will go well for both of us."+  I18n.t("usual.newline") +"From Seijyun Sohara."
    num=0
    for text in tasks      
      num=num+1
      taskmail.text=taskmail.text+num.to_s+I18n.t("usual.doublespace")+I18n.t("usual.colon")+I18n.t("usual.doublespace")+
        text.name+I18n.t("usual.doublespace")+I18n.t("usual.newline")+text.memo.to_s+I18n.t("usual.newline")
    end
    taskmail
  end
end

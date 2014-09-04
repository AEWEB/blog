class Taskmail < ActiveRecord::Base
  
  def self.getNewMail(user)
    tasks=Task.getTasks(user)
    taskmail = Taskmail.new
    taskmail.from="sohara_contact9022@jcom.home.ne.jp"
    datestr=Time.now
    taskmail.subject=I18n.t("reportmail.subject").gsub("date",datestr.month.to_s+datestr.day.to_s)
    taskmail.header=I18n.t("reportmail.header").gsub(/name/, I18n.t("reportmail.name")) +I18n.t("usual.newline");
    taskmail.text=""
    taskmail.footer=I18n.t("reportmail.footer")
    num=0
    for text in tasks      
      num=num+1
      taskmail.text=taskmail.text+num.to_s+I18n.t("usual.doublespace")+I18n.t("usual.colon")+I18n.t("usual.doublespace")+
        text.name+I18n.t("usual.doublespace")+text.goal.to_s+I18n.t("usual.newline")
    end
    taskmail
  end
end

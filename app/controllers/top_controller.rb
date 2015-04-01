class TopController < ApplicationController
  include TasksHelper
  before_action :set_task_list, only: [:index, :mail]

  def index
  end

  def mail
    day = Time.now.strftime("%m%d")
    line = '--------------------------------------------------'
    body_list = "#{line}\r\n"
    num = 1
    @tasks.each{|task|
      body_list = "#{body_list}#{num.to_s}　　#{task.name}　|#{@state_list[task.state.to_s]}|\r\n→　　#{task.goal}\r\n#{line}\r\n"
      num += 1
    }
    template = MailTemplate.new(
     from: 'sohara@genesis-healthcare.jp',
     to: 'miyahara@genesis-healthcare.jp',
     cc: 'kimura@genesis-healthcare.jp;asakawa@genesis-healthcare.jp;kashima@genesis-healthcare.jp;sohara@genesis-healthcare.jp;',
     subject: "Daily report_#{day}",#subject typeにより、日付を追加できるか判定するかな
     body: body_list,
     header: "To Mr.Miyahara

Thank you for your continued help.
This is a report of the work of today.
",
     footer: "I hope the business will go well for both of us.

From Seijyun Sohara."
    )
    if Rails.env != 'development'
      mail = Mail.new do
        from    template.from
        to      template.to
        bcc     template.bcc
        subject template.subject
        body    "#{template.header}\r\n#{template.body}\r\n#{template.footer}"
      end
      mail.delivery_method :smtp, { address:   'localhost',
        port:      25,domain:    'localhost'}
      mail.deliver!
    end
    render :text => nl2br("#{template.header}\r\n#{template.body}\r\n#{template.footer}")
  end

  private
    def set_task_list
      set_attribute_list
      @tasks = @current_user.tasks.categories(params[:category_id]).date_task(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    end
end

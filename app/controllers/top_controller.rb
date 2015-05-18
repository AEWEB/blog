class TopController < ApplicationController
  include TasksHelper
  before_action :set_task_list, only: [:index, :mail]

  def index
  end

  def mail
    day = Time.now.strftime("%m%d")
    line          = '---------------------------------------------------'
    today_line    = "◆◆◆◆◆ Today's task ◆◆◆◆◆"
    tommorow_line = "◆◆◆◆◆ Tommorow's task ◆◆◆◆◆"
    body_list = "#{today_line}\r\n"
    num = 1
    @pickup_tasks.each{|task|
      body_list = "#{body_list}#{num.to_s}　　#{task.name}　|#{@state_list[task.state.to_s]}|\r\n"
      pickup_histories(task).each do |task_history| 
        body_list = "#{body_list}#{task_history.memo}　→　#{Time.at(task_history.end_time - task_history.start_time).utc.strftime('%H:%M')}　"
      end
      num += 1
      body_list = "#{body_list}\r\n"
    }
    
    body_list = "#{body_list}\r\n#{tommorow_line}\r\n"
    num = 1
    @tasks.each{|task|
      body_list = "#{body_list}#{num.to_s}　　#{task.name}　|#{@state_list[task.state.to_s]}|\r\n→　　#{task.goal}\r\n#{line}\r\n"
      num += 1
    }
    template = MailTemplate.new(
     from: 'sohara@genesis-healthcare.jp',
     to: 'miyahara@genesis-healthcare.jp',
     cc: 'miyabe@genesis-healthcare.jp;kimura@genesis-healthcare.jp;asakawa@genesis-healthcare.jp;kashima@genesis-healthcare.jp;sohara@genesis-healthcare.jp;',
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
        cc      template.cc
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
      user_tasks = @current_user.tasks.categories(params[:category_id])
      @tasks = user_tasks.date_task(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
      @pickup_tasks = @current_user.tasks.categories(params[:category_id]).joins(:task_histories).
        merge(TaskHistory.date_histories((@search_time = Time.now.strftime("%Y-%m-%d")))).order("priority desc").uniq
    end
 
end

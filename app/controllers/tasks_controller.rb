class TasksController < ApplicationController
  include TasksHelper
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_task_list, only: [:index, :mail]

  def index
  end
  
  def mail
    day = Time.now.strftime("%m%d")
    body_list = ''
    @tasks.each{|task|
      body_list = "#{body_list}#{task.priority}　#{task.name}　#{task.goal}　#{task.memo}　#{task.state}　\r\n"
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
    render :text => template.to_yaml
  end

  def show
    @task_history = TaskHistory.new
    @task_histories = @task.task_histories.order_desc
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = @current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = @current_user.tasks.find_by(id:params[:id])
      redirect_to :controller => "top" unless @task
    end
    
    def set_task_list
      set_attribute_list
      @tasks = @current_user.tasks.categories(params[:category_id])
    end

    def task_params
      params.require(:task).permit(:name, :goal, :memo, :start_time, :end_time, :security, :state, :priority, :category_id)
    end
end

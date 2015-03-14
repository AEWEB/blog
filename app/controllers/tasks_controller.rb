class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_task_list, only: [:index, :mail]

  def index
  end
  
  def mail
    if Rails.env != 'development'
      mail = Mail.new do
        from    'sohara@genesis-healthcare.jp'
        to      'sohara@genesis-healthcare.jp'
        subject 'Mail from Mail'
        body    'There is a body.'
      end
      mail.delivery_method :smtp, { address:   'localhost',
        port:      25,domain:    'localhost'}
      mail.deliver!
    end
    render :text => 'メール送信済'
  end

  def show
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
      @tasks = @current_user.tasks.categories(params[:category_id])
    end

    def task_params
      params.require(:task).permit(:name, :goal, :memo, :start_time, :end_time, :security, :state, :priority, :category_id)
    end
end

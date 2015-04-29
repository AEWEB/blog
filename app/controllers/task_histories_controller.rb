class TaskHistoriesController < ApplicationController
  include TasksHelper
  before_action :set_task_history, only: [:update, :destroy]
  before_action :setup_task, only: [:create]

  # POST /task_histories
  # POST /task_histories.json
  def create
    if @task
      task_history = TaskHistory.new(task_history_params)
      task_history.task_id = @task.id
      task_history.save
    end
    @task_histories = @task.task_histories.order_desc
    render layout: false
  end

  # PATCH/PUT /task_histories/1
  # PATCH/PUT /task_histories/1.json
  def update
    @task_history.update(task_history_params)
    @task_histories = @task_history.task.task_histories.order_desc
    render layout: false
  end

  # DELETE /task_histories/1
  # DELETE /task_histories/1.json
  def destroy
    @task_history.destroy
    @task_histories = @task_history.task.task_histories.order_desc
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_history
      @task_history = TaskHistory.find_user(params[:id],@current_user.id)
      @task_histories = @task_history.task.task_histories.order_desc
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_history_params
      params.require(:task_history).permit(:memo)
    end
end

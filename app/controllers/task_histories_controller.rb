class TaskHistoriesController < ApplicationController
  before_action :set_task_history, only: [:show, :edit, :update, :destroy]

  # GET /task_histories
  # GET /task_histories.json
  def index
    @task_histories = TaskHistory.all
  end

  # GET /task_histories/1
  # GET /task_histories/1.json
  def show
  end

  # GET /task_histories/new
  def new
    @task_history = TaskHistory.new
  end

  # GET /task_histories/1/edit
  def edit
  end

  # POST /task_histories
  # POST /task_histories.json
  def create
    @task_history = TaskHistory.new(task_history_params)

    respond_to do |format|
      if @task_history.save
        format.html { redirect_to @task_history, notice: 'Task history was successfully created.' }
        format.json { render :show, status: :created, location: @task_history }
      else
        format.html { render :new }
        format.json { render json: @task_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_histories/1
  # PATCH/PUT /task_histories/1.json
  def update
    respond_to do |format|
      if @task_history.update(task_history_params)
        format.html { redirect_to @task_history, notice: 'Task history was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_history }
      else
        format.html { render :edit }
        format.json { render json: @task_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_histories/1
  # DELETE /task_histories/1.json
  def destroy
    @task_history.destroy
    respond_to do |format|
      format.html { redirect_to task_histories_url, notice: 'Task history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_history
      @task_history = TaskHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_history_params
      params.require(:task_history).permit(:memo, :date)
    end
end

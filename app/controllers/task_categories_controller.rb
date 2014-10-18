class TaskCategoriesController < ApplicationController
  
  include ProjectsHelper
  before_filter :current_project?
  before_action :set_task_category, only: [:show, :edit, :update, :destroy]

  # GET /task_categories
  # GET /task_categories.json
  def index
    @task_categories = TaskCategory.all
  end

  # GET /task_categories/1
  # GET /task_categories/1.json
  def show
  end

  # GET /task_categories/new
  def new
    @task_category = TaskCategory.new
  end

  # GET /task_categories/1/edit
  def edit
  end

  # POST /task_categories
  # POST /task_categories.json
  def create
    @task_category = TaskCategory.new(task_category_params)
    if @task_category.save
       project_task_category = ProjectTaskCategory.new(:project_id=>@current_project.id,:task_category_id=>@task_category.id)
       if project_task_category.save
         redirect_to @task_category,notice: "Sucess!!"
         return 
       end
       
    end
    render :new
  end

  # PATCH/PUT /task_categories/1
  # PATCH/PUT /task_categories/1.json
  def update
    respond_to do |format|
      if @task_category.update(task_category_params)
        format.html { redirect_to @task_category, notice: 'Task category was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_category }
      else
        format.html { render :edit }
        format.json { render json: @task_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_categories/1
  # DELETE /task_categories/1.json
  def destroy
    @task_category.destroy
    respond_to do |format|
      format.html { redirect_to task_categories_url, notice: 'Task category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_category
      @task_category = TaskCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_category_params
      params.require(:task_category).permit(:name)
    end
end

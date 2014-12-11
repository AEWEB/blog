module TaskCategoriesHelper
  
  def init_project_task_category(project)
    @current_project = project
    add_task_category?(TaskCategory.new(:name => I18n.t("category.default")))
  end
  
  def add_task_category?(task_category)
    if task_category.save
      project_task_category = ProjectTaskCategory.new(:project_id=>@current_project.id,:task_category_id=>task_category.id)
      project_task_category.save
    end 
  end
  
  #def 
  
  
end

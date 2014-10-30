module ProjectsHelper
  def current_project?
    setup_project
    if !@current_project
      redirect_to new_session_path
    end
  end
  
  def setup_project
    if !session[:project_id]
    else
      @current_project = Project.find(session[:project_id])
      logger.debug(@current_project.to_yaml)
    end
  end
  
  def storage_project(project)
     session[:project_id] = project.id
  end  
  
end

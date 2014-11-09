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
      project_user = ProjectUser.where(:project_id=>session[:project_id]).where(:user_id=>@current_user.id).first
      if project_user
         @current_project = project_user.project
         logger.debug(@current_project.to_yaml)
      end
    end
  end
  
  def storage_project(project)
     session[:project_id] = project.id
  end  
  
end

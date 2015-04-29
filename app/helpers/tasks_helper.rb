module TasksHelper
  
  def set_attribute_list
    @security_list = reverse_hash(Task.security_list)
    @state_list = reverse_hash(Task.state_list)
    @priority_list = reverse_hash(Task.priority_list)
  end
  
  def setup_task
    @task = @current_user.tasks.find_by(id:params[:task_id])
  end
  
end

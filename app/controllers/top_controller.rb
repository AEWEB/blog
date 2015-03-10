class TopController < ApplicationController
  def index
    @tasks = @current_user.tasks.categories(params[:category_id]).date_task(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
  end
end

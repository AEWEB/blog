class TopController < ApplicationController
  def index
     @tasks = @current_user.tasks.date_task(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
  end
end

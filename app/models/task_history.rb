class TaskHistory < ActiveRecord::Base
  include Util
  belongs_to :task
  
  scope :order_desc, -> { order(created_at: :desc) }
  scope :date_histories, ->(date) do
    where("task_histories.start_time >= ?", "#{date} 00:00:00").where("task_histories.end_time <= ?","#{date} 23:59:59")
  end
  
  class << self
    def find_user(id,user_id)
      begin
        @history if ((@history = find(id)).task.user.id) == user_id   
      rescue ActiveRecord::RecordNotFound => e
        log_output("error", "history not found.")
        nil
      end
    end
  end
end

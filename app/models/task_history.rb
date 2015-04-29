class TaskHistory < ActiveRecord::Base
  include Util
  belongs_to :task
  
  scope :order_desc, -> { order(created_at: :desc) }
  
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

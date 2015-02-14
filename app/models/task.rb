class Task < ActiveRecord::Base
  
  belongs_to :user
  validates :name, :length => {:in => (3..20)}
  validates :goal, :length =>{:in => (3..20)}
  validates :memo, :length => {:in => (0..500)}
  
  validates_datetime :start_time
  validates_datetime :end_time
  validates :security,
    :length => {:in => (1..3)},
    :numericality => {:only_integer => true}
  validates :state,
    :length =>  {:in => (1..3)},
    :numericality => {:only_integer => true}
  validates :priority,
    :length =>  {:in => (1..3)},
    :numericality => {:only_integer => true}
  
  
   scope :date_task, ->(date) do
    where("start_time <= ?", date).where("end_time >= ?",date).order("priority asc")
  end
  
end

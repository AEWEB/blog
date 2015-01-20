class Task < ActiveRecord::Base
  validates :name, :length => {:in => (3..20)}
  validates :goal, :length =>{:in => (3..20)}
  validates :memo, :length => {:in => (0..500)}
  
  validates_datetime :start_time
  validates_datetime :end_time
  validates :security,
    :length => {:in => (1..3)},
    :numericality => {:only_integer => true}
  validates :project_type,
    :length =>  {:in => (1..3)},
    :numericality => {:only_integer => true}
  
end

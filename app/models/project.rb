class Project < ActiveRecord::Base
  has_many :project_task_categories, dependent: :destroy
  
  validates :name, :length => {:in => (3..20)}
  validates :purpose, :length =>{:in => (3..20)}
  validates_datetime :start_time
  validates_datetime :end_time
  validates :security,
    :length => {:in => (1..3)},
    :numericality => {:only_integer => true}
  validates :project_type,
    :length =>  {:in => (1..3)},
    :numericality => {:only_integer => true}
  validates :memo, :length => {:in => (0..500)}
  
end

class Task < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :category
  validates :name, :length => {:in => (3..50)}
  validates :goal, :length =>{:in => (3..50)}
  validates :memo, :length => {:in => (0..500)}
  
  validates_datetime :start_time
  validates_datetime :end_time
  validates :security,
    :length => {:in => (1..1)},
    :numericality => {:only_integer => true}
  validates :state,
    :length =>  {:in => (1..1)},
    :numericality => {:only_integer => true}
  validates :priority,
    :length =>  {:in => (1..1)},
    :numericality => {:only_integer => true}
  
  
  scope :date_task, ->(date) do
    where("start_time <= ?", date).where("end_time >= ?",date).order("priority asc")
  end
  
  def self.security_list
    {I18n.t("task.security.public") => "0",I18n.t("task.security.private") => "1"}
  end
  
  def self.state_list
    {I18n.t("task.state.not_started") => "0",I18n.t("task.state.started") => "1",I18n.t("task.state.progress") => "2",
     I18n.t("task.state.hold") => "3", I18n.t("task.state.resolved") => "4", I18n.t("task.state.complete") => "5"}
  end
  
  def self.priority_list
    {I18n.t("task.priority.low") => "0",I18n.t("task.priority.middle") => "1",I18n.t("task.priority.high") => "2",
     I18n.t("task.priority.urgent") => "3",I18n.t("task.priority.right_now") => "4"}
  end
  
end

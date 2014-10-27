class Project < ActiveRecord::Base
  has_many :project_task_categories, dependent: :destroy
end

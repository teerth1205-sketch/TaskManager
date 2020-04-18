class Project < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy
    has_many :project_users,  dependent: :destroy
    has_many :users, through: :project_users
    has_many :users_with_tasks, through: :tasks, source: :user 
end

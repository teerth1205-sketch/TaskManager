class Project < ApplicationRecord
    belongs_to :user
    has_many :tasks
    has_many :users thorugh: :tasks
end

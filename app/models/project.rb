class Project < ApplicationRecord
    has_many :tasks
    has_many :users thorugh: :tasks
end

class Task < ApplicationRecord
    belongs_to :user
    belongs_to :project , optional: true 
end

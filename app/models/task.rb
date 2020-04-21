class Task < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :project , optional: true 
    
    validates_presence_of :title, :content, :date
end

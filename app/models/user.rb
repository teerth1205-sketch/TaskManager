class User < ApplicationRecord
has_secure_password
has_many :tasks
has_many :project_users
has_many :projects, through: :project_users
has_many :projects_with_tasks, through: :tasks, source: :project

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"], :name => auth_hash["info"]["name"]).first_or_create do |user|
             user.password = SecureRandom.hex
        end
    end 
    
    #def self.search(q) 
     #    self.where("name LIKE ?", "%#{params[:q]}%")
    #end 


end

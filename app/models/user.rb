class User < ApplicationRecord
has_secure_password
has_many :tasks
has_many :project_users
has_many :projects, through: :project_users
has_many :projects_with_tasks, through: :tasks, source: :project

validates_presence_of :name, :email
validates_uniqueness_of :email

scope :search_users, ->(name) {where('name LIKE ?', "%#{name}%") }
validates :email, uniqueness: true
    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"], :name => auth_hash["info"]["name"]).first_or_create do |user|
             user.password = SecureRandom.hex
        end
    end 
    
   
     #    self.where("name LIKE ?", "%#{params[:q]}%")
    #end 


end

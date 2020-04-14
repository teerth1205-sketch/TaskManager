A rails website that allows one to log in and create tasks, and projects, projects will have many tasks and tasks will belong to project and user. 


user model 
name 
username 
password 
has_many tasks 
has many projects through tasks 
has many comments 
has many commented_projects through comments, source: :project

Task model 
title 
date 
content 
belongs_to user
belongs_to project


Project Model 
title 
content 
belongs_to user 
has_many tasks 
has_many users through tasks
has_many comments 
#has many users_comments, though comments, source: :user

Comment model  
content 
belongs to user
belongs to project

Views

homepage
users project 
users tasks
 

project page has all the members of the project 
creator can edit the project
shows which task was completed by who 


task/:id/edit 
project/task/id  



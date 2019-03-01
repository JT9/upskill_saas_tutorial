class Plan < ActiveRecord::Base
  #Basic and Pro plan can have many users with Associations
  has_many :users
end
class Plan < ActiveRecord::Base
  #Basic and Pro plan can have many users
  has_many :users
end
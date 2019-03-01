class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #each user should belong to a plan for Basic and Pro from -> plan.rb 
  #(Associations)
  belongs_to :plan
end
